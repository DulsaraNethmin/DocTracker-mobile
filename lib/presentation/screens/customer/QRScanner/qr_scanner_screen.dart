import 'dart:convert';
import 'dart:io';
import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:getwidget/getwidget.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  final GFBottomSheetController _bottom_sheet_controller =
      GFBottomSheetController();
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
    context.read<QrCubit>().initial();
    //set();
  }

  @override
  Widget build(BuildContext context) {
    //context.read<QrCubit>().reset();
    print("start of nuild");
    //context.read<QrCubit>().initial();
    final user_state = context.read<UserCubit>().state;
    final qr_state = context.read<QrCubit>().state;
    final uuid = (user_state is UserLogedin) ? user_state.uuid : "000";
    final button = BlocBuilder<QrCubit, QrState>(
      builder: (context, state) {
        if (qr_state is QrVerified) {
          // _bottom_sheet_controller.showBottomSheet();
          print('init state');
          return MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 0.8,
            child: Text('Next'),
            color: Colors.amberAccent[400],
            onPressed: () {
              (_bottom_sheet_controller.isBottomSheetOpened)
                  ? _bottom_sheet_controller.hideBottomSheet()
                  : _bottom_sheet_controller.showBottomSheet();
              //_bottom_sheet_controller.showBottomSheet();
              //Navigator.pushNamed(context, '/qrnext');
            },
          );
        } else {
          return Text("");
        }
      },
    );

    final botton_sheet = GFBottomSheet(
      controller: _bottom_sheet_controller,
      contentBody: Container(
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: const [
            Center(
                child: Text(
              'Getwidget reduces your overall app development time to minimum 30% because of its pre-build clean UI widget that you can use in flutter app development. We have spent more than 1000+ hours to build this library to make flutter developer’s life easy.',
              style:
                  TextStyle(fontSize: 15, wordSpacing: 0.3, letterSpacing: 0.2),
            ))
          ],
        ),
      ),
      stickyFooter: Container(
        color: GFColors.SUCCESS,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Get in touch',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'info@getwidget.dev',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
      stickyFooterHeight: 50,
    );

    void set(BuildContext context) async {
      try {
        if (barcode != null) {
          context.read<QrCubit>().verifing();
          print('qr get');
          var data = await barcode!.code.toString();
          print(data);
          //final uuid = (user_state is UserLogedin) ? user_state.uuid : "000";
          final url = data;
          //print(url);
          await context.read<QrCubit>().verify(url);
          controller!.pauseCamera();
          print("hi hello");
        }
      } catch (e) {
        print("hhh");
      }
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
            if (state is QrVerified) {
              return Text(
                barcode != null
                    ? "Last time Scanned : ${(qr_state is QrVerified) ? qr_state.scan_data.docName : "000"} document"
                    : "Scan a barcode",
                maxLines: 4,
              );
            } else {
              return Text('Scan a Document');
            }
          },
        ),
      );
    }

    // Widget buildQrView(BuildContext context) => QRView(
    //       key: qrKey,
    //       onQRViewCreated: onQRViewCreated,
    //       overlay: QrScannerOverlayShape(
    //         cutOutSize: MediaQuery.of(context).size.width * 0.8,
    //         borderWidth: 10,
    //         borderLength: 20,
    //         borderRadius: 10,
    //         borderColor: Colors.greenAccent,
    //       ),
    //     );
    // void onQRViewCreated(QRViewController controller) {
    //   setState(() {
    //     this.controller = controller;
    //   });
    //   controller.scannedDataStream.listen((barcode) {
    //     setState(() => this.barcode = barcode);
    //   });
    // }
    // if (!(qr_state is QrVerified ||
    //     qr_state is QrVerifing ||
    //     qr_state is QrVerifingError))
    set(context);
    return SafeArea(
      child: Scaffold(
        bottomSheet: botton_sheet,
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

  // void set(BuildContext context) async {
  //   try {
  //     if (barcode != null) {
  //       print('qr get');
  //       var data = barcode!.code.toString();
  //       print(data);
  //       final uuid = (user_state is UserLogedin) ? user_state.uuid : "000";
  //       final url = data + "&customer_id=${uuid}";
  //       await context.read<QrCubit>().verify(url);
  //     }
  //   } catch (e) {
  //     print("hhh");
  //   }
  // }

  // Widget buildResult() {
  //   return Container(
  //     padding: EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //       color: Colors.white24,
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: BlocBuilder<QrCubit, QrState>(
  //       builder: (context, state) {
  //         //Widget wid = Text('data');
  //         if (state.uuid != null) {
  //           return Text(
  //             barcode != null
  //                 ? "Last time Scanned : ${context.read<QrCubit>().state.uuid} document"
  //                 : "Scan a barcode",
  //             maxLines: 4,
  //           );
  //         } else {
  //           return Text('qr');
  //         }
  //       },
  //     ),
  //   );
  // }

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
