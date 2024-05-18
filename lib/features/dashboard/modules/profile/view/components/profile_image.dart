import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/utilities/pick_image.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;
  final Uint8List? image;
  final void Function(Uint8List) onImageSelected;

  const ProfileImage({
    super.key,
    this.imageUrl,
    this.image,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 67,
          backgroundImage: getBackgroundImage(),
        ),
        Positioned(
          bottom: -7,
          left: 70,
          child: IconButton(
            onPressed: _selectImage,
            icon: const Icon(Icons.add_a_photo),
          ),
        )
      ],
    );
  }

  ImageProvider<Object>? getBackgroundImage() {
    if (image != null) {
      return MemoryImage(image!);
    } else if (imageUrl != null) {
      return NetworkImage(imageUrl!);
    } else {
      return const NetworkImage(
        'https://th.bing.com/th/id/OIP.c5KXw-wPcnwyyBNayoXfFQAAAA?rs=1&pid=ImgDetMain',
      );
    }
  }

  Future<void> _selectImage() async {
    Uint8List pickedFile = await pickImage(ImageSource.gallery);
     String resp = await saveImage(file: pickedFile);
    if (resp=="success") {
      final imageBytes = await pickedFile;
      onImageSelected(imageBytes);
    }
  }
}