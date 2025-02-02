import 'dart:io';

import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

class AssetsUtils {
  AssetsUtils._();

  static const String jpegUrl =
      'https://cdn.jsdelivr.net/gh/ExampleAssets/ExampleAsset@master/IMG_1096.jpeg';

  static Future<File> downloadJpeg() async {
    final cacheDir = await getApplicationCacheDirectory();

    final dtMs = DateTime.now().millisecondsSinceEpoch;
    final file = File('${cacheDir.path}/$dtMs.jpg');

    final bytes = await get(Uri.parse(jpegUrl));
    await file.writeAsBytes(bytes.bodyBytes);
    return file;
  }
}
