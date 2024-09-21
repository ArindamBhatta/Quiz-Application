import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.optionText,
    required this.userChosenAnswerTapped,
  });
  final String optionText;
  final void Function() userChosenAnswerTapped;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: userChosenAnswerTapped,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            40.0,
          ),
        ),
      ),
      child: Text(optionText),
    );
  }
}
