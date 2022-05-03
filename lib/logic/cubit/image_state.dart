part of 'image_cubit.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageURLLoaded extends ImageState {
  String upload_url;
  String download_url;
  ImageURLLoaded({required this.upload_url, required this.download_url});
}

class ImageUploaded extends ImageState {
  String download_url;
  ImageUploaded({required this.download_url});
}

class ImageError extends ImageState {}
