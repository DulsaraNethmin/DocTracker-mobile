import 'package:doctracker/presentation/screens/Customer/Home/customer_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CustomerHome());
        break;
      default:
        return MaterialPageRoute(builder: (_) => CustomerHome());
    }
  }
}
