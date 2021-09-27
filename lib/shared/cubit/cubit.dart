import 'package:bloc/bloc.dart';
import 'package:block_trial/modules/archived_tasks/archived_tasks.dart';
import 'package:block_trial/modules/done_tasks/done_tasks.dart';
import 'package:block_trial/modules/new_tasks/new_tasks.dart';
import 'package:block_trial/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  List<String> titles = ['tasks', 'done', 'archived'];
  List<Widget> pages = [
    NewTasksPage(),
    DoneTasksPage(),
    ArchivedTasksPage(),
  ];
  int currentIndex = 0;

  late Database db;
  List<Map> tasks = [];
  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeNavState());
  }

  void createDatabase() async {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) {
        print('database has been created !');
        db

            ///id integer
            ///title string
            ///date string
            ///time string
            ///status string
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) => {print('table created')})
            .catchError((error) {
          print('error while creating table${error.toString()}');
        });
      },
      onOpen: (db) {
        print('opened database! ${db.toString()}');
        getDataFromDB(db).then((v) {
          tasks = v;
          print(tasks[0]);
          emit(AppGetDBState());
        });
      },
    ).then((value) {
      db = value;
      emit(AppCreateDBState());
    });
  }

  Future insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    return await db.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")')
          .then((value) {
        print('inserted successfully id = ${value.toString()}');
      }).catchError((error) {
        print('error when inserting new record ${error.toString()}');
      });
    });
  }

  Future<List<Map>> getDataFromDB(Database db) async {
    return await db.rawQuery('SELECT * FROM tasks');
  }
}

//  -> >- |} || \/ /\ -<>- :: *** *** www  <= >= != <$ ++ --> := =>> ==> +++ === 
