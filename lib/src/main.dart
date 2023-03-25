import 'package:flutter/material.dart';

import 'package:pin_code_screen/src/widgets/pin_code.dart';

class PinCodeScreen extends StatelessWidget {
  final int size;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Widget? retryWidget;
  final PreferredSizeWidget? appBar;
  final ButtonStyleButton? button;
  final Function(BuildContext context, String value) validator;

  const PinCodeScreen({
    Key? key,
    required this.size,
    this.padding,
    this.margin,
    this.child,
    this.retryWidget,
    this.appBar,
    this.button,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Container(
          margin: margin,
          padding: padding,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: child,
              ),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    PinCodeWidget(
                      size: size,
                      validator: validator,
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
