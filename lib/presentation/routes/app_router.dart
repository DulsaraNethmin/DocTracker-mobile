import 'package:doctracker/presentation/screens/Customer/Home/customer_home.dart';
import 'package:doctracker/presentation/screens/customer/Chat/chat_screen.dart';
import 'package:doctracker/presentation/screens/customer/Chat/individual_screen.dart';
import 'package:doctracker/presentation/screens/customer/More/more.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/internal_job.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_next.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_scanner_screen.dart';
import 'package:doctracker/presentation/screens/customer/Search/search_doc.dart';
import 'package:doctracker/presentation/screens/deliverer/Login/login_screen.dart';
import 'package:doctracker/presentation/screens/deliverer/Organization/org_screen.dart';
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
      case '/individual':
        return MaterialPageRoute(builder: (_) => IndividualScreen());
        break;
      case '/more':
        return MaterialPageRoute(builder: (_) => MoreScreen());
        break;
      default:
        return MaterialPageRoute(builder: (_) => CustomerHome());
    }
  }
}
