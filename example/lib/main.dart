import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_screen/pin_code_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PinCodeScreen(
        size: 5,
        validator: (BuildContext context, String value) {},
        appBar: AppBar(
          title: Text(
            "OTP Verification",
          ),
          centerTitle: true,
        ),
        button: ElevatedButton(
          onPressed: () {},
          child: Text("Verify"),
        ),
        retryWidget: Center(
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Didn\'t get the code? ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'Resend',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // launch(
                      //   'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                      // );
                    },
                ),
              ],
            ),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              // Technology illustrations by Storyset perfect from https://storyset.com/technologygi
              "assets/Mobile apps.gif",
              height: 350.0,
              width: 350.0,
            ),
            Text(
              "Sent verification to +65225986",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
