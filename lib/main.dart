import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo_Bai1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController numberAController = TextEditingController();
  TextEditingController numberBController = TextEditingController();
  var resultTong = 0;
  var resultHieu = 0;
  var resultNhan = 0;
  var resultChia = 0.0;
  void calculate() {
    int a = int.parse(numberAController.text);
    int b = int.parse(numberBController.text);
    setState(() {
      resultTong = a + b;
      resultHieu = a - b;
      resultNhan = a * b;
      resultChia = a / b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo_Bai1'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: numberAController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhập a:'),
              style: TextStyle(fontSize: 30),
            ),
            TextField(
              controller: numberBController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhập b:'),
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 18.0),
            ElevatedButton(
              onPressed: calculate,
              child: Text('Thực hiện', style: TextStyle(fontSize: 34)),
            ),
            SizedBox(height: 18.0),
            Text(
              'a + b = $resultTong',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'a - b = $resultHieu',
              style: TextStyle(fontSize: 30),
            ),
              Text(
                'a * b = $resultNhan',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'a / b = $resultChia',
                style: TextStyle(fontSize: 30),
              ),
          ],
        ),
      ),
    );
  }
}
