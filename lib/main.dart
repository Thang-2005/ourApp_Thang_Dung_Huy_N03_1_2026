import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter thang',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Ứng Dụng Hỗ Trợ Đặt Lịch Khám Bệnh'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('You have pushed the button this many times:'),

      Text(
        '$_counter',
        style: Theme.of(context).textTheme.headlineMedium,
      ),

      SizedBox(height: 20),

      const Text(
        'Thành viên nhóm:',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),

      const Text('1. Nguyễn Văn Thắng MSSV: 23010234'),
      const Text('2. Dương Trí Dũng MSSV: 23010005'),
      const Text('3. Bùi Quang Huy MSSV: 23010865'),
    ],
  ),
),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
