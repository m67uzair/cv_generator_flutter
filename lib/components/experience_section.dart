import 'package:flutter/material.dart';

import '../model/user_data.dart';
import 'experience_widget.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    Key? key,
    required this.size,
    required this.user,
  }) : super(key: key);

  final Size size;
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
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
        ...user.experienceList
            .map((e) => ExperiencesWidget(
                  data: e,
                ))
            .toList(),
      ],
    );
  }
}
