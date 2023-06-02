import 'package:flutter/material.dart';
import '../widgets/image_upload_item.dart';
import 'upload_group_value.dart';

class UploadGroupStateController extends ValueNotifier<UploadGroupValue> {
  UploadGroupStateController()
      : super(const UploadGroupValue(<ImageUploadItem>[]));

  set state(UploadGroupValue state) {
    value = state;
  }
}