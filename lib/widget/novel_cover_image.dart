import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:comic/app/ty_color.dart';

class NovelCoverImage extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;
  final BoxFit fit;

  NovelCoverImage(this.imgUrl, {this.width = 0, this.height = 0, this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        fit: fit ?? BoxFit.cover,
        width: 90,
        height: 120,
      ),
      decoration: BoxDecoration(border: Border.all(color: TYColor.paper)),
    );
  }
}
