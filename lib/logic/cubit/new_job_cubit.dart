import 'package:bloc/bloc.dart';
import 'package:doctracker/data/model/new_job_model.dart';
import 'package:meta/meta.dart';

part 'new_job_state.dart';

class NewJobCubit extends Cubit<NewJobState> {
  NewJobCubit() : super(NewJobInitial());

  void jobArray() {
    emit(NewJobs());
  }

  void addToJobArray(NewJob newjob) {
    final job_state = state;
    if (job_state is NewJobs) {
      //job_state.jobs.add(newjob);
      NewJobs.jobs.add(newjob);
    }
  }

  void toInitialState() {
    emit(NewJobInitial());
  }
}
