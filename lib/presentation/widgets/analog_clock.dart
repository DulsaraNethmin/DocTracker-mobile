import 'package:flutter/material.dart';

import 'package:analog_clock/analog_clock.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) => const MaterialApp(
          home: Scaffold(
        body: AnalogClock(),
      ));
}
