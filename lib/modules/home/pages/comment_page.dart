import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateless/top_bar_widget.dart';
import 'package:news_feed/modules/home/blocs/comment_bloc.dart';
import 'package:news_feed/modules/home/models/comment.dart';
import 'package:news_feed/modules/home/widgets/comment_item.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key, required this.postId});

  final String postId;
  static const String routeName = '/comments';

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  CommentBloc? get bloc => BlocProvider.of<CommentBloc>(context);

  late final TextEditingController _textCommentCtrl;
  late final FocusNode _focusNodeTextComment;

  @override
  void initState() {
    super.initState();
    _textCommentCtrl = TextEditingController();
    _focusNodeTextComment = FocusNode();
  }

  @override
  void dispose() {
    _textCommentCtrl.dispose();
    _focusNodeTextComment.dispose();
    super.dispose();
  }

  void postComment() async {
    try {
      final text = _textCommentCtrl.text;
      if(text == "") return;
      _textCommentCtrl.clear();
      _focusNodeTextComment.unfocus();
      final res = await bloc?.postComment(widget.postId, text, const []);
      print("Comment post ${widget.postId}, $text");
    }
    catch(e) {

    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const TopBarWidget(title: "Comments"),
          Expanded(
            child: StreamBuilder<List<Comment>?>(
                stream: bloc!.commentsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final comments = snapshot.data;
                    if (comments!.isNotEmpty) {
                      return ListView.builder(
                          itemCount: comments.length,
                          itemBuilder: (_, int index) {
                            final item = comments[index];
                            return CommentItem(data: item);
                          });
                    }
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 150),
                        child: Text(
                          "Not Comments yet",
                          style: AppStylesText.body20.copyWith(
                              fontSize: 15, color: AppColor.unselectItems),
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff20242F),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textCommentCtrl,
                      focusNode: _focusNodeTextComment,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColor.grayTextField,
                          contentPadding:
                              const EdgeInsets.only(left: 20, right: 20),
                          hintText: 'Write a comment ...',
                          hintStyle: AppStylesText.body15
                              .copyWith(color: Colors.white),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              borderSide: BorderSide.none),
                          focusColor: Colors.black),
                      style: AppStylesText.body15,
                    ),
                  ),
                  GestureDetector(
                    onTap: postComment,
                    child: const ImageIcon(
                      AssetImage(AssetUtils.icoSendMessage),
                      size: 48,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
