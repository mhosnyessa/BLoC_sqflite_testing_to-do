import 'package:block_trial/counter/count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/home_layout.dart';
import './ctr/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeLayout(),
      home: CounterScreen(),
    );
  }
}

//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CountBloc(),
//       child: MaterialApp(
//         home: HomePage(),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: (BlocBuilder<CountBloc, CountState>(
//         bloc: BlocProvider.of<CountBloc>(context),
//         builder: (context, state) {
//           return Center(
//             child: Column(
//               children: [
//                 Text(state.counter.toString()),
//                 ElevatedButton(
//                     onPressed: () {
//                       print("hi");
//                       BlocProvider.of<CountBloc>(context).add(IncrementEvent());
//                     },
//                     child: Text('Increment!')),
//                 ElevatedButton(
//                     onPressed: () {
//                       BlocProvider.of<CountBloc>(context).add(DecrementEvent());
//                     },
//                     child: Text('Decrement!')),
//               ],
//             ),
//           );
//         },
//       )),
//     );
//   }
// }
