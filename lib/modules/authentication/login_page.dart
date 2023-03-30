import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_feed/constants.dart';

class LoginTestPage extends StatelessWidget {
  const LoginTestPage({super.key});

  static const String routeName = "/test_login_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoginPage")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                final firebaseAccount = _signInWithGoogle();
                print("firebaseAccout $firebaseAccount");
              },
              child: const Text("Sign in with Google"),
              ),
              ElevatedButton(
              onPressed: () {
                _signInWithDofHunt();
              },
              child: const Text("Sign in with Dofhunt"),
              ),
          ],
        ) 
        
        ),
    );
  }

  Future<UserCredential> _signInWithGoogle() async {
    debugPrint("accessToken1");
    // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  debugPrint("accessToken ${googleAuth?.accessToken}");

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> _signInWithDofHunt() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    debugPrint("accessToken ${googleAuth?.accessToken}");

    final dio = Dio(BaseOptions(baseUrl: AppContants.apiDomain));
    final authResponse = await dio.post('/v1/auth/gmail', 
    data: {
      'gmail_token': googleAuth?.accessToken
    });

    final accessToken = authResponse.data["data"]['access_token'];
    print('accessTokenDofHunt ${accessToken}');

    final profileResponse = await dio.get(
      '/v1/profile',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken'
        }
      )
    );

    print('profile ${profileResponse.data['data']}');

  }
}