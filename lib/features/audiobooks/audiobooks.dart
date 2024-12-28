import 'package:flutter/cupertino.dart';

import 'package:ursa_books/core/activity/activity.dart';
import 'navigation.dart';

export 'ui/audiobooks_all.dart';
export 'ui/audiobooks_sidebar.dart';
export 'ui/audiobooks_complete.dart';

class Audiobooks {
  static Activity activity =
      Activity(icon: CupertinoIcons.headphones, entryRoute: AudiobooksNavigation.root, entryPath: '/audiobooks');
}
