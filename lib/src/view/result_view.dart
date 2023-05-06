import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lotto_number_generator/src/components/show_loading.dart';
import 'package:flutter_lotto_number_generator/src/components/show_number_balls.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  List<int> lottoNumbers = [
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  var isDone = false;
  var isRunning = false;
  var currentNumber = 0;

  //1. 버튼을 눌러서 작동시킬거임 -> 버튼이 필요하겠네, 버튼에 들어갈 메소드가 있어야 겠다.

  Future<void> _startProgress() async {
    setState(() {
      isRunning = true;
    });
    await _generateRandomNumber();
    setState(() {
      isRunning = false;
      isDone = true;
    });
  }

  Future<void> _generateRandomNumber() async {
    for (int i = 0; i < lottoNumbers.length; i++) {
      setState(() {
        currentNumber = 0;
      });
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        var randomNumber = Random().nextInt(44) + 1;
        lottoNumbers[i] = randomNumber;
        currentNumber = randomNumber;
      });
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _startProgress, icon: const Icon(Icons.check))
        ],
      ),
      body: Column(
        children: [
          _numbers(),
          const SizedBox(
            height: 200,
          ),
          (!isRunning) ? _body() : _buildProgress(),
          // _btn(),
        ],
      ),
    );
  }

  Widget _numbers() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowNumberBalls(
        arr: lottoNumbers,
      ),
    );
  }

  Widget _body() {
    return SizedBox(
      height: 100,
      child: Center(
        child: Text(
          (!isDone) ? '당신의 행운력을 테스트 해보세요 !' : '끝',
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  Widget _buildProgress() {
    return (currentNumber == 0)
        ? const ShowLoading()
        : Text(
            '현재 숫자 $currentNumber',
            style: const TextStyle(fontSize: 30),
          );
  }
}
