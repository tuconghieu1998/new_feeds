import 'package:flutter/material.dart';
import 'package:news_feed/all_screens.dart';
import 'package:news_feed/common_widget_screen.dart';
import 'package:news_feed/modules/authentication/login_page.dart';
import 'package:news_feed/modules/authentication/pages/create_account_page.dart';
import 'package:news_feed/modules/authentication/pages/forgot_password_page.dart';
import 'package:news_feed/modules/authentication/pages/login_page.dart';
import 'package:news_feed/modules/authentication/pages/login_or_sign_up_page.dart';
import 'package:news_feed/modules/category/pages/donwload_img_page.dart';
import 'package:news_feed/modules/category/pages/dowload_file_demo.dart';
import 'package:news_feed/modules/category/pages/list_category.dart';
import 'package:news_feed/modules/home/blocs/comment_bloc.dart';
import 'package:news_feed/modules/home/blocs/home_feed_rxdart_bloc.dart';
import 'package:news_feed/modules/home/blocs/list_posts_rxdart_bloc.dart';
import 'package:news_feed/modules/home/pages/comment_page.dart';
import 'package:news_feed/modules/home/pages/create_post_page.dart';
import 'package:news_feed/modules/home/pages/home_page.dart';
import 'package:news_feed/modules/home/repos/home_feed_repo.dart';
import 'package:news_feed/modules/main_app.dart';
import 'package:news_feed/modules/message/pages/friend_page.dart';
import 'package:news_feed/modules/message/pages/invite_friend_page.dart';
import 'package:news_feed/modules/profile/pages/edit_profile_page.dart';
import 'package:news_feed/modules/setting/page/setting_page.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:news_feed/routes/route_name.dart';

final Map<String, WidgetBuilder> routes = {
  CommonWidgetScreen.routeName: (context) => const CommonWidgetScreen(),
  MainApp.routeName: (context) => const MainApp(),
  FriendPage.routeName: (context) => const FriendPage(),
  InviteFriendPage.routeName: (context) => const InviteFriendPage(),
  ListCategory.routeName: (context) => const ListCategory(),
  DownloadImgPage.routeName: (context) => const DownloadImgPage(),
  DownloadFileDemo.routeName: (context) => const DownloadFileDemo(),
  LoginTestPage.routeName: (context) => const LoginTestPage(),
  LoginPage.routeName: (context) => const LoginPage(),
  LoginOrSignUpPage.routeName: (context) => const LoginOrSignUpPage(),
  ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
  CreateAccountPage.routeName: (context) => const CreateAccountPage(),
};

class Routes {
  static Route authorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(
          settings,
          //const MainApp()
          BlocProvider(
            bloc: ListPostRxDartBloc()..getPosts(),
            child: const MainApp(),
          ),
        );
      case CommentPage.routeName:
        final arguments = settings.arguments as Map; 
        final postId = arguments['postId'];
        return _buildRoute(
          settings, 
          BlocProvider(
            bloc: CommentBloc()..getComments(postId),
            child: CommentPage(postId: postId)
        ));
      case CreatePostPage.routeName:
        return _buildRoute(
          settings,
          const CreatePostPage()
        );
      case EditProfilePage.routeName:
        return _buildRoute(
          settings,
          const EditProfilePage()
        );
      case SettingPage.routeName:
        return _buildRoute(
          settings,
          const SettingPage()
        );
      //case RouteName.profile:
      // return _buildRouteDialog(
      //   settings,
      //   const HomePage()
      //   // const CreatePostPage(),
      // );
      default:
        return _errorRoute();
    }
  }

  static Route unAuthorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(
          settings,
          const LoginPage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Coming soon'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static MaterialPageRoute _buildRouteDialog(
      RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      fullscreenDialog: true,
      builder: (BuildContext context) => builder,
    );
  }
}
