import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/src/photos/photo_indicator.dart';

class PhotosAdapter extends StatefulWidget {
  final List<String> photoUrls;
  final int visiblePhotoIndex;

  PhotosAdapter({this.photoUrls, this.visiblePhotoIndex});

  @override
  _PhotosAdapterState createState() => _PhotosAdapterState();
}

class _PhotosAdapterState extends State<PhotosAdapter> {
  int visiblePhotoIndex;

  @override
  void initState() {
    super.initState();
    visiblePhotoIndex = widget.visiblePhotoIndex;
  }

  @override
  void didUpdateWidget(PhotosAdapter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visiblePhotoIndex != oldWidget.visiblePhotoIndex) {
      setState(() {
        visiblePhotoIndex = widget.visiblePhotoIndex;
      });
    }
  }

  void _prevImage() {
    setState(() {
      visiblePhotoIndex = visiblePhotoIndex > 0 ? visiblePhotoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      visiblePhotoIndex = visiblePhotoIndex < widget.photoUrls.length - 1
          ? visiblePhotoIndex + 1
          : visiblePhotoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // Photo
        CachedNetworkImage(
          imageUrl: widget.photoUrls[visiblePhotoIndex],
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover
        ),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: new PhotoIndicator(
            photoCount: widget.photoUrls.length,
            visiblePhotoIndex: visiblePhotoIndex,
          ),
        ),
        // Photo control
        _buildMultiplePhotosNavigationControl(),
      ],
    );
  }

  Widget _buildMultiplePhotosNavigationControl() {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new GestureDetector(
          onTap: _prevImage,
          child: new FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topLeft,
            child: new Container(
              color: Colors.transparent,
            ),
          ),
        ),
        new GestureDetector(
          onTap: _nextImage,
          child: new FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topRight,
            child: new Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}

