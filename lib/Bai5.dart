import 'package:flutter/material.dart';

void main() {
  runApp(PrimeNumberCheckerApp());
}

class PrimeNumberCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeNumberCheckerDemo(),
    );
  }
}

class PrimeNumberCheckerDemo extends StatefulWidget {
  @override
  _PrimeNumberCheckerDemoState createState() => _PrimeNumberCheckerDemoState();
}

class _PrimeNumberCheckerDemoState extends State<PrimeNumberCheckerDemo> {
  TextEditingController _numberController = TextEditingController();
  bool _isPrime = false;

  bool _checkPrimeNumber(int number) {
    if (number <= 1) return false;
    if (number == 2) return true;
    if (number % 2 == 0) return false;

    for (int i = 3; i * i <= number; i += 2) {
      if (number % i == 0) return false;
    }

    return true;
  }

  void _checkIfPrime() {
    int number = int.tryParse(_numberController.text) ?? 0;
    setState(() {
      _isPrime = _checkPrimeNumber(number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thái Lai - 0850080027'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Nhập số bất kì'),
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkIfPrime,
                child: Text(
                    'Nhấn để kiểm tra số nguyên tố',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(height: 20),
              Text(
                _isPrime ? 'Đây là số nguyên tố.' : 'Đây không phải là số nguyên tố.',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }
}
