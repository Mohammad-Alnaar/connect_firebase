import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField(
      {super.key,
      required this.textEditingController,
      required this.myFocusNode,
      required this.myTextInputAction,
      required this.labelText,
      required this.prefexIcon,
      required this.suffixIcon,
      });
  final TextEditingController textEditingController;
  final FocusNode myFocusNode;
  final TextInputAction myTextInputAction;
  final String labelText;
final Icon prefexIcon;
final Icon suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      focusNode: myFocusNode,
      textInputAction: myTextInputAction,
      decoration: InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      label: Text(labelText),
      prefixIcon: prefexIcon,
      suffix: IconButton(icon: , onPressed: ,)
      ),
    );
  }

  State<MyTextFormField> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
