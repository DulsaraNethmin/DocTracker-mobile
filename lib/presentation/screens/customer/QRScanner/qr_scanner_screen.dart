import 'dart:convert';
import 'dart:io';
import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
    //set();
  }

  @override
  Widget build(BuildContext context) {
    final button = BlocBuilder<QrCubit, QrState>(
      builder: (context, state) {
        if (state.uuid != null && state.branch != null) {
          return MaterialButton(
            child: Text('Next'),
            color: Colors.amberAccent[400],
            onPressed: () {
              Navigator.pushNamed(context, '/qrnext');
            },
          );
        } else {
          return Text("");
        }
      },
    );
    set();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),
            Positioned(bottom: 70, child: buildResult()),
            Positioned(bottom: 10, child: button),
          ],
        ),
      ),
    );
  }

  void set() {
    try {
      if (barcode != null) {
        var data = jsonDecode(barcode!.code.toString());
        if (data["uuid"] != null) {
          context.read<QrCubit>().setQR(
              data["uuid"], data["name"], data["branch"], data["department"]);
          //Navigator.pushNamed(context, '/qrnext');
        }
      }
    } catch (e) {
      print("hhh");
    }

    // var data = jsonDecode(barcode!.code.toString());
    // if (data["uuid"] != null) {
    //   context.read<QrCubit>().setQR(
    //       data["uuid"], data["name"], data["branch"], data["department"]);
    // }
  }

  Widget buildResult() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(8),
      ),
      child: BlocBuilder<QrCubit, QrState>(
        builder: (context, state) {
          //Widget wid = Text('data');
          if (state.uuid != null) {
            return Text(
              barcode != null
                  ? "Last time Scanned : ${context.read<QrCubit>().state.name} document"
                  : "Scan a barcode",
              maxLines: 4,
            );
          } else {
            return Text('qr');
          }
        },
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          borderColor: Colors.greenAccent,
        ),
      );
  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) {
      setState(() => this.barcode = barcode);
    });
  }
}
