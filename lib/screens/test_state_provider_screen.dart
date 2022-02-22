import 'package:doctracker/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build01');
    final num = ref.watch(testProvider01);
    return Scaffold(
      appBar: AppBar(
        title: Text('State Provider screen'),
      ),
      body: Center(
        child: Text(
          num.toString(),
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('try to up');
          ref.read(testProvider01.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
