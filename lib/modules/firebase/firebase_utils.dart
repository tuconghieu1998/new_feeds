import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class FirebaseUtils {
  static FirebaseUtils? _instance;
  factory FirebaseUtils() => _instance ??= FirebaseUtils._();

  FirebaseUtils._();

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

  Future<String> getTokenByUsername(String username) async {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection("UserTokens").doc(username).get();
    return snap['token'];
  }
}