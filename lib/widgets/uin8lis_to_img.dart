import 'dart:typed_data';
import 'dart:ui';

Future<Image> uin8lisToImg(List<int> uin8lis) async {
  final bytes = Uint8List.fromList(uin8lis);

  // copy from decodeImageFromList of package:flutter/painting.dart
  final codec = await instantiateImageCodec(bytes);
  final frameInfo = await codec.getNextFrame();
  return frameInfo.image;
}
