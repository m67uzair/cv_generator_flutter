import 'package:flutter/material.dart';

import '../model/user_data.dart';
import '../screens/resume_maker.dart';
import 'language_widget.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({Key? key, required this.size, required this.user})
      : super(key: key);

  final Size size;
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: Theme.of(context).textTheme.headline4,
          ),
          Container(
            width: size.width / 1.5,
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 6,
          ),
          ...user.languageList
              .map((e) => LanguagesWidget(size: size, text: e))
              .toList(),
        ],
      ),
    );
  }
}
