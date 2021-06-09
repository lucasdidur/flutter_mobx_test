import 'package:flutter/material.dart';

class Texto extends StatelessWidget {
  Texto(
    this.text, {
    this.fontSize = 10,
    this.bold = false,
    this.color,
    this.italic = false,
    this.maxLines,
    this.textOverflow = TextOverflow.ellipsis,
  });

  final String text;
  final double fontSize;
  final bool bold;
  final Color color;
  final bool italic;
  final int maxLines;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        // color: color ?? theme.themeColor.textColor,
        fontStyle: italic ? FontStyle.italic : null,
      ),
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
