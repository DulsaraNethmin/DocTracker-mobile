import 'package:bloc/bloc.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  Future getURLs(String fileType) async {
    emit(ImageLoading());
    try {
      var dio = Dio();
      final endpoint = restAPI + '/get/presignedurl';
      final data = {"fileType": fileType};
      print(endpoint);
      final urls = await dio.post(endpoint, data: data);
      print(urls);
    } catch (e) {
      print(e);
      emit(ImageError());
    }
  }
}
