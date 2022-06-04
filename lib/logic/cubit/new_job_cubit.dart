import 'package:bloc/bloc.dart';
import 'package:doctracker/data/model/new_job_model.dart';
import 'package:meta/meta.dart';

part 'new_job_state.dart';

class NewJobCubit extends Cubit<NewJobState> {
  NewJobCubit() : super(NewJobInitial());
}
