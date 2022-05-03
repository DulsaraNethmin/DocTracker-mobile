part of 'image_cubit.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  String upload_url;
  String download_url;
  ImageLoaded({required this.upload_url, required this.download_url});
}

class ImageError extends ImageState {}
