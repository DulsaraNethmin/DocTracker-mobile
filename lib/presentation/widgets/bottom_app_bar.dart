import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/presentation/screens/customer/Home/customer_home.dart';
import 'package:doctracker/presentation/screens/customer/More/more.dart';
import 'package:doctracker/presentation/screens/customer/QRScanner/qr_scanner_screen.dart';
import 'package:doctracker/presentation/screens/customer/Search/search_doc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromARGB(255, 49, 62, 130),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: context.read<BotnavbarCubit>().state.index,
      onTap: (value) {
        // Respond to item press.
        switch (value) {
          case 0:
            context.read<BotnavbarCubit>().onSelect(0);
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute<void>(
            //         builder: (BuildContext context) => const CustomerHome()),
            //     (route) => false);
            Navigator.pushNamed(context, 'customerhome');
            break;
          case 1:
            context.read<BotnavbarCubit>().onSelect(1);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => const SearchDoc()),
                (route) => false);
            break;
          case 2:
            context.read<BotnavbarCubit>().onSelect(2);
            Navigator.pushNamed(context, 'qr');
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute<void>(
            //         builder: (BuildContext context) => const QRScanner()),
            //     (route) => false);
            index = 2;
            break;
          case 3:
            context.read<BotnavbarCubit>().onSelect(3);
            Navigator.pushNamed(context, 'track');
            index = 3;
            break;
          case 4:
            context.read<BotnavbarCubit>().onSelect(4);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MoreScreen()),
                (route) => false);
            index = 4;
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_filled),
        ),
        BottomNavigationBarItem(
          label: 'Document',
          icon: Icon(Icons.document_scanner),
        ),
        BottomNavigationBarItem(
          label: 'Scan',
          icon: Icon(Icons.qr_code_scanner),
        ),
        BottomNavigationBarItem(
          label: 'Track',
          icon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          label: 'More',
          icon: Icon(Icons.more),
        ),
      ],
    );
  }
}
