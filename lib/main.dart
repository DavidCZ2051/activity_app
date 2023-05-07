// packages
import 'package:flutter/material.dart';
// routes
import 'package:activity_app/routes/test.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Activity",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Test(),
    );
  }
}
