import 'package:doctracker/providers/fake_future_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(clientProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider screen'),
      ),
      body: Center(
        child: client.map(
          data: (_) {
            Text('hihihi...');
            print(_.value);
          },
          error: (_) => Icon(Icons.abc_outlined),
          loading: (_) => CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
