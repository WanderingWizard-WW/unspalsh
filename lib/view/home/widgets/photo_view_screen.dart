import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:unspalsh/view/home/entities/unsplash_photo.dart';

class PhotoViewScreen extends StatelessWidget {
  const PhotoViewScreen({Key? key, required this.photo}) : super(key: key);

  final UnsplashPhoto photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.black38,
      ),
      body: PhotoView(
        imageProvider: NetworkImage(photo.regularUrl),
        heroAttributes: PhotoViewHeroAttributes(tag: photo.id),
        maxScale: PhotoViewComputedScale.contained * 2.5,
        minScale: PhotoViewComputedScale.contained,
      ),
    );
  }
}
