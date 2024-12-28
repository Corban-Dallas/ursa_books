import 'dart:async';
import 'package:flutter/rendering.dart';

typedef Fetcher = Future<ImageInfo> Function(String iri);

class FutureImageProvider extends ImageProvider<String> {
  final String iri;
  final Fetcher fetcher;

  FutureImageProvider(this.iri, this.fetcher);

  @override
  Future<String> obtainKey(ImageConfiguration configuration) {
    return Future.value(iri);
  }

  @override
  ImageStreamCompleter loadImage(String key, ImageDecoderCallback decode) {
    return OneFrameImageStreamCompleter(fetcher(key));
  }
}
