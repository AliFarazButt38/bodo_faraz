import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Facebook extends StatefulWidget {
  const Facebook({Key? key}) : super(key: key);

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    _checkIfisLoggedIn();
  }

  _checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = false;
    });

    if (accessToken != null) {
      print(accessToken.toJson());
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      print(userData);
    } else {
      print(result.status);
      print(result.message);
    }
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    print('');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Facebook Auth Project')),
        body: Center(
          child: ElevatedButton(
            child: Text(
              'LOGIN',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: _login,
          ),
        ),
      ),
    );
  }
}
