import 'package:block_trial/shared/components/constants.dart';
import 'package:block_trial/shared/cubit/cubit.dart';
import 'package:block_trial/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String time;
  final String date;
  final String status;
  final int id;
  final BuildContext context;
  const TaskItem(
      {Key? key,
      required this.title,
      required this.time,
      required this.date,
      required this.id,
      required this.context,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      cubit.updateDB(status: 'done', id: id);
                      print(AppCubit.get(context).tasks);
                    },
                    child: Icon(
                      Icons.check_box,
                      color: Colors.green[400],
                    )),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                    onTap: () {
                      cubit.updateDB(status: 'archived', id: id);
                      print(AppCubit.get(context).tasks);
                    },
                    child: Icon(
                      Icons.archive_outlined,
                      color: Colors.blue[400],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
