import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(RandomBackgroundColorApp());
}

class RandomBackgroundColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomBackgroundColorDemo(),
    );
  }
}

class RandomBackgroundColorDemo extends StatefulWidget {
  @override
  _RandomBackgroundColorDemoState createState() =>
      _RandomBackgroundColorDemoState();
}

class _RandomBackgroundColorDemoState
    extends State<RandomBackgroundColorDemo> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      // Tạo màu ngẫu nhiên bằng cách sử dụng lớp Random của Dart.
      // Mã màu trong Flutter là ARGB, vì vậy chúng ta cần giữ cố định giá trị alpha (255) để đảm bảo màu đầy đủ.
      _backgroundColor = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thái Lai - 0850080027'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: _changeBackgroundColor,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: Text(
              'Nhấn nút để thay đổi màu nền',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
