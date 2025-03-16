import 'dart:typed_data';
import 'dart:async';

import 'package:ursa_books/features/books/domain/user_books_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ursa_books/data/rust/third_party/ark_backend_api/creative_work/book.dart';

class BookCard extends StatefulWidget {
  final Book book;

  final double? imageMaxWidth;
  final double? imageMaxHeight;

  const BookCard(
      {super.key, required this.book, this.imageMaxHeight, this.imageMaxWidth});

  @override
  State<StatefulWidget> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  late Future<Uint8List?> _imageCover;
  String? urn;

  _BookCardState();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted && urn != widget.book.thumbnailIri) {
      updateCover();
    }
  }

  @override
  void didUpdateWidget(BookCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateCover();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter, child: buildCard(context));
  }

  Widget buildCard(BuildContext context) {
    return FutureBuilder(
        future: _imageCover,
        builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Image.memory(
              snapshot.data!,
              fit: BoxFit.fill,
              frameBuilder: frameBuilder,
            );
          } else {
            return frameBuilder(
                context,
                BookCardPlaceholder(title: widget.book.name, author: null),
                null,
                true);
          }
        });
  }

  Widget frameBuilder(BuildContext context, Widget child, int? frame,
      bool wasSynchronouslyLoaded) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)), child: child);
  }

  void updateCover() {
    setState(() {
      final (width, _) = imageCacheSize(context);
      _imageCover = context
          .read<UserBooksRepository>()
          .getCover(widget.book.thumbnailIri, width, null);
      urn = widget.book.thumbnailIri;
    });
  }

  (int?, int?) imageCacheSize(BuildContext context) {
    final media = MediaQuery.of(context);
    final pixelRatio = media.devicePixelRatio;
    double? height = widget.imageMaxHeight;
    double? width = widget.imageMaxWidth;

    if (width != null) {
      width = width * pixelRatio;
    }
    if (height != null) {
      height = height * pixelRatio;
    }
    return (width?.toInt(), height?.toInt());
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
