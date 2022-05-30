import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_api/widgets/place_holder.dart';
import 'package:flutter/material.dart';

class CachedCatsImage extends StatelessWidget {
  final String imageUrl;

  const CachedCatsImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Image.network(
              imageUrl,
              fit: BoxFit.fill,
              alignment: Alignment.centerLeft,
            ),
        placeholder: (context, url) => CatsPlaceHolder(),
        errorWidget: (context, url, error) =>
            Image.asset('assets/images/placeholder.png'));
  }
}
