import 'package:cv_generator/components/language_widget.dart';
import 'package:cv_generator/components/skill_widget.dart';
import 'package:flutter/material.dart';

import '../model/user_data.dart';
import 'link_widget.dart';

class LinkSection extends StatelessWidget {
  const LinkSection({Key? key, required this.size, required this.user})
      : super(key: key);

  final Size size;
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Link',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Language',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
        Container(
          width: size.width,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: user.linkList
                  .map((e) => LinksWidget(size: size, data: e))
                  .toList(),
            ),
            Column(
              children: user.languageList
                  .map((e) => SkillsWidget(size: size, text: e))
                  .toList(),
            )
          ],
        ),
      ],
    );
  }
}
