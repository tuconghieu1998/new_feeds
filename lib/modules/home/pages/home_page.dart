import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/blocs/app_state_bloc.dart';
import 'package:news_feed/common/mixin/scroll_page_mixin.dart';
import 'package:news_feed/common/widgets/stateful/search_bar.dart';
import 'package:news_feed/common/widgets/stateless/circle_icon_button.dart';
import 'package:news_feed/modules/home/blocs/list_posts_rxdart_bloc.dart';
import 'package:news_feed/modules/home/blocs/post_bloc.dart';
import 'package:news_feed/modules/home/models/post.dart';
import 'package:news_feed/modules/home/pages/create_post_page.dart';
import 'package:news_feed/modules/home/widgets/post_item.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ScrollPageMixin {
  ListPostRxDartBloc? get bloc => BlocProvider.of<ListPostRxDartBloc>(context);
  AppStateBloc? get appStateBloc => BlocProvider.of<AppStateBloc>(context);
  final _scrollCtrl = ScrollController();

  String constructFCMPayload(String token, String title, String body) {
  return jsonEncode({
    'to': token,
    'priority': 'high',
    'data': {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'status': 'done',
      'title': title,
      'body': body
    },
    'notification': {
      'title': title,
      'body': body,
      'android_channel_id': "cherry_id"
    },
  });
}

  Future<void> sendPushMessage(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=AAAAFQ2WQ8M:APA91bFB8S6npHFwBCQtDYjnJmt813zuk75IrbVrDq5bgq2fx57F3YvvghACqIqidi7eF-NUYczsfRX1TEDisP9VPVwNKN9C1XjTk2qnVJetAAEbZPO7dTEmZXqkoJSSLINQOhehWrG0'
        },
        body: constructFCMPayload(token, title, body),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              Expanded(child: SearchBar()),
              SizedBox(width: 15,),
              CircleIconButton(onTap: () {
                Navigator.of(context).pushNamed(CreatePostPage.routeName);
              })
            ],
          ),
        ),
        ElevatedButton(onPressed: () async {
          String name = "User1";
          String titleTest = "TitleTest";
          String bodyTest = "bodyTest";
          if(name!="") {
            DocumentSnapshot snap = await FirebaseFirestore.instance.collection("UserTokens").doc(name).get();
            String token = snap['token'];
            print(token);
            sendPushMessage(token, bodyTest, titleTest);
          }

        }, child: const Text('Test Notify')),
        Expanded(
          child: StreamBuilder<List<Post>?>(
            stream: bloc!.postsStream,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                final posts = snapshot.data;
                if(posts!.isNotEmpty) {
                  return ListView.builder(
                    controller: _scrollCtrl,
                    itemCount: posts.length,
                    itemBuilder: (_, int index) {
                      final item = posts[index];
                      return BlocProvider(
                        child: PostItem(data: item),
                        bloc: PostBloc()
                      );
                       
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
            }),
        ) 
      ],
    );
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }
  
  @override
  void loadMoreData() {
    bloc?.getPosts();
  }
  
  @override
  ScrollController get scrollController => _scrollCtrl;
}