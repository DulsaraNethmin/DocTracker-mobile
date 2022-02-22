import 'package:doctracker/providers/counter_provider.dart';
import 'package:doctracker/screens/test_provider_screen.dart';
import 'package:doctracker/widgets/button_simple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHome extends ConsumerWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build01');
    final count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management Test'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(() {
              Navigator.pushNamed(context, '/provider');
            }, 'Provider'),
            Button(() {
              Navigator.pushNamed(context, '/state/provider');
            }, 'State Provider'),
            Button(() {
              Navigator.pushNamed(context, '/future');
            }, 'Future Provider'),
            Button(() {
              print('hello button');
            }, 'State Notifire'),
            Button(() {
              Navigator.pushNamed(context, '/todo');
              print('ToDo');
            }, 'ToDo')
          ],
        ),
      ),
    );
  }
}
