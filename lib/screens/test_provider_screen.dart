import 'package:doctracker/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build02');
    final number = ref.watch(testProvider01);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider screen'),
      ),
      body: Center(
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('try to up');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
