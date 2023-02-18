import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_marvel_comics/model/charactermodel.dart';
import 'package:the_marvel_comics/widgetlottie.dart';

Widget cachednetwork(Thumbnail thumbnail, {double? width, double? height}) {
  return CachedNetworkImage(
    imageUrl: '${thumbnail.path}.${thumbnail.extension}',
    imageBuilder: (context, imageProvider) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) =>
        lottieAsset(isSmaller: true, jsonName: 'batman'),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
