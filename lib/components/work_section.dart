import 'package:cv_generator/components/project_widget.dart';
import 'package:flutter/material.dart';

import '../model/user_data.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({Key? key, required this.size, required this.user})
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
            'Work',
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
          ...user.projectsList
              .map((e) => ProjectsWidget(size: size, data: e))
              .toList()
        ],
      ),
    );
  }
}
