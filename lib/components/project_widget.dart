import 'package:flutter/material.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({Key? key, required this.size, required this.data})
      : super(key: key);

  final Size size;
  final Map data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data['projectName'],
          style:
              TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '${data['from']}-${data['to']}',
          style: const TextStyle(
              // fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.pinkAccent),
        ),
        const SizedBox(
          height: 2,
        ),
        SizedBox(
          width: size.width / 2,
          child: Text(
            data['remarks'],
            style: const TextStyle(
                //fontSize: 16,
                fontWeight: FontWeight.bold),
            maxLines: 5,
          ),
        ),
      ],
    );
  }
}
