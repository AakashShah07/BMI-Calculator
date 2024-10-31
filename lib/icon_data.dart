import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData cardIcon;
  final String title;
  const IconContent({super.key, required this.cardIcon, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon as IconData?,
          size: 80.0,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: labelTextStyle,
        )
      ],
    );
  }
}