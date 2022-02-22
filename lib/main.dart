import 'package:doctracker/screens/fake_todo_list.dart';
import 'package:doctracker/screens/future_provider_screen.dart';
import 'package:doctracker/screens/my_home.dart';
import 'package:doctracker/screens/test_state_provider_screen.dart';
import 'package:doctracker/screens/test_provider_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
      routes: {
        '/provider': ((context) => ProviderScreen()),
        '/state/provider': (context) => StateProviderScreen(),
        '/future': (context) => FutureScreen(),
        '/todo': (context) => ToDoListScreen(),
      },
    );
  }
}
