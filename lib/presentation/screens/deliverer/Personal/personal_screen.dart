import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:doctracker/logic/cubit/branch_admin_cubit.dart';
import 'package:doctracker/logic/cubit/mail_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:doctracker/presentation/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class Personal extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('DocTracker - Personal'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 140, 20, 20),
          //height: size.height,
          //width: double.infinity,
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFieldContainer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: InputBorder.none,
                    ),
                    controller: nameController,
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none,
                    ),
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter valid email'
                            : null,
                    controller: emailController,
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
                      border: InputBorder.none,
                    ),
                    validator: (phone) =>
                        phone != null && !RegExp('^[0-9]{10}').hasMatch(phone)
                            ? 'Enter correct phone number'
                            : null,
                    controller: mobileNoController,
                  ),
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                  color: kPrimaryColor,
                  onPressed: () async {
                    final form = formkey.currentState;
                    if (form!.validate()) {
                      final email = emailController.text;
                      final phone = mobileNoController.text;

                      String body =
                          " Name : ${nameController.text} Email : ${emailController.text} Mobile No. : ${mobileNoController.text}";
                      Map data = {
                        "from": null,
                        "to":
                            context.read<BranchAdminCubit>().state.branch_admin,
                        "head": "Add to the organization",
                        "body": body
                      };
                      await context.read<MailCubit>().sendRequestMail(data);
                      Navigator.pushNamed(context, '/');
                      Notify();
                    }
                  },
                  child: Text(
                    "Send",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void Notify() async {
  AwesomeNotifications a = new AwesomeNotifications();
  await a.createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: 'Notification',
          body: 'Request sent to Admin'));
}
