import 'dart:io';

import 'package:cv_generator/helper/database_helper.dart';
import 'package:cv_generator/model/user_data.dart';
import 'package:cv_generator/screens/resume_maker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AvailableUserDataScreen extends StatefulWidget {
  const AvailableUserDataScreen({Key? key}) : super(key: key);

  @override
  State<AvailableUserDataScreen> createState() =>
      _AvailableUserDataScreenState();
}

class _AvailableUserDataScreenState extends State<AvailableUserDataScreen> {
  // late Map userData;
  final DatabaseHelper db = DatabaseHelper.db;

  @override
  initState() {
    super.initState();

    // getDataFromDatabase();
  }

  Future getDataFromDatabase() async {
    return await db.retriveAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataFromDatabase(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
              body: Center(
                  child: RawScrollbar(
                thumbVisibility: true,
                thumbColor: Colors.grey.shade600,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 32),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ResumeMaker(
                                                            userData: snapshot
                                                                .data[index],
                                                          )));
                                            },
                                            child: const Text(
                                              'Create Resume',
                                              style: TextStyle(fontSize: 16),
                                            )),
                                        ElevatedButton(
                                            onPressed: () async {
                                              await db.delete(
                                                  snapshot.data[index].id);
                                              setState(() {});
                                              if (!mounted) {}
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Delete Data',
                                              style: TextStyle(fontSize: 16),
                                            )),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Card(
                            color: Colors.grey.shade300,
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.pinkAccent,
                                        child: Column(
                                          children: [
                                            Text(
                                              'Contact Detail',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            Text(snapshot.data[index].name),
                                            Text(snapshot
                                                .data[index].designation),
                                            Text(snapshot.data[index].contact),
                                            Text(snapshot.data[index].email),
                                            Text(snapshot.data[index].location),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.amberAccent,
                                        child: Column(
                                          children: [
                                            Text(
                                              'Education Detail',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            ...snapshot
                                                .data[index].educationList
                                                .map((e) {
                                              return Column(
                                                children: [
                                                  Text(e['instituteName']),
                                                  Text(e['course']),
                                                  Text(
                                                      '${e['from']} - ${e['to']}')
                                                ],
                                              );
                                            }).toList(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.blueAccent,
                                        child: Column(
                                          children: [
                                            Text(
                                              'Experience Detail',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            ...snapshot
                                                .data[index].experienceList
                                                .map((e) {
                                              return Column(
                                                children: [
                                                  Text(e['companyName']),
                                                  Text(e['occupation']),
                                                  Text(
                                                      '${e['from']} - ${e['to']}')
                                                ],
                                              );
                                            }).toList(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.orangeAccent,
                                        child: Column(
                                          children: [
                                            Text(
                                              'Skills Detail',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            ...snapshot.data[index].skillList
                                                .map((e) {
                                              return Text(e);
                                            }).toList(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.greenAccent,
                                        child: Column(
                                          children: [
                                            Text(
                                              'Work Detail',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            ...snapshot.data[index].workList
                                                .map((e) {
                                              return Column(
                                                children: [
                                                  Text(e['projectName']),
                                                  Text(e['remarks']),
                                                  Text(
                                                      '${e['from']} - ${e['to']}')
                                                ],
                                              );
                                            }).toList(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.indigoAccent,
                                        child: Column(
                                          children: [
                                            Text(
                                              'Language Detail',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            ...snapshot.data[index].language
                                                .map((e) {
                                              return Text(e);
                                            }).toList(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.purpleAccent,
                                        child: Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Social Links Detail',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                              ...snapshot.data[index].linkList
                                                  .map((e) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                        child: Text(e['url']))
                                                  ],
                                                );
                                              }).toList(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Image.file(
                                            File(snapshot.data[index].image))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )),
              floatingActionButton: FloatingActionButton.extended(
                  backgroundColor: Colors.purpleAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            );
          }
        });
  }
}
