import 'package:flutter/material.dart';
import 'package:flutter_lotto_number_generator/src/components/show_number_balls.dart';

import 'result_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final TextEditingController _num = TextEditingController();

  List<int> myNumbers = [
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  var index = 0;

  Future<void> _inputMyNumber() async {
    var myInput = int.parse(_num.text.toString());
    setState(() {
      if (!myNumbers.contains(myInput)) {
        myNumbers[index] = myInput;
        index++;
        _num.clear();
        return;
      }
    });

    if (index == 6) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ResultView(arr: myNumbers)));
      return;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _num.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            _numbers(),
            const SizedBox(
              height: 200,
            ),
            _input(),
          ],
        ),
      ),
    );
  }

  Widget _numbers() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowNumberBalls(arr: myNumbers),
    );
  }

  Widget _input() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 50,
          child: TextField(
            controller: _num,
            maxLength: 2,
            keyboardType: const TextInputType.numberWithOptions(),
          ),
        ),
        ElevatedButton(
            onPressed: _inputMyNumber, child: const Icon(Icons.send)),
      ],
    );
  }
}
