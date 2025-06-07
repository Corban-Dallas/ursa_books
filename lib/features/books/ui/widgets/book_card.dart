import 'package:flutter/material.dart';

import 'package:ursa_books/data/image_provider.dart';
import 'package:ursa_books/data/rust/third_party/ark_backend_api/creative_work/book.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final PortalImage imageProvider;

  const BookCard({super.key, required this.book, required this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Image(
          image: imageProvider,
          width: constraints.hasBoundedWidth ? constraints.maxWidth : null,
          height: constraints.hasBoundedHeight ? constraints.maxHeight : null,
          fit: BoxFit.contain,
          loadingBuilder: loadingBuilder,
          frameBuilder: frameBuilder,
          errorBuilder: placeholder);
    });
  }

  Widget loadingBuilder(BuildContext context, Widget widget, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return widget;
    } else {
      // return Skeletonizer(
      //   enabled: true,
      //   child: SizedBox(width: 100, height: 100,),
      // );
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget placeholder(BuildContext context, Object message, StackTrace? stackTrace) {
    return BookCardPlaceholder(title: book.name, author: null);
  }

  Widget frameBuilder(BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
    return ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(5)), child: child);
  }
}

class BookCardPlaceholder extends StatelessWidget {
  final String title;
  final String? author;

  const BookCardPlaceholder({super.key, required this.title, this.author});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.64,
      child: Container(
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Column(
          children: [
            const Spacer(),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
