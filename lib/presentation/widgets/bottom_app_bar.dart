import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
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
      backgroundColor: Color.fromARGB(251, 111, 69, 196),
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
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            context.read<BotnavbarCubit>().onSelect(1);
            Navigator.pushNamed(context, '/search');
            break;
          case 2:
            context.read<BotnavbarCubit>().onSelect(2);
            Navigator.pushNamed(context, '/qr');
            index = 2;
            break;
          case 3:
            context.read<BotnavbarCubit>().onSelect(3);
            Navigator.pushNamed(context, '/track');
            index = 3;
            break;
          case 4:
            context.read<BotnavbarCubit>().onSelect(4);
            Navigator.pushNamed(context, '/more');
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
          label: 'Search',
          icon: Icon(Icons.search),
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
