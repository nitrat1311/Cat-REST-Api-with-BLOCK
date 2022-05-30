import 'package:flutter/material.dart';

class CatsPlaceHolder extends StatelessWidget {
  const CatsPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/cat.gif',
      alignment: Alignment.center,
    );
  }
}
