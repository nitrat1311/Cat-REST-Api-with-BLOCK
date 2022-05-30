import 'package:flutter/material.dart';

class CatsDescription extends StatelessWidget {
  const CatsDescription(
      {Key? key, required this.catsName, required this.catsOrigin})
      : super(key: key);

  final String catsName;
  final String catsOrigin;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(catsName,
            style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: (Colors.black),
                fontSize: 16)),
        Text('origin: $catsOrigin',
            style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                fontSize: 14)),
      ],
    );
  }
}
