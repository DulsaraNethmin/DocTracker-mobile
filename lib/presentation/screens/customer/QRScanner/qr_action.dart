import 'package:doctracker/data/model/qr_scanModel.dart';
import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';

class QrActionScreen extends StatefulWidget {
  const QrActionScreen({Key? key}) : super(key: key);

  @override
  State<QrActionScreen> createState() => _QrActionScreenState();
}

class _QrActionScreenState extends State<QrActionScreen> {
  final GFBottomSheetController _bottom_sheet_controller =
      GFBottomSheetController();

  @override
  Widget build(BuildContext context) {
    final qr_state = context.read<QrCubit>().state;
    //final qr_data = (qr_state is QrVerified) ? qr_state.scan_data : null;
    var qr_data = new QrScan(
        docId: '000',
        docName: '000',
        type: '000',
        branchId: '000',
        branch: '000',
        currentUserId: '000',
        currentUserName: '000');
    if (qr_state is QrVerified) qr_data = qr_state.scan_data;
    final doc_card = Card(
      margin: EdgeInsets.only(bottom: 10, left: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(qr_data.docName,
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Type: " + qr_data.type),
            SizedBox(
              height: 5,
            ),
            Text("Current User: " + qr_data.currentUserName),
            SizedBox(
              height: 5,
            ),
            Text("User ID: " + qr_data.currentUserId),
            SizedBox(
              height: 5,
            ),
            Text("Branch: " + qr_data.branch)
          ],
        ),
      ),
    );
    final action_button = MaterialButton(
      onPressed: () {
        (_bottom_sheet_controller.isBottomSheetOpened)
            ? _bottom_sheet_controller.hideBottomSheet()
            : _bottom_sheet_controller.showBottomSheet();
      },
      child: Text(
        'Action',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.amber,
    );

    final botton_sheet = GFBottomSheet(
      controller: _bottom_sheet_controller,
      contentBody: Container(
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                print('clicked');
              },
              child: Container(
                height: 60,
                color: Colors.amber,
              ),
            )),
            SizedBox(
              height: 7,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                print('clicked');
              },
              child: Container(
                height: 60,
                color: Color.fromARGB(255, 216, 208, 184),
              ),
            )),
            SizedBox(
              height: 7,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                print('clicked');
              },
              child: Container(
                height: 60,
                color: Color.fromARGB(255, 61, 60, 58),
              ),
            )),
            SizedBox(
              height: 7,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                print('clicked');
              },
              child: Container(
                height: 60,
                color: Color.fromARGB(255, 203, 174, 116),
              ),
            )),
          ],
        ),
      ),
      stickyFooter: Container(
        color: Color.fromARGB(251, 111, 69, 196),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'DocTracker',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'QR Scan Actions',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
      stickyFooterHeight: 50,
    );

    return Scaffold(
      bottomSheet: botton_sheet,
      body: SafeArea(
        child: Column(
          children: [
            doc_card,
            action_button,
          ],
        ),
      ),
    );
  }
}
