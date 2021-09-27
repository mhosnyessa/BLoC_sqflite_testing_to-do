import 'dart:ui';

import 'package:block_trial/counter/count_bloc.dart';
import 'package:block_trial/ctr/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        builder: (BuildContext context, state) {
          return Scaffold(
            body: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        CounterCubit.get(context).plus();
                      },
                      child: Text('plus')),
                  SizedBox(width: 30),
                  Text('${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w900,
                      )),
                  SizedBox(width: 30),
                  ElevatedButton(
                      onPressed: CounterCubit.get(context).isMinusActivated
                          ? () {
                              CounterCubit.get(context).minus();
                            }
                          : null,
                      child: Text('minus')),
                ],
              ),
            ),
            appBar: AppBar(),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
