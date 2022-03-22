import 'package:doctracker/presentation/screens/Customer/Home/customer_home.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_next.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_scanner_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      default:
        return MaterialPageRoute(builder: (_) => CustomerHome());
    }
  }
}
