import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('plus')),
            SizedBox(width: 30),
            Text('1', style: TextStyle(fontSize: 49)),
            SizedBox(width: 30),
            ElevatedButton(onPressed: () {}, child: Text('minus')),
          ],
        ),
      ),
      appBar: AppBar(),
    );
  }
}
