part of 'new_job_cubit.dart';

@immutable
abstract class NewJobState {}

class NewJobInitial extends NewJobState {}

class NewJobs extends NewJobState {
  static List<NewJob> jobs = [];
}
