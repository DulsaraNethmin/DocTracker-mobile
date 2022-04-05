import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
//import 'package:doctracker/presentation/screens/deliverer/Login/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _username_controller = TextEditingController();
    final _password_controller = TextEditingController();
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
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: kPrimaryColor,
                        ))),
              ),
              MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 55),
                  color: kPrimaryColor,
                  onPressed: () {
                    context.read<UserCubit>().setUser(
                        _username_controller.text, _password_controller.text);
                    Navigator.pushNamed(context, '/customer/home');
                  },
                  child: Text(
                    "Sign In as Customer",
                    style: TextStyle(color: Colors.white),
                  )),
              MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 55),
                  color: kPrimaryColor,
                  onPressed: () {},
                  child: Text(
                    "Sign in as Deliverer",
                    style: TextStyle(color: Colors.white),
                  )),
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

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
      ),
      child: child,
    );
  }
}
