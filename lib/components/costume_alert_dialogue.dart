import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import "package:cv_generator/model/user_data.dart";

class CostumeAlertDialogue extends StatefulWidget {
  final String buttonTitle, instituteType, occupationType;
  final TextEditingController instituteTypeController,
      occupationTypeController,
      fromController,
      toController;
  final formKey;
  // final UserData user;
  final void Function() onPressed;

  const CostumeAlertDialogue({
    super.key,
    required BuildContext context,
    required this.formKey,
    required this.buttonTitle,
    required this.instituteType,
    required this.occupationType,
    required this.instituteTypeController,
    required this.occupationTypeController,
    required this.fromController,
    required this.toController,
    // required this.user,
    required this.onPressed,
  });

  @override
  State<CostumeAlertDialogue> createState() => _CostumeAlertDialogueState();
}

class _CostumeAlertDialogueState extends State<CostumeAlertDialogue> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        TextButton.icon(
          // onPressed: widget.onPressed,
          onPressed: () {
            widget.onPressed();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.add),
          label: Text(widget.buttonTitle),
        ),
      ],
      content: SizedBox(
        width: 600,
        height: 400,
        child: Form(
          key: widget.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Provide value';
                    }
                    return null;
                  },
                  controller: widget.occupationTypeController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    label: Text(widget.occupationType),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Provide value';
                    }
                    return null;
                  },
                  controller: widget.instituteTypeController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    label: Text(widget.instituteType),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text("From"), Text("To")],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Provide value';
                        }
                        return null;
                      },
                      controller: widget.fromController,
                      onTap: () async {
                        DateTime? fromDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                        );
                        if (fromDate != null) {
                          debugPrint(fromDate.toString());
                          String formatedToDate =
                              DateFormat('MMMM yyyy').format(fromDate);
                          setState(() {
                            widget.fromController.text = formatedToDate;
                          });
                        }
                      },
                      readOnly: true,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                        label: Text("Pick From"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "-",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Provide value';
                        }
                        return null;
                      },
                      controller: widget.toController,
                      onTap: () async {
                        // ignore: unused_local_variable
                        DateTime? toDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                        );
                        if (toDate != null) {
                          debugPrint(toDate.toString());
                          // ignore: unused_local_variable
                          String formatedToDate =
                              DateFormat('MMMM yyyy').format(toDate);
                          setState(() {
                            widget.toController.text = formatedToDate;
                          });
                        }
                      },
                      readOnly: true,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                        label: Text("Pick To"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
