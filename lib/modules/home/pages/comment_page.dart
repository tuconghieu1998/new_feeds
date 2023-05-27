import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateless/top_bar_widget.dart';
import 'package:news_feed/modules/home/blocs/comment_bloc.dart';
import 'package:news_feed/modules/home/models/comment.dart';
import 'package:news_feed/modules/home/widgets/comment_item.dart';
import 'package:news_feed/providers/bloc_provider.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  static const String routeName = '/comments';

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  CommentBloc? get bloc => BlocProvider.of<CommentBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const TopBarWidget(title: "Comments"),
          Expanded(
            child: StreamBuilder<List<Comment>?>(
              stream: bloc!.commentsStream,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  final comments = snapshot.data;
                  if(comments!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (_, int index) {
                        final item = comments[index];
                        return CommentItem(data: item);
                      }
                    );
                  }
                }
                if(snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              ),
          )
        ],)
      ),
    );
  }
}