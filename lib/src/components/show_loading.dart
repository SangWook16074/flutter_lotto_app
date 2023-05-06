import 'package:flutter/material.dart';

class ShowLoading extends StatelessWidget {
  const ShowLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
