import 'dart:convert';
import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:bodoo_flutter/Views/Pages/dashboard.dart';
import 'package:bodoo_flutter/Views/Pages/userdetails_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../Services/api.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    Provider.of<AuthProvider>(context,listen: false).setAccessToken(googleAuth.accessToken!);
    FirebaseAuth.instance.signInWithCredential(credential).then(
          (UserCredential userCredential) async {
        var userEmail = await checkEmail(userCredential.user!.email!);
        Provider.of<AuthProvider>(context,listen: false).setEmail(userCredential.user!.email!);

        if (userEmail == true) {
         await  Provider.of<AuthProvider>(context,listen: false).googleSignin(userCredential.user!.email!,googleAuth.accessToken!,context);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Dashboard()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UserDetailsForm()));
        }
        notifyListeners();
      },
    );
  }

  checkEmail(String email) async {
    String apiUrl = '${Api.baseUrlAccount}check_email/';

    Map<String, String> body = {'email': email};


    http.Response response = await http.post(Uri.parse(apiUrl), body: body);
    print("response for email ${response.body}");
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data['user_exists'];
    } else {
      return null;
    }
  }
}