import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn(
  clientId:
      '697167382114-nujuthdosfcij3ii78fb8bec1getr67a.apps.googleusercontent.com',
);

class AuthService {
  // Google Sign In

  signInWithGoogle() async {
    //begin interactive sign-in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from the request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // finally, Let's Sign
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
