import 'package:flutter/material.dart';

import 'package:pin_code_screen/src/models/pin_input_decoration.dart';
import 'package:pin_code_screen/src/widgets/pin_code.dart';

class PinCodeScreen extends StatelessWidget {
  final int size;
  final Widget? child;
  final Widget? retryWidget;
  final PreferredSizeWidget? appBar;
  final ButtonStyleButton? button;
  final PinInputTheme? theme;
  final Function(BuildContext context, String value) validator;

  const PinCodeScreen({
    Key? key,
    required this.size,
    this.child,
    this.retryWidget,
    this.appBar,
    this.button,
    this.theme,
    required this.validator,
  })  : assert(
          (size > 2 && size < 6),
          "OTP code size out of range",
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Container(
          margin: theme?.margin,
          padding: theme?.padding,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: child,
              ),
              Container(
                padding: theme?.padding,
                child: Column(
                  children: [
                    PinCodeWidget(
                      size: size,
                      validator: validator,
                      theme: theme,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: retryWidget,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: button,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
