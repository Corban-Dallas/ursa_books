import 'package:flutter/cupertino.dart';

enum UIContext {
  books('Books', CupertinoIcons.book_solid),
  audiobooks('Audio books', CupertinoIcons.headphones),
  comics('Comics', CupertinoIcons.ant);

  const UIContext(this.mode, this.icon);

  static UIContext? fromPath(String path) {
    final head = path.split('/');
    if (head.length < 2) {
      return null;
    }
    switch (head[1]) {
      case 'books':
        return UIContext.books;
      case 'audiobooks':
        return UIContext.audiobooks;
      case 'comics':
        return UIContext.comics;
      default:
        return null;
    }
  }

  String entryPath() {
    switch (this) {
      case UIContext.books:
        return '/books';
      case UIContext.audiobooks:
        return '/audiobooks';
      case UIContext.comics:
        return '/comics';
    }
  }

  final String mode;
  final IconData icon;
}
