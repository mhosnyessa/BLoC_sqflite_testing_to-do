import 'package:block_trial/shared/components/constants.dart';
import 'package:block_trial/shared/cubit/cubit.dart';
import 'package:block_trial/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/components.dart';

class DoneTasksPage extends StatelessWidget {
  const DoneTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        List tasks = AppCubit.get(context).tasks;
        tasks = tasks.where((element) => element['status'] == 'done').toList();
        return ListView.separated(
            itemBuilder: (context, i) {
              return TaskItem(
                context: context,
                title: tasks[i]['title'],
                time: tasks[i]['time'],
                date: tasks[i]['date'],
                status: tasks[i]['status'],
                id: tasks[i]['id'],
              );
            },
            separatorBuilder: (context, i) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Container(
                    color: Colors.grey[300],
                    height: 1,
                  ),
                ),
            itemCount: tasks.length);
      },
    );
  }
}
