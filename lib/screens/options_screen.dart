import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CV Generator"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: SizedBox(
            // height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 40),
                CustomOptionWidget(
                  title: 'Personal Info',
                  icon: Icons.person,
                  onTap: () {
                    Navigator.pushNamed(context, '/personalInfoScreen');
                  },
                ),
                const SizedBox(height: 20),
                CustomOptionWidget(
                  title: 'Education',
                  icon: Icons.school,
                  onTap: () {
                    Navigator.pushNamed(context, '/educationScreen');
                  },
                ),
                const SizedBox(height: 20),
                CustomOptionWidget(
                  title: 'Experience',
                  icon: Icons.engineering,
                  onTap: () {
                    Navigator.pushNamed(context, '/experienceScreen');
                  },
                ),
                const SizedBox(height: 20),
                CustomOptionWidget(
                  title: 'Skills',
                  icon: Icons.psychology,
                  onTap: () {
                    Navigator.pushNamed(context, '/skillsScreen');
                  },
                ),
                const SizedBox(height: 20),
                CustomOptionWidget(
                  title: 'Projects',
                  icon: Icons.add_task,
                  onTap: () {
                    Navigator.pushNamed(context, '/projectScreen');
                  },
                ),
                const SizedBox(height: 20),
                CustomOptionWidget(
                  title: 'Languages',
                  icon: Icons.language,
                  onTap: () {
                    Navigator.pushNamed(context, '/languageScreen');
                  },
                ),
                const SizedBox(height: 20),
                CustomOptionWidget(
                  title: 'Links',
                  icon: Icons.link,
                  onTap: () {
                    Navigator.pushNamed(context, '/linkScreen');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomOptionWidget extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final String title;
  const CustomOptionWidget({
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.indigo,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Icon(icon, color: Colors.black, size: 100))
          ],
        ),
      ),
    );
  }
}
