import 'dart:async';
import 'package:flutter/rendering.dart';

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ursa_books/data/rust/api/core.dart';
import 'package:ursa_books/data/rust/third_party/ark_application/file_storage/images.dart';

typedef Fetcher = Future<ImageInfo> Function(ImageQuery iri);

class DImageQuery {
  final String iri;
  final ImageConfiguration config;

  DImageQuery(this.iri, this.config);

  @override
  bool operator ==(Object other) => other is DImageQuery && iri == other.iri && config == other.config;

  @override
  int get hashCode => Object.hash(iri, config.hashCode);
}

class PortalImage extends ImageProvider<DImageQuery> {
  final String iri;
  final FileProvider provider;

  PortalImage(this.iri, this.provider);

  @override
  Future<DImageQuery> obtainKey(ImageConfiguration configuration) {
    final result = DImageQuery(iri, configuration);
    return SynchronousFuture<DImageQuery>(result);
  }

  @override
  ImageStreamCompleter loadImage(DImageQuery key, ImageDecoderCallback decode) {
    final StreamController<ImageChunkEvent> chunkEvents = StreamController<ImageChunkEvent>();
    chunkEvents.add(ImageChunkEvent(cumulativeBytesLoaded: 0, expectedTotalBytes: null));
    final query =
        ImageQuery(width: key.config.size?.width.toInt(), height: key.config.size?.height.toInt(), fill: false);

    return MultiFrameImageStreamCompleter(
      codec: provider
          .getImage(urn: iri, params: query)
          .then<Uint8List>((data) async {
            if (data == null) {
              throw Exception("Failed to get image");
            } else {
              return data;
            }
          })
          .catchError((Object e, StackTrace stack) {
            scheduleMicrotask(() {
              PaintingBinding.instance.imageCache.evict(key);
            });
            return Future<Uint8List>.error(e, stack);
          })
          .whenComplete(chunkEvents.close)
          .then<ui.ImmutableBuffer>(ui.ImmutableBuffer.fromUint8List)
          .then<ui.Codec>(decode),
      chunkEvents: chunkEvents.stream,
      scale: 1.0,
      debugLabel: key.iri,
      // informationCollector: () => <DiagnosticsNode>[
      //   DiagnosticsProperty<ImageProvider>('Image provider', this),
      //   DiagnosticsProperty<Uri>('URL', key),
      // ],
    );
  }

  @override
  String toString() => '${objectRuntimeType(this, 'PortalImage')}("$iri")';
}
