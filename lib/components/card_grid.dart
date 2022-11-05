import 'package:cv_generator/components/costume_alert_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:cv_generator/model/user_data.dart';

class CardGrid extends StatelessWidget {
  final List list;
  final String? title;
  final String subtitle;
  final UserData user;
  const CardGrid(
      {required this.list,
      required this.title,
      required this.subtitle,
      required this.user});

  @override
  Widget build(BuildContext context) {
    TextEditingController updatedInstituteTypeController =
        TextEditingController();
    TextEditingController updatedOccupationTypeController =
        TextEditingController();
    TextEditingController updatedFromController = TextEditingController();
    TextEditingController updatedToController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 3),
          crossAxisSpacing: 10,
        ),
        itemCount: list.length,
        itemBuilder: (BuildContext context, index) {
          var userInstance = list[index];
          return Card(
            elevation: 5,
            child: ListTile(
              title: Text(
                userInstance[title],
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
              subtitle: SizedBox(
                width: 60,
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(userInstance[subtitle]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("From"),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 12),
                        ),
                        const Text("To"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userInstance['from'],
                          style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          userInstance['to'],
                          style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              onTap: () {
                updatedInstituteTypeController.text = list[index][title];
                updatedOccupationTypeController.text = list[index][subtitle];
                updatedFromController.text = list[index]['from'];
                updatedToController.text = list[index]['to'];
                showDialog(
                  context: context,
                  builder: (context) => CostumeAlertDialogue(
                    context: context,
                    buttonTitle: title == "companyName"
                        ? "Update Experience"
                        : "Update Education",
                    instituteType: title.toString(),
                    occupationType: subtitle,
                    instituteTypeController: updatedInstituteTypeController,
                    occupationTypeController: updatedOccupationTypeController,
                    fromController: updatedFromController,
                    toController: updatedToController,
                    onPressed: () {
                      title == "companyName"
                          ? user.updateExperience(
                              companyName:
                                  updatedInstituteTypeController.text.trim(),
                              occupation:
                                  updatedOccupationTypeController.text.trim(),
                              fromDate: updatedFromController.text.trim(),
                              toDate: updatedToController.text.trim(),
                              index: index)
                          : user.updateEducation(
                              instituteName:
                                  updatedInstituteTypeController.text.trim(),
                              course:
                                  updatedOccupationTypeController.text.trim(),
                              fromDate: updatedFromController.text.trim(),
                              toDate: updatedToController.text.trim(),
                              index: index);
                    },
                    formKey: _formKey,
                  ),
                );
              },
            ),
          );
        });
  }
}
