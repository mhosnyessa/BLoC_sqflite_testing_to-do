import 'package:block_trial/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String time;
  final String date;
  const TaskItem(
      {Key? key, required this.title, required this.time, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 40,
          child: Text(
            "$time",
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
        title: Text(
          '$title',
        ),
        subtitle: Text('$date'),
      ),
    );
  }
}
