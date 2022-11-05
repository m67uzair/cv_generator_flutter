import 'package:flutter/material.dart';

import '../model/user_data.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key, required this.size, required this.user})
      : super(key: key);

  final Size size;
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: Theme.of(context).textTheme.headline6,
        ),
        Container(
          width: size.width / 2,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.info.location,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          user.info.contact,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          user.info.email,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
