// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:couter_bloc/bloc/image_picker/image_picker_event.dart';
import 'package:couter_bloc/bloc/image_picker/image_picker_state.dart';
import 'package:couter_bloc/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(galleryImagePicker);
  }

  void cameraCapture(
    CameraCapture event,
    Emitter<ImagePickerState> states,
  ) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void galleryImagePicker(
    GalleryImagePicker event,
    Emitter<ImagePickerState> states,
  ) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}
