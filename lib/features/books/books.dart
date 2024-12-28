import 'package:flutter/cupertino.dart';

import 'package:ursa_books/core/activity/activity.dart';

import 'navigation.dart';
export 'ui/books_sidebar.dart';
export 'ui/books_collection/view/books_page.dart';
export 'ui/books_completed.dart';
export 'ui/book_details/book_details.dart';

class Books {
  static Activity activity =
      Activity(icon: CupertinoIcons.book_solid, entryRoute: BooksNavigation.root, entryPath: '/books');
}
