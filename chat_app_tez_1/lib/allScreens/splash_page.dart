import 'package:chat_app_tez_1/allConstants/color_constants.dart';
import 'package:chat_app_tez_1/allConstants/constants.dart';
import 'package:chat_app_tez_1/allProviders/auth_provider.dart';
import 'package:chat_app_tez_1/allScreens/home_page.dart';
import 'package:chat_app_tez_1/allScreens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      return;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "images/splash.png",
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              "Sohbet Uygulaması",
              style: TextStyle(color: ColorConstants.themeColor),
            ),
            const SizedBox(height: 20),
            Container(
              width: 20,
              height: 20,
              child: const CircularProgressIndicator(
                color: ColorConstants.themeColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
