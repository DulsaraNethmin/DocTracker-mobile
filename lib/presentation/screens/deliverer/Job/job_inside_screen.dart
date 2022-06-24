import 'package:doctracker/data/model/deliveryMode.dart';
import 'package:doctracker/data/provider/deliveryProvider.dart';
import 'package:doctracker/data/provider/userProvider.dart';
import 'package:doctracker/logic/cubit/user_cubit.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';

class JobInside extends StatelessWidget {
  List<Delivery>? list;
  JobInside({required this.list});

  @override
  Widget build(BuildContext context) {
    final job_card = GFCard(
      boxFit: BoxFit.cover,
      titlePosition: GFPosition.start,
      image: Image.asset(
        'assets/images/job_card_image.jpg',
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      showImage: true,
      title: GFListTile(
        avatar: GFAvatar(
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        titleText: list![0].customerName,
        subTitleText: (list![0].isJobCompleted == 0)
            ? "Open Job"
            : (list![0].isJobCompleted == 1)
                ? "Pending Job"
                : "Finished",
      ),
      content: Column(
        children: [
          Text("Total : ${list!.length} deliveries."),
          SizedBox(
            height: 10,
          ),
          GFButton(
              onPressed: () async {
                final user_state = context.read<UserCubit>().state;
                final job_id = list![0].jobId;
                final deliverer_id =
                    (user_state is UserLogedin) ? user_state.uuid : "000";
                try {
                  final deliveryProvider = Deliveryprovider();
                  var res = await deliveryProvider.updateJobStateToPending(
                      job_id, deliverer_id);
                  print(res.statusCode);
                  if (res.statusCode == 200) {
                    Navigator.pushNamed(context, 'myjobs');
                  }
                } catch (e) {
                  print(e);
                }
              },
              color: GFColors.SECONDARY,
              text: "Accept Job"),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Job'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(children: [job_card]),
    );
  }
}
