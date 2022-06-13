import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kPrimaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: context.read<BotnavbarCubit>().state.index,
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
          label: 'Jobs',
          icon: Icon(Icons.business_center_rounded),
        ),
        BottomNavigationBarItem(
          label: 'More',
          icon: Icon(Icons.more),
        ),
      ],
      onTap: (value) {
        switch (value) {
          case 0:
            context.read<BotnavbarCubit>().onSelect(0);
            Navigator.pushNamed(context, 'delivererhome');
            break;
          case 1:
            context.read<BotnavbarCubit>().onSelect(1);
            //Navigator.pushNamed(context, '/search');
            break;
          case 2:
            context.read<BotnavbarCubit>().onSelect(2);
            Navigator.pushNamed(context, 'jobs');
            index = 2;
            break;
          case 3:
            context.read<BotnavbarCubit>().onSelect(3);
            print("clicked");
            Navigator.pushNamed(context, 'deliverermore');
            index = 3;
            break;
        }
      },
    );
  }
}
