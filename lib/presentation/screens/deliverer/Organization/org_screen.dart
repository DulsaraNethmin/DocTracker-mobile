import 'package:doctracker/data/provider/userProvider.dart';
import 'package:doctracker/logic/cubit/branch_admin_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class OrgScreen extends StatelessWidget {
  TextEditingController orgController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DocTracker - Organization'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.fromLTRB(20, 220, 20, 20),
        //height: size.height,
        //width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Organization",
                  border: InputBorder.none,
                ),
                controller: orgController,
              ),
            ),
            TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Branch",
                  border: InputBorder.none,
                ),
                controller: branchController,
              ),
            ),
            SizedBox(height: 10),
            MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                color: kPrimaryColor,
                onPressed: () async {
                  String org = orgController.text;
                  String branch = branchController.text;
                  print('inside');
                  var res = await UserProvider().getAdminId(
                      '/user/get/admin/id',
                      branchController.text,
                      orgController.text);
                  print(res.data);
                  context
                      .read<BranchAdminCubit>()
                      .getAdminId(res.data[0]["uuid"]);
                  Navigator.pushNamed(context, 'personal');
                },
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      )),
    );
  }
}
