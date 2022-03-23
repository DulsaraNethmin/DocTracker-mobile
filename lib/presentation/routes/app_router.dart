import 'package:doctracker/presentation/screens/Customer/Home/customer_home.dart';
import 'package:doctracker/presentation/screens/customer/More/more.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/internal_job.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_next.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_scanner_screen.dart';
import 'package:doctracker/presentation/screens/customer/Search/search_doc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/customer/QRScanner/external_job.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
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
      case '/more':
        return MaterialPageRoute(builder: (_) => MoreScreen());
        break;
      default:
        return MaterialPageRoute(builder: (_) => CustomerHome());
    }
  }
}
