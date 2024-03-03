import 'dart:io';
import 'package:couter_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:couter_bloc/bloc/image_picker/image_picker_event.dart';
import 'package:couter_bloc/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:photo_view/photo_view.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Bloc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                if (state.file == null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<ImagePickerBloc>()
                              .add(GalleryImagePicker());
                        },
                        child: const CircleAvatar(
                          child: Icon(Icons.library_add),
                        ),
                      ),
                      const Gap(10),
                      InkWell(
                        onTap: () {
                          context.read<ImagePickerBloc>().add(
                                CameraCapture(),
                              );
                        },
                        child: const CircleAvatar(
                          child: Icon(Icons.camera),
                        ),
                      ),
                    ],
                  );
                } else {
                  return GestureDetector(
                    onDoubleTap: () {
                      _openPhotoViewGallery(context);
                    },
                    onTap: () {
                      _showImageOptions(context);
                    },
                    child: Hero(
                      tag: 'imageHero',
                      child: Image.file(
                        File(
                          state.file!.path.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200, // Đặt giá trị chiều cao mong muốn
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.photo_library,
                        size: 50,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        context
                            .read<ImagePickerBloc>()
                            .add(GalleryImagePicker());
                      },
                    ),
                    const Text('Thư Viện')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 50,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<ImagePickerBloc>().add(CameraCapture());
                      },
                    ),
                    const Text('Thư Viện')
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openPhotoViewGallery(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _buildPhotoViewGallery(),
      ),
    );
  }

  Widget _buildPhotoViewGallery() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Phóng to ảnh'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String choice) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'download',
                child: ListTile(
                  leading: Icon(Icons.download),
                  title: Text('Tải ảnh'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'share',
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Chia sẻ'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
              return PhotoView(
                imageProvider: FileImage(
                  File(
                    state.file!.path.toString(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
