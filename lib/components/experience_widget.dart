import 'package:flutter/material.dart';

class ExperiencesWidget extends StatelessWidget {
  const ExperiencesWidget({Key? key, required this.data}) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data['companyName'],
              style: const TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 4,
          ),
          Text(
            data['occupation'],
            //style: TextStyle(),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '${data['from']} - ${data['to']}',
            style: const TextStyle(
                // fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.pinkAccent),
          ),
          // SizedBox(
          //   height: 6,
          // ),
          // Text(
          //   'What is an “about me” section in a resume? An “adfasdfasdfasdfasdfasdfsdfasfdasdfsadfasdfsdfadfbout me” section is a brief segment in your resume that highlights who you are as a professional, describes your greatest strengths and showcases your greatest professional accomplishments.',
          //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          // ),
        ],
      ),
    );
  }
}
