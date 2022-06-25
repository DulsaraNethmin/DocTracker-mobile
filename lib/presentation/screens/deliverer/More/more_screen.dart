import 'package:doctracker/logic/cubit/botnavbar_cubit.dart';
import 'package:doctracker/logic/cubit/socket_cubit.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:doctracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class DelMoreScreen extends StatefulWidget {
  @override
  State<DelMoreScreen> createState() => _DelMoreScreenState();
}

class _DelMoreScreenState extends State<DelMoreScreen> {
  //const MoreScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user_state = context.read<UserCubit>().state;
    final user_id = (user_state is UserLogedin) ? user_state.uuid : "000";
    final socket_state = context.read<SocketCubit>().state;
    final logout = InkWell(
        onTap: () {
          print('logout');
          context.read<BotnavbarCubit>().toInitialState();
          if (socket_state is SocketConnected) {
            socket_state.socket.emit('end', user_id);
            socket_state.socket.disconnect();
          }
          context.read<SocketCubit>().toInitialState();
          Navigator.of(context).pushNamedAndRemoveUntil(
              'login', (Route<dynamic> route) => false);
        },
        child: GFListTile(
            avatar: GFAvatar(
              backgroundColor: Colors.grey[600],
              child: Icon(Icons.logout),
            ),
            titleText: 'Logout',
            subTitleText: 'Logout from the system.',
            icon: Icon(Icons.arrow_right)));
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
        backgroundColor: kPrimaryColor,
      ),
      //body: Container(),
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [logout],
        ),
      ),
    );
  }
}
