import 'dart:collection';
import 'package:doctracker/data/model/deliveryMode.dart';

Map<String, List<Delivery>> getJbosAndDeliveris(List<Delivery> list) {
  Map<String, List<Delivery>> map = HashMap();
  for (int i = 0; i < list.length; i++) {
    if (map.containsKey(list[i].jobId)) {
      map.update(list[i].jobId, (value) {
        value.add(list[i]);
        return value;
      });
    } else {
      map[list[i].jobId] = [list[i]];
    }
  }
  print(map.keys);
  return map;
}
