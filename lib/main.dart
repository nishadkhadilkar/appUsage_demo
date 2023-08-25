import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App Usage Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  static const MethodChannel methodChannel = MethodChannel('com.pandorabio.pandora_bio_app/appUsage');

  void _fetchData() async{
    var result = await methodChannel.invokeMethod('getAppUsage');
    /// We need that result variable to be printed here.
    debugPrint("APP_USAGE_DATA:- $result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _fetchData,
        label: const Text('Fetch Data'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
