import 'package:ursa_books/data/image_provider.dart';
import 'package:ursa_books/data/rust/api/core.dart';

class Portal {
  DPortal portal;
  FileProvider fileProvider;

  Portal(this.portal) : fileProvider = portal.fileProvider();

  PortalImage imageProvider(String urn) {
    return PortalImage(urn, fileProvider);
  }
}
