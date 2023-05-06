import 'package:flutter/material.dart';

class ShowNumberBalls extends StatelessWidget {
  final List arr;
  const ShowNumberBalls({super.key, required this.arr});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            arr.length,
            (index) => CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      (arr[index] != 0) ? Colors.black : Colors.blue,
                  child: Text((arr[index] == 0) ? '?' : arr[index].toString()),
                )));
  }
}
