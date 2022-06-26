import 'dart:ui';

import 'package:doctracker/data/model/qr_scanModel.dart';
import 'package:doctracker/data/provider/deliveryProvider.dart';
import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/logic/validators/get_token.dart';
import 'package:doctracker/logic/validators/logout.dart';
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
    final user_state = context.read<UserCubit>().state;
    final role = (user_state is UserLogedin) ? user_state.user.role : "000";
    final user_id = (user_state is UserLogedin) ? user_state.user.uuid : "000";
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
    final action_button = GFButton(
      onPressed: () {
        (_bottom_sheet_controller.isBottomSheetOpened)
            ? _bottom_sheet_controller.hideBottomSheet()
            : _bottom_sheet_controller.showBottomSheet();
      },
      text: "Action",
      color: GFColors.SECONDARY,
    );
    // MaterialButton(
    //   onPressed: () {
    //     (_bottom_sheet_controller.isBottomSheetOpened)
    //         ? _bottom_sheet_controller.hideBottomSheet()
    //         : _bottom_sheet_controller.showBottomSheet();
    //   },
    //   child: Text(
    //     'Action',
    //     style: TextStyle(color: Colors.white),
    //   ),
    //   color: Colors.amber,
    // );

    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('Document alread in the Job queue.'),
      action: SnackBarAction(
        label: 'Action',
        onPressed: () {},
      ),
    );
    final snackbar_verification_fail = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('Document Verification Failed'),
      action: SnackBarAction(
        label: 'Action',
        onPressed: () {},
      ),
    );
    final botton_sheet = GFBottomSheet(
      animationDuration: 900,
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
              onTap: () async {
                final deliveryProvider = Deliveryprovider();

                //print(res.data);
                final uuid =
                    (user_state is UserLogedin) ? user_state.uuid : '000';
                if (qr_data.currentUserId == uuid) {
                  try {
                    var res = await deliveryProvider.verifyDelivery(
                        qr_data.docId, getToken(context));
                    print(res.data);
                    if (res.data[0]['count'] == 0) {
                      Navigator.pushNamed(context, 'qrnext');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackbar_verification_fail);
                    LogOut(context);
                    ScaffoldMessenger.of(context).showSnackBar(error_snack_bar);
                    print(e);
                  }
                } else {
                  //Scaffold.of(context).showSnackBar(snackbar);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar_verification_fail);
                }
              },
              child: Container(
                height: 60,
                color: Colors.amber,
                child: Center(
                  child: Text(
                    "New Job",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
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
                child: Center(
                  child: Text(
                    "Accept Document",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
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
                child: Center(
                  child: Text(
                    "Request Document",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
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

    final deliverer_botton_sheet = GFBottomSheet(
      animationDuration: 900,
      controller: _bottom_sheet_controller,
      contentBody: Container(
        height: 130,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            Expanded(
                child: InkWell(
              onTap: () async {
                try {
                  final deliveryProvider = Deliveryprovider();
                  await deliveryProvider.updateDeliveryState(
                      qr_data.docId, user_id, getToken(context));
                  Navigator.pushNamed(context, 'delivererhome');
                } catch (e) {
                  var snackBar = SnackBar(
                    content: Text('Delivery Step confirm failed.'),
                    backgroundColor: Colors.red,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pushNamed(context, 'delivererrhome');
                  print(e);
                }
                // final deliveryProvider = Deliveryprovider();

                // //print(res.data);
                // final uuid =
                //     (user_state is UserLogedin) ? user_state.uuid : '000';
                // if (qr_data.currentUserId == uuid) {
                //   try {
                //     var res = await deliveryProvider.verifyDelivery(
                //         qr_data.docId, getToken(context));
                //     print(res.data);
                //     if (res.data[0]['count'] == 0) {
                //       Navigator.pushNamed(context, 'qrnext');
                //     } else {
                //       ScaffoldMessenger.of(context).showSnackBar(snackbar);
                //     }
                //   } catch (e) {
                //     ScaffoldMessenger.of(context)
                //         .showSnackBar(snackbar_verification_fail);
                //     LogOut(context);
                //     ScaffoldMessenger.of(context).showSnackBar(error_snack_bar);
                //     print(e);
                //   }
                // } else {
                //   //Scaffold.of(context).showSnackBar(snackbar);
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(snackbar_verification_fail);
                // }
              },
              child: Container(
                height: 60,
                color: Colors.amber,
                child: Center(
                  child: Text(
                    "Confirm Step",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
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
                child: Center(
                  child: Text(
                    "Accept Payment",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
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
      bottomSheet: (role == "Customer") ? botton_sheet : deliverer_botton_sheet,
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
