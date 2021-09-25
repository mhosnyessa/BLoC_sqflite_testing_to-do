import 'package:block_trial/shared/components/constants.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';

class NewTasksPage extends StatelessWidget {
  const NewTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, i) {
          return TaskItem(
            title: tasks[i]['title'],
            time: tasks[i]['time'],
            date: tasks[i]['date'],
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
  }
}
