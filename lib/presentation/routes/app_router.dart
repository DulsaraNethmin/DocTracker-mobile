import 'package:doctracker/presentation/screens/Customer/Home/customer_home.dart';
import 'package:doctracker/presentation/screens/customer/Mail/chat_screen.dart';
import 'package:doctracker/presentation/screens/customer/Mail/individual_screen.dart';
import 'package:doctracker/presentation/screens/customer/Mail/user_search.dart';
import 'package:doctracker/presentation/screens/customer/Help/help_screen.dart';
import 'package:doctracker/presentation/screens/customer/More/more.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/internal_job.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_action.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_next.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_scanner_screen.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/select_customer.dart';
import 'package:doctracker/presentation/screens/customer/Search/search_doc.dart';
import 'package:doctracker/presentation/screens/customer/Tracking/tracking_screen.dart';
import 'package:doctracker/presentation/screens/deliverer/Admin/admin_select.dart';
import 'package:doctracker/presentation/screens/deliverer/Home/deliverer_home.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/job_screen.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/my_jobs.dart';
import 'package:doctracker/presentation/screens/deliverer/Login/login_screen.dart';
import 'package:doctracker/presentation/screens/deliverer/More/del_chat_screen.dart';
import 'package:doctracker/presentation/screens/deliverer/More/more_screen.dart';
import 'package:doctracker/presentation/screens/deliverer/Organization/org_screen.dart';
import 'package:doctracker/presentation/screens/deliverer/Personal/personal_screen.dart';
import 'package:doctracker/presentation/screens/deliverer/Welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/customer/QRScanner/external_job.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
        break;
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case 'org':
        return MaterialPageRoute(builder: (_) => OrgScreen());
        break;
      case 'admin':
        return MaterialPageRoute(builder: (_) => AdminSelect());
        break;
      case 'personal':
        return MaterialPageRoute(builder: (_) => Personal());
        break;
      case 'customerhome':
        return MaterialPageRoute(builder: (_) => CustomerHome());
        break;
      case 'qr':
        return MaterialPageRoute(builder: (_) => QRScanner());
        break;
      case 'qrnext':
        return MaterialPageRoute(builder: (_) => QRNext());
        break;
      case 'internaljob':
        return MaterialPageRoute(builder: (_) => InternalJob());
        break;
      case 'externaljob':
        return MaterialPageRoute(builder: (_) => ExternalJob());
        break;
      case 'search':
        return MaterialPageRoute(builder: (_) => SearchDoc());
        break;
      case 'chat':
        return MaterialPageRoute(builder: (_) => ChatScreen());
        break;
      case 'chatsearch':
        return MaterialPageRoute(builder: (_) => UserSearch());
        break;
      case 'more':
        return MaterialPageRoute(builder: (_) => MoreScreen());
        break;
      case 'qraction':
        return MaterialPageRoute(builder: (_) => QrActionScreen());
        break;
      case 'delivererhome':
        return MaterialPageRoute(builder: (_) => DelivererHome());
        break;
      case 'deliverermore':
        return MaterialPageRoute(builder: (_) => DelMoreScreen());
        break;
      case 'delivererchat':
        return MaterialPageRoute(builder: (_) => DelChatScreen());
        break;
      case 'track':
        return MaterialPageRoute(builder: (_) => TrackingPage());
      case 'myjobs':
        return MaterialPageRoute(builder: (_) => MyJobs());
        break;
      // case 'jobinside':
      //   return MaterialPageRoute(builder: (_) => JobInside());
      //   break;
      case 'selectcustomer':
        return MaterialPageRoute(builder: (_) => SelectCustomer());
        break;
      case 'help':
        return MaterialPageRoute(builder: (_) => HelpScreen());
        break;
      default:
        return MaterialPageRoute(builder: (_) => CustomerHome());
    }
  }
}
