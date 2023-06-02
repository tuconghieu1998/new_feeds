import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_feed/common/widgets/stateful/upload/manage_group/upload_group_value.dart';
import 'package:news_feed/common/widgets/stateful/upload/widgets/image_upload_group.dart';
import 'package:news_feed/common/widgets/stateful/upload/widgets/image_upload_item.dart';
import 'package:news_feed/common/widgets/stateless/flex_button.dart';
import 'package:news_feed/common/widgets/stateless/loading_hide_keyboard.dart';
import 'package:news_feed/modules/home/blocs/create_post_bloc.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  static const String routeName = "/create_post";

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  bool isLoading = false;
  late final TextEditingController _desCtrl;
  late final FocusNode _focusNodeDes;
  UploadGroupValue _currentGroupUploadValue =
      const UploadGroupValue(<ImageUploadItem>[]);
  final _createPostBloc = CreatePostBloc();

  @override
  void initState() {
    super.initState();
    _desCtrl = TextEditingController();
    _focusNodeDes = FocusNode();
  }

  @override
  void dispose() {
    _desCtrl.dispose();
    _focusNodeDes.dispose();
    super.dispose();
  }

  void createPost() async {
    try {
      final res = await _createPostBloc.createPost(
          _desCtrl.text, _currentGroupUploadValue.uploadedIds);

      if(res){
        Navigator.pop(context);
        return;
      }

      // show popup error
    } catch (e) {}
  }

  Widget buildButtonUpload() {
    final state = _currentGroupUploadValue.state;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: FlexButton(
        onTap: state == UploadGroupState.uploading ? null : createPost,
        text: 'Create Post'
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoadingHideKeyboard(
          isLoading: isLoading,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Create new status", style: AppStylesText.headLine2,),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: TextField(
                          controller: _desCtrl,
                          focusNode: _focusNodeDes,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type description here...',
                            filled: true,
                            fillColor: AppColor.unselectItems
                          ),
                          autocorrect: false,
                          minLines: 5,
                          maxLines: 15,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(300),
                          ],
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ImageUploadGroup(
                        isFullGrid: false,
                        onValueChanged: (UploadGroupValue value) {
                          setState(() {
                            _currentGroupUploadValue = value;
                          });
                        },
                        listImages: const [],
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: buildButtonUpload(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}