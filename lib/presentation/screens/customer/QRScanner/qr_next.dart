import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRNext extends StatelessWidget {
  const QRNext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final internalButton = MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.7,
        child: Text('Internal'),
        color: Colors.amberAccent[400],
        onPressed: () {
          //context.read<QrCubit>().setInternal();
          Navigator.pushNamed(context, '/internaljob');
        });
    final externalButton = MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.7,
        child: Text('External'),
        color: Colors.amberAccent[400],
        onPressed: () {
          //context.read<QrCubit>().setExternal();
          Navigator.pushNamed(context, '/externaljob');
        });
    return SafeArea(
        child: Scaffold(
      appBar: appBar('Next'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [internalButton, externalButton],
        ),
      ),
    ));
  }
}
