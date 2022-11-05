import 'package:flutter/material.dart';

import '../model/user_data.dart';
import 'education_widget.dart';

class EductionSection extends StatelessWidget {
  const EductionSection({Key? key, required this.size, required this.user})
      : super(key: key);

  final Size size;
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight, //FractionalOffset(0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
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
          ...user.educationList
              .map((e) => EducationsWidget(size: size, data: e))
              .toList(),
          // ExperiencesWidget(),
          // ExperiencesWidget(),
        ],
      ),
    );
  }
}
