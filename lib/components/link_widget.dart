import 'package:flutter/material.dart';
import '../model/user_data.dart';

class LinksWidget extends StatelessWidget {
  const LinksWidget({Key? key, required this.size, required this.data})
      : super(key: key);

  final Size size;
  final Link data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(
            data.icon,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: size.width / 2,
            child: Text(data.url),
          )
        ],
      ),
    );
  }
}
