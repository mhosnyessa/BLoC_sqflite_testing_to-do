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
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.plus_one),
                label: Text('plus')),
            SizedBox(width: 30),
            Text('1', style: TextStyle(fontSize: 49)),
            SizedBox(width: 30),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.exposure_minus_1),
                label: Text('minus'))
          ],
        ),
      ),
      appBar: AppBar(),
    );
  }
}
