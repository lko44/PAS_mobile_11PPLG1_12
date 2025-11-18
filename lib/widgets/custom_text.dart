import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;

  const CustomText (
    this.data, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
  });

  /// Heading style
  factory CustomText.heading(String data) {
    return CustomText(
      data,
      size: 26,
      weight: FontWeight.bold,
      color: Colors.deepPurple,
      letterSpacing: 1.2,
    );
  }

  /// Subtitle / description
  factory CustomText.subtitle(String data) {
    return CustomText(
      data,
      size: 15,
      weight: FontWeight.w500,
      color: Colors.grey,
    );
  }

  /// Body / default text
  factory CustomText.body(String data) {
    return CustomText(
      data,
      size: 14,
      weight: FontWeight.normal,
      color: Colors.black87,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
