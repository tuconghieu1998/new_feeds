import 'package:flutter/material.dart';
import 'package:news_feed/blocs/app_state_bloc.dart';
import 'package:news_feed/common/widgets/stateful/search_bar.dart';
import 'package:news_feed/common/widgets/stateless/circle_icon_button.dart';
import 'package:news_feed/modules/home/blocs/home_feed_rxdart_bloc.dart';
import 'package:news_feed/modules/home/models/post.dart';
import 'package:news_feed/modules/home/widgets/post_item.dart';
import 'package:news_feed/providers/bloc_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeFeedRxDartBloc? get bloc => BlocProvider.of<HomeFeedRxDartBloc>(context);
  AppStateBloc? get appStateBloc => BlocProvider.of<AppStateBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: const [
              Expanded(child: SearchBar()),
              SizedBox(width: 15,),
              CircleIconButton()
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder<List<Post>?>(
            stream: bloc!.postsStream,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                final posts = snapshot.data;
                if(posts!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (_, int index) {
                      final item = posts[index];
                      return PostItem(data: item);
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
}