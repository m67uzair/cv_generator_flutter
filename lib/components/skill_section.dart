import 'package:cv_generator/components/skill_widget.dart';
import 'package:flutter/material.dart';

import '../model/user_data.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({Key? key, required this.size, required this.user})
      : super(key: key);

  final Size size;
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skill',
          style: Theme.of(context).textTheme.headline6,
        ),
        Container(
          width: size.width / 1.5,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 4,
        ),
        ...user.skillList
            .map((e) => SkillsWidget(size: size, text: e))
            .toList(),
      ],
    );
  }
}
