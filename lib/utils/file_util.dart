import 'dart:io';
import 'dart:math';

Future<int> getFileSize(String path) async {
  File file = File(path);
  int bytes = await file.length();
  return bytes;
}

String formatFileSize(int bytes, [int decimals = 2]) {
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
}
