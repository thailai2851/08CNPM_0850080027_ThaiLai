import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController _numberAController = TextEditingController();
  TextEditingController _numberBController = TextEditingController();
  String _result = '';

  void _calculateResult(String operator) {
    double numberA = double.tryParse(_numberAController.text) ?? 0;
    double numberB = double.tryParse(_numberBController.text) ?? 0;
    double result = 0;

    setState(() {
      switch (operator) {
        case '+':
          result = numberA + numberB;
          break;
        case '-':
          result = numberA - numberB;
          break;
        case '*':
          result = numberA * numberB;
          break;
        case '/':
          if (numberB != 0) {
            result = numberA / numberB;
          } else {
            result = 0;
          }
          break;
      }
      _result = 'Kết quả: $result';
    });
  }

  @override
  void dispose() {
    _numberAController.dispose();
    _numberBController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thái Lai - 0850080027'),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIATh47Bd1iNtFTAO4Pw6N89uyrj7wrHwhRA&usqp=CAU',
              width: 120,
              height: 120,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 120,
                  child: TextField(
                    controller: _numberAController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Nhập số A:',
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  child: TextField(
                    controller: _numberBController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Nhập số B:',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculateResult('+'),
                  child: Text('+'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Màu nền của nút
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _calculateResult('-'),
                  child: Text('-'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent, // Màu nền của nút
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _calculateResult('*'),
                  child: Text('x'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Màu nền của nút
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _calculateResult('/'),
                  child: Text(':'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Màu nền của nút
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
