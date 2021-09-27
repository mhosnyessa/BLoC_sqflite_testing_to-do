import 'package:block_trial/shared/components/constants.dart';
import 'package:block_trial/shared/cubit/cubit.dart';
import 'package:block_trial/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:block_trial/modules/archived_tasks/archived_tasks.dart';
import 'package:block_trial/modules/done_tasks/done_tasks.dart';
import 'package:block_trial/modules/new_tasks/new_tasks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:buildcondition/buildcondition.dart';
import 'dart:io';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  IconData fabIcon = Icons.edit;
  bool isBottomSheetDisplayed = false;
  late Database db;

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  late Icon titleIcon;

  @override
  // void initState() {
  //   super.initState();
  //   createDatabase();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            floatingActionButton: FloatingActionButton(
              child: Icon(fabIcon),
              onPressed: () {
                if (!isBottomSheetDisplayed) {
                  isBottomSheetDisplayed = !isBottomSheetDisplayed;
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultFormField(
                                    label: 'Task Title',
                                    type: TextInputType.text,
                                    controller: titleController,
                                    prefix: Icon(Icons.title),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'title must not be empty';
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                defaultFormField(
                                    label: 'Pick a time',
                                    type: TextInputType.datetime,
                                    controller: timeController,
                                    prefix: Icon(Icons.watch_later_outlined),
                                    onTap: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        //setState(() {});
                                        timeController.text =
                                            value!.format(context).toString();
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'time must not be empty';
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                defaultFormField(
                                    label: 'Pick a date',
                                    type: TextInputType.datetime,
                                    controller: dateController,
                                    prefix: Icon(Icons.date_range_outlined),
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:
                                                  DateTime.parse('2021-12-20'))
                                          .then((value) {
                                        dateController.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'time must not be empty';
                                      }
                                      return null;
                                    }),
                              ],
                            ),
                          ),
                        ),
                        elevation: 10,
                      )
                      .closed
                      .then((value) {
                    isBottomSheetDisplayed = !isBottomSheetDisplayed;
                    // setState(() {
                    //   fabIcon = Icons.edit;
                    // });
                  });

                  // setState(() {
                  //   fabIcon = Icons.add;
                  // });
                } else if (isBottomSheetDisplayed) {
                  if (formKey.currentState!.validate()) {
                    // insertToDatabase(
                    //   title: titleController.text,
                    //   time: timeController.text,
                    //   date: dateController.text,
                    // ).then((_) {
                    //   isBottomSheetDisplayed = !isBottomSheetDisplayed;
                    //   Navigator.of(context).pop();
                    //   // setState(() {
                    //   //   fabIcon = Icons.edit;
                    //   // });
                    //   print('added to db successfully');
                    // });
                  }
                }
              },
            ),
            appBar: AppBar(
              title: Text(AppCubit.get(context)
                  .titles[AppCubit.get(context).currentIndex]),
            ),
            body: BuildCondition(
                builder: (context) => cubit.pages[cubit.currentIndex],
                condition: true,
                fallback: (context) => Center(
                      child: CircularProgressIndicator(),
                    )),
            // body: tasks.length == 0
            //     ? Center(child: CircularProgressIndicator())
            //     : pages[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                // setState(() {
                //   currentIndex = index;
                // });
                cubit.changeIndex(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: AppCubit.get(context)
                      .titles[AppCubit.get(context).currentIndex],
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: AppCubit.get(context)
                      .titles[AppCubit.get(context).currentIndex],
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: AppCubit.get(context)
                      .titles[AppCubit.get(context).currentIndex],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

//   void createDatabase() async {
//     db = await openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: (db, version) {
//         print('database has been created !');
//         db

//             ///id integer
//             ///title string
//             ///date string
//             ///time string
//             ///status string
//             .execute(
//                 'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
//             .then((value) => {print('table created')})
//             .catchError((error) {
//           print('error while creating table${error.toString()}');
//         });
//       },
//       onOpen: (db) {
//         print('opened database! ${db.toString()}');
//         getDataFromDB(db).then((v) {
//           // setState(() {
//           //   tasks = v;
//           // });
//           print(tasks[0]);
//         });
//       },
//     );
//   }

//   Future insertToDatabase({
//     required String title,
//     required String time,
//     required String date,
//   }) async {
//     return await db.transaction((txn) async {
//       txn
//           .rawInsert(
//               'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")')
//           .then((value) {
//         print('inserted successfully id = ${value.toString()}');
//       }).catchError((error) {
//         print('error when inserting new record ${error.toString()}');
//       });
//     });
//   }

//   Future<List<Map>> getDataFromDB(Database db) async {
//     return await db.rawQuery('SELECT * FROM tasks');
//   }
// }

  Widget defaultFormField({
    TextEditingController? controller,
    TextInputType? type,
    FormFieldValidator? validator,
    required String label,
    Icon? prefix,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validator,
      onTap: onTap,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: prefix,
      ),
    );
  }
}
