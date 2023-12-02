import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void signOut() async {
    final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
    await auth.signOut();
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.disconnect();
    } else if (accessToken != null) {
      await FacebookAuth.instance.logOut();
    }
  }
}
