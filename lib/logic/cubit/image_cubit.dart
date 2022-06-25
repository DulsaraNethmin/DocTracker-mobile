import 'dart:convert';
import 'dart:typed_data';
import 'package:doctracker/logic/validators/logout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:doctracker/presentation/constants/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  Future getURLs(String fileType, BuildContext context) async {
    emit(ImageLoading());
    try {
      var dio = Dio();
      final endpoint = restAPI + '/get/presignedurl';
      final data = {"fileType": fileType};
      print(endpoint);
      final urls = await dio.post(endpoint, data: data);
      //print(urls);
      final urlsAsmap = jsonDecode(urls.toString());
      print(urls);
      if (urls.statusCode == 201) {
        print('gello');
        emit(ImageURLLoaded(
            upload_url: urlsAsmap["uploadUrl"],
            download_url: urlsAsmap["downloadUrl"]));
      } else {
        emit(ImageError());
      }
    } catch (e) {
      print(e);
      emit(ImageError());
      LogOut(context);
      ScaffoldMessenger.of(context).showSnackBar(error_snack_bar);
    }
  }

  Future uploadImage(XFile image, String fileType) async {
    try {
      //BaseOptions(headers: {"Content-Type": "image/${fileType}"})
      final dio = Dio();
      final image_state = state;
      var upload_url =
          (image_state is ImageURLLoaded) ? image_state.upload_url : "";
      print(upload_url);
      Uint8List byte = await image.readAsBytes();
      print(image.path.toString().split('/').last);
      FormData data = FormData.fromMap({
        "image": await MultipartFile.fromFile(image.path,
            filename: image.path.toString().split('/').last)
      });
      //final response = await dio.put(upload_url, data: data2);
      final response = await http.put(Uri.parse(upload_url), body: byte);
      print(response);
      if (response.statusCode == 200) {
        emit(ImageUploaded(
            download_url: (image_state is ImageURLLoaded)
                ? image_state.download_url
                : ""));
      } else {
        emit(ImageError());
      }
    } on DioError catch (e) {
      print(e);
      emit(ImageError());
    }
  }

  void toInitialState() {
    emit(ImageInitial());
  }
}
