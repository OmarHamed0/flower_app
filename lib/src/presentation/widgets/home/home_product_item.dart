import 'package:flower_app/core/widgets/cached_network_image%20_widget.dart';
import 'package:flutter/material.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem(
      {super.key, required this.imageUrl, required this.title, this.price});
  final String imageUrl;
  final String title;
  final num? price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImageWidget(imageUrl: imageUrl, width: 130, height: 130),
        // Image.network(
        //   imageUrl,
        //   width: 130,
        //   height: 150,
        //   fit: BoxFit.cover,
        // ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: price == null ? 16 : 14,
            color: Colors.black87,
            fontWeight: price == null ? FontWeight.bold : FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
        if (price != null) const SizedBox(height: 4),
        if (price != null)
          Text(
            '$price EGP',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
