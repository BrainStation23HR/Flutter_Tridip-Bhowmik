import 'package:flutter/material.dart';

class DynamicRichText extends StatelessWidget {
  final List<TextPart> textParts;

  const DynamicRichText({
    super.key,
    required this.textParts,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 24, color: Colors.black),
        children: textParts.map((part) {
          return TextSpan(
            text: part.text,
            style: part.style,
          );
        }).toList(),
      ),
    );
  }
}

class TextPart {
  final String text;
  final TextStyle style;

  TextPart({required this.text, required this.style});
}
