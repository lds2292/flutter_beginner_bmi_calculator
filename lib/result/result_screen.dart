import 'dart:math';

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  const ResultScreen({Key? key, required this.height, required this.weight})
      : super(key: key);

  String _calcBmi(double bmi) {
    String result = '저체중';
    if (bmi >= 35) {
      result = '고도 비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }
    return result;
  }

  Widget _buildIcon(double bmi) {
    Icon icon = const Icon(Icons.sentiment_dissatisfied, size: 80, color: Colors.green,);
    if (bmi >= 23) {
      icon = const Icon(Icons.sentiment_very_dissatisfied, size: 80, color: Colors.green,);
    } else if (bmi >= 18.5) {
      icon = const Icon(Icons.sentiment_satisfied, size: 80, color: Colors.green,);
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    final double bmi = weight / pow(height / 100.0, 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('결과를 공개합니다'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _calcBmi(bmi),
              style: TextStyle(fontSize: 36),
            ),
            _buildIcon(bmi),
          ],
        ),
      ),
    );
  }
}
