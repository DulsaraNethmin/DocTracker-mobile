import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _username_controller = TextEditingController();
  final _password_controller = TextEditingController();
  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    const snackBar = SnackBar(
      content: Text('Enter a valid user'),
      backgroundColor: Colors.red,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                width: size.width * 0.3,
                height: size.height * 0.2,
              ),
              Text(
                "Sign in as a Customer or as a Deliverer to continue",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFieldContainer(
                child: TextFormField(
                  controller: _username_controller,
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                    controller: _password_controller,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      hintText: "Password1",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    )),
              ),
              SizedBox(height: 20),
              MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 55),
                  color: kPrimaryColor,
                  onPressed: () async {
                    print(_username_controller.text);
                    await context.read<UserCubit>().verifyCustomer(
                        _username_controller.text,
                        _password_controller.text,
                        context);
                    if (context.read<UserCubit>().state is UserLogedin) {
                      Navigator.pushNamed(context, 'customerhome');
                      Notify();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    "Sign In as Customer",
                    style: TextStyle(color: Colors.white),
                  )),
              MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  color: kPrimaryColor,
                  onPressed: () async {
                    print(_username_controller.text);
                    await context.read<UserCubit>().verifyDeliverer(
                        _username_controller.text,
                        _password_controller.text,
                        context);
                    if (context.read<UserCubit>().state is UserLogedin) {
                      Navigator.pushNamed(context, 'delivererhome');
                      Notify();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    "Sign in as Deliverer",
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(height: 10),
              Text(
                "Forgot Password?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
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
          body: 'User logged in'));
}
