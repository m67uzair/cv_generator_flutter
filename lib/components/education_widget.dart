import 'package:flutter/material.dart';

class EducationsWidget extends StatelessWidget {
  const EducationsWidget({Key? key, required this.size, required this.data})
      : super(key: key);

  final Size size;
  final Map data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data['course'],
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          width: size.width / 2,
          child: Text(
            data['instituteName'],
            // style: Theme.of(context)
            //     .textTheme
            //     .headline6!
            //     .copyWith(overflow: TextOverflow.visible),
            maxLines: 5,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          '${data['from']}-${data['to']}',
          style: const TextStyle(
              // fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.pinkAccent),
        ),
      ],
    );
  }
}
