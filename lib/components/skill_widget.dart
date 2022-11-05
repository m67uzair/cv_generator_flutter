import 'package:flutter/material.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({Key? key, required this.size, required this.text})
      : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Container(
        width: 112,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Text(
          text,
          style: const TextStyle(
              // fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white),
          //  maxLines: 5,
        ),
      ),
    );
  }
}
