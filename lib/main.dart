import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/logic/cubit/branch_user_cubit.dart';
import 'package:doctracker/logic/cubit/chat_cubit.dart';
import 'package:doctracker/logic/cubit/end_customer_cubit.dart';
import 'package:doctracker/logic/cubit/image_cubit.dart';
import 'package:doctracker/logic/cubit/mail_cubit.dart';
import 'package:doctracker/logic/cubit/new_job_cubit.dart';
import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubit/document_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    var _appRouter = new AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => QrCubit()),
        BlocProvider(create: (context) => BotnavbarCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => DocumentCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => BranchUserCubit()),
        BlocProvider(create: (context) => MailCubit()),
        BlocProvider(create: (context) => ImageCubit()),
        BlocProvider(create: (context) => NewJobCubit()),
        BlocProvider(create: (context) => EndCustomerCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGeneratedRoute,
      ),
    );
  }
}
