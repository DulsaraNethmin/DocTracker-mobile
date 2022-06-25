import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/logic/cubit/branch_admin_cubit.dart';
import 'package:doctracker/logic/cubit/branch_user_cubit.dart';
import 'package:doctracker/logic/cubit/chat_cubit.dart';
import 'package:doctracker/logic/cubit/delivery_cubit.dart';
import 'package:doctracker/logic/cubit/doc_request_cubit.dart';
import 'package:doctracker/logic/cubit/doc_search_cubit.dart';
import 'package:doctracker/logic/cubit/end_customer_cubit.dart';
import 'package:doctracker/logic/cubit/image_cubit.dart';
import 'package:doctracker/logic/cubit/jwt_token_cubit.dart';
import 'package:doctracker/logic/cubit/mail_cubit.dart';
import 'package:doctracker/logic/cubit/my_delivery_cubit.dart';
import 'package:doctracker/logic/cubit/new_job_cubit.dart';
import 'package:doctracker/logic/cubit/new_mail_cubit.dart';
import 'package:doctracker/logic/cubit/qr_cubit.dart';
import 'package:doctracker/logic/cubit/socket_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/routes/app_router.dart';
import 'package:doctracker/presentation/screens/deliverer/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubit/document_cubit.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            //channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights: true,
            enableVibration: true)
      ],
    );

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
        BlocProvider(create: (context) => JwtTokenCubit()),
        BlocProvider(create: (context) => BranchAdminCubit()),
        BlocProvider(create: (context) => DocSearchCubit()),
        BlocProvider(create: (context) => DocRequestCubit()),
        BlocProvider(create: (context) => NewMailCubit()),
        BlocProvider(create: (context) => SocketCubit()),
        BlocProvider(create: (context) => DeliveryCubit()),
        BlocProvider(create: (context) => MyDeliveryCubit()),
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
