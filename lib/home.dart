import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor_sample/config/appconfig.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.appConfig,
    this.isSiginContain = false,
  });

  final String title;
  final AppConfig appConfig;
  final bool isSiginContain;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userData = "";
  bool loading = false;
  bool signinSuccess = false;

  _signIn() async {
    setState(() {
      loading = true;
    });
    try {
      var res = await FirebaseAuth.instance.signInAnonymously();
      userData = res.user != null ? "Anonymous Signin Success:${res.user}" : "";
      signinSuccess = true;
      setState(() {
        loading = false;
      });
    } catch (e) {
      userData = e.toString();
      signinSuccess = false;
      setState(() {
        loading = false;
      });
    }
  }

  _signOut() async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance.signOut();
      userData = "";
      setState(() {
        loading = false;
        signinSuccess = false;
      });
    } catch (e) {
      userData = e.toString();
      loading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          if (widget.isSiginContain)
            TextButton(
              onPressed: () {
                if (signinSuccess) {
                  _signOut();
                } else {
                  _signIn();
                }
              },
              child: Text(signinSuccess ? "Sign Out" : "Sign In"),
            ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Current Flavor is:',
            ),
            Text(
              widget.appConfig.appFlavorName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (loading) const CircularProgressIndicator(),
            if (userData.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5,
                ),
                child: Text(userData),
              ),
          ],
        ),
      ),
    );
  }
}
