import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textFieldController;
  const InputTextField(
      {Key? key, required this.textFieldController, this.hintText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldController,
      maxLength: 30,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        counter: const SizedBox.shrink(),
        border: InputBorder.none,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.2)),
        fillColor: const Color(0xFFE9E9E9).withOpacity(0.5),
      ),
    );
  }
}
