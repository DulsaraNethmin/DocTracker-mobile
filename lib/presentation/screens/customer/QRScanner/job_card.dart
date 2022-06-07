import 'package:doctracker/data/model/new_job_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class JobCard extends StatelessWidget {
  const JobCard({Key? key, required this.newjob}) : super(key: key);
  final NewJob newjob;
  @override
  Widget build(BuildContext context) {
    return GFListTile(
        avatar: GFAvatar(),
        titleText: newjob.doc_name,
        subTitleText: 'to: '+newjob.end_customer,
        icon: Icon(Icons.delete));
  }
}
