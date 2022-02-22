import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = Provider((ref) {
  return 90;
});

final testProvider01 = StateProvider<int>((ref) => 10);

// int cal() {
//   final cnt = StateProvider((ref) => testProvider01);
//   //return testProvider01
// }
