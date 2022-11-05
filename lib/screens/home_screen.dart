import 'package:cv_generator/helper/database_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/resume.jpg',
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/optionsScreen');
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              alignment: Alignment.center,
              width: size.width,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Text(
                'Input User Data',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/availableUserDataScreen');
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              alignment: Alignment.center,
              width: size.width,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Text('Use Previous Data',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5),
            ),
          )
        ],
      ),
    );
  }
}
