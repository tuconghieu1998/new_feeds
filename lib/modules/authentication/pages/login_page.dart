import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_feed/common/widgets/stateless/common_text_field.dart';
import 'package:news_feed/common/widgets/stateless/error_popup.dart';
import 'package:news_feed/common/widgets/stateless/flex_button.dart';
import 'package:news_feed/providers/bloc_provider.dart';

import '../../../blocs/app_state_bloc.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/styles_text.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/image_utils.dart';
import '../blocs/authentication_bloc.dart';
import '../enum/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = "/login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppStateBloc? get appStateBloc => BlocProvider.of<AppStateBloc>(context);
  AuthenticationBloc? get authenBloc =>
      BlocProvider.of<AuthenticationBloc>(context);

  
  Future<void> _signInWithGmail() async {
    // loading!(true);
    try {
      final loginState = await authenBloc!.loginWithGmail();
      switch (loginState) {
      case LoginState.success:
        return _changeAppState();
      case LoginState.newUser:
        // handle flow newUser
        break;
      default:
        break;
    }
    } on PlatformException catch (e) {
      // loading!(false);
      _handleErrorPlatformException(e);
    } catch (e) {
      _showDialog('Something went wrong!!!');
    }
  }

  void _changeAppState() {
    appStateBloc!.changeAppState(AppState.authorized);
  }

  void _handleErrorPlatformException(PlatformException e) {
    if (e.code != 'ERROR_ABORTED_BY_USER') {
      _showDialog(e.message ?? '');
    }
  }

  void _showDialog(String content) {
    showDialog(
      context: context,
      builder: (ctx) => ErrorPopup(content: content),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          ImageUtils.loadFromAsset(AssetUtils.backgroundImage2,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
                gradient: AppColor.scrimDarkerTop30Bottom100),
          )),
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const SizedBox(
                height: 28,
                width: 28,
                child: Center(child: ImageIcon(AssetImage(AssetUtils.icoArrowLeft), color: Colors.white, size: 28,)),
              ),
            )
            ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
          left: 0,
          right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back",
                    style: AppStylesText.headLine1.copyWith(fontSize: 34),
                  ),
                  Text(
                    "Login to your account",
                    style: AppStylesText.body15.regular.copyWith(fontSize: 17),
                  ),
                  const SizedBox(height: 58,),
                  const CommonTextField(
                    placeHolder: "Email",
                  ),
                  const SizedBox(height: 10,),
                  const CommonTextField(
                    placeHolder: "Password",
                  ),
                  const SizedBox(height: 40,),
                  FlexButton(
                    text: "LOGIN",
                    onTap: () => _signInWithGmail(),
                  ),
                  const SizedBox(height: 53,),
                  Center(
                    child: Text(
                      "Forgot your password?",
                      style: AppStylesText.body15.regular.copyWith(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
