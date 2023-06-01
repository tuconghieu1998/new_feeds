import 'package:news_feed/providers/bloc_provider.dart';
import 'package:news_feed/resource/paging_repo.dart';
import 'package:rxdart/rxdart.dart';

abstract class PagingDataBehaviorBloc<T> extends BlocBase {

  final _dataSubject = BehaviorSubject<List<T>?>();
  BehaviorSubject<List<T>?> get dataSubject => _dataSubject;
  Stream<List<T>?> get dataStream => _dataSubject.stream;
  List<T>? get dataValue => _dataSubject.stream.value;

  final BehaviorSubject<bool> isLoadingSubject = BehaviorSubject.seeded(false);
  Stream<bool> get isLoadingStream => isLoadingSubject.stream;
  bool get isLoadingValue => isLoadingSubject.stream.value;

  PagingRepo get dataRepo;

  Future<void> getData({Map<String, dynamic>? queryObj}) async {
    if(isLoadingSubject.stream.value) {
      return;
    }
    if(!isLoadingSubject.isClosed) {
      isLoadingSubject.sink.add(true);
    }

    try {
      final result = await dataRepo.getData(queryObj: queryObj);
      dataRepo.isFirstPage
        ? _dataSubject.sink.add(result as List<T>?)
        : _dataSubject.sink.add(
          [..._dataSubject.stream.value ?? [], ...result as Iterable<T>]
        );

    }
    catch(e) {
      _dataSubject.sink.addError(e);
    }
    finally {
      Future.delayed(const Duration(microseconds: 300), () {
        if(!isLoadingSubject.isClosed) {
          isLoadingSubject.sink.add(false);
        }
      });
    }
  }

  Future<void> refresh() {
    dataRepo.refresh();
    return getData();
  }

  void clearPaging() {
    dataRepo.refresh();
  }

  @override
  void dispose() {
    _dataSubject.close();
  }
}