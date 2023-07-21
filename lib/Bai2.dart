import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thái Lai - 0850080027',
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullNameAndClass = 'Họ và tên - lớp';
  bool isFullNameAndClassUpdated = false;

  void updateFullNameAndClass() {
    setState(() {
      if (!isFullNameAndClassUpdated) {
        fullNameAndClass = 'Thái Lai - 08_ĐH_CNPM';
      } else {
        fullNameAndClass = 'Họ và tên - lớp';
      }
      isFullNameAndClassUpdated = !isFullNameAndClassUpdated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thái Lai - 0850080027'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              fullNameAndClass,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ColoredBox(color: Colors.blue, child: SizedBox(width: 100, height: 100)),
                ColoredBox(color: Colors.green, child: SizedBox(width: 100, height: 100)),
                ColoredBox(color: Colors.yellow, child: SizedBox(width: 100, height: 100)),
              ],
            ),
            SizedBox(height: 20),
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIATh47Bd1iNtFTAO4Pw6N89uyrj7wrHwhRA&usqp=CAU',
              width: 120,
              height: 120,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateFullNameAndClass(); // Gọi hàm cập nhật họ và tên - lớp khi nút được nhấn
              },
              child: Text('Chuyển họ tên và lớp'),
            ),
          ],
        ),
      ),
    );
  }
}