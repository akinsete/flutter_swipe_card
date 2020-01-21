import 'package:flutter/material.dart';

class PhotoIndicator extends StatelessWidget {
  final int photoCount;
  final int visiblePhotoIndex;

  PhotoIndicator({this.visiblePhotoIndex, this.photoCount});

  Widget _buildInactiveIndicator() {
    return new Expanded(
      child: new Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
        child: new Container(
          height: 3.0,
          decoration: new BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: new BorderRadius.circular(2.5)),
        ),
      ),
    );
  }

  Widget _buildActiveIndicator() {
    return new Expanded(
      child: new Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
        child: new Container(
          height: 3.0,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(2.5),
              boxShadow: [
                new BoxShadow(
                    color: const Color(0x22000000),
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0.0, 1.0))
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < photoCount; i++) {
      indicators.add(i == visiblePhotoIndex
          ? _buildActiveIndicator()
          : _buildInactiveIndicator());
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(0.0),
      child: new Row(
        children: _buildIndicators(),
      ),
    );
  }
}