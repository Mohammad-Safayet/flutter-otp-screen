import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinCodeWidget extends StatefulWidget {
  const PinCodeWidget({
    Key? key,
    required this.size,
    required this.validator,
  }) : super(key: key);

  final int size;
  final Function(BuildContext, String) validator;


  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  late List<String> code;
  late List<TextEditingController> _textEditingController;
  late List<FocusNode> _focusNode;

  final TextEditingValue zwspEditingValue = const TextEditingValue(
    text: '\u200b',
    selection: TextSelection(baseOffset: 1, extentOffset: 1),
  );

  @override
  void initState() {
    super.initState();

    code = List.generate(widget.size, (index) => "");

    _focusNode = List.generate(widget.size, (index) => FocusNode());
    _textEditingController = List.generate(widget.size, (index) {
      final ctrl = TextEditingController();
      ctrl.value = zwspEditingValue;
      return ctrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.size,
        (index) => Container(
          height: 58,
          width: 54,
          decoration: BoxDecoration(
            color: Colors.white60,
            border: Border.all(
              width: 1.5,
              color: Colors.purple,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: TextFormField(
            onChanged: (value) {
              textFieldOnChange(index, value);
            },
            decoration: const InputDecoration(
              counterText: "",
              border: InputBorder.none,
            ),
            textInputAction: index < code.length
                ? TextInputAction.next
                : TextInputAction.done,
            controller: _textEditingController[index],
            focusNode: _focusNode[index],
            style: Theme.of(context).textTheme.headlineMedium,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          ),
        ),
      ),
    );
  }

  void textFieldOnChange(int index, String value) async {
    code[index] = value.replaceAll('\u200b', '');
    if (value.length > 1) {
      if (index + 1 == _focusNode.length) {
        FocusScope.of(context).unfocus();
        final result = _constructString();
        debugPrint("result: $result");
        widget.validator(context, result);
      } else {
        _focusNode[index + 1].requestFocus();
      }
    } else {
      _textEditingController[index].value = zwspEditingValue;
      if (index == 0) {
        FocusScope.of(context).unfocus();
      } else {
        _textEditingController[index - 1].value = zwspEditingValue;
        _focusNode[index - 1].requestFocus();
      }
    }
  }

  String _constructString() {
    String result = "";

    for (var element in code) {
      result += element;
    }

    return result;
  }
}
