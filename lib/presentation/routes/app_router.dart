import 'package:doctracker/presentation/screens/Customer/Home/customer_home.dart';
import 'package:doctracker/presentation/screens/customer/Chat/chat_screen.dart';
import 'package:doctracker/presentation/screens/customer/Chat/individual_screen.dart';
import 'package:doctracker/presentation/screens/customer/Chat/user_search.dart';
import 'package:doctracker/presentation/screens/customer/More/more.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/internal_job.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_next.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_scanner_screen.dart';
import 'package:doctracker/presentation/screens/customer/Search/search_doc.dart';
import 'package:doctracker/presentation/screens/deliverer/Admin/admin_select.dart';
import 'package:doctracker/presentation/screens/deliverer/Home/deliverer_home.dart';
import 'package:doctracker/presentation/screens/deliverer/Job/job_screen.dart';
import 'package:doctracker/presentation/screens/deliverer/Login/login_screen.dart';
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
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case '/org':
        return MaterialPageRoute(builder: (_) => OrgScreen());
        break;
      case '/admin':
        return MaterialPageRoute(builder: (_) => AdminSelect());
        break;
      case '/personal':
        return MaterialPageRoute(builder: (_) => Personal());
        break;
      case '/customer/home':
        return MaterialPageRoute(builder: (_) => CustomerHome());
        break;
      case '/qr':
        return MaterialPageRoute(builder: (_) => QRScanner());
        break;
      case '/qrnext':
        return MaterialPageRoute(builder: (_) => QRNext());
        break;
      case '/internaljob':
        return MaterialPageRoute(builder: (_) => InternalJob());
        break;
      case '/externaljob':
        return MaterialPageRoute(builder: (_) => ExternalJob());
        break;
      case '/search':
        return MaterialPageRoute(builder: (_) => SearchDoc());
        break;
      case '/chat':
        return MaterialPageRoute(builder: (_) => ChatScreen());
        break;
      case '/chat/search':
        return MaterialPageRoute(builder: (_) => UserSearch());
        break;
      case '/more':
        return MaterialPageRoute(builder: (_) => MoreScreen());
        break;
      case '/deleverer/home':
        return MaterialPageRoute(builder: (_) => DelivererHome());
        break;
      case '/jobs':
        return MaterialPageRoute(builder: (_) => JobsScreen());
        break;
      default:
        return MaterialPageRoute(builder: (_) => CustomerHome());
    }
  }
}
