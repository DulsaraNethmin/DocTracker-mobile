import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/logic/cubit/branch_user_cubit.dart';
import 'package:doctracker/logic/cubit/document_cubit.dart';
import 'package:doctracker/logic/cubit/image_cubit.dart';
import 'package:doctracker/logic/cubit/mail_cubit.dart';
import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/screens/deliverer/Login/login_screen.dart';
import 'package:doctracker/presentation/widgets/analog_clock.dart';
import 'package:doctracker/presentation/widgets/app_bar.dart';
import 'package:doctracker/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({Key? key}) : super(key: key);
//..................................................................................................................
  @override
  Widget build(BuildContext context) {
    context.read<BotnavbarCubit>().onSelect(0);
    final mail_state = context.read<MailCubit>().state;
    final user_state = context.read<UserCubit>().state;
    if (mail_state is MailLoading) {
      context
          .read<MailCubit>()
          .getMails(user_state is UserLogedin ? user_state.uuid : "000");
    }
//..................................................................................................................
    return Scaffold(
      appBar: appBar('Home'),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
