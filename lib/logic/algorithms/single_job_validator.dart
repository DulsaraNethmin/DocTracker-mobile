import 'package:doctracker/logic/cubit/new_job_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool isJobExist(String doc_id, BuildContext context) {
  final new_job_state = context.read<NewJobCubit>().state;
  if (new_job_state is NewJobs) {
    for (int i = 0; i < new_job_state.jobs.length; i++) {
      if (new_job_state.jobs[i].doc_id == doc_id) {
        return true;
      }
    }
  }
  return false;
}
