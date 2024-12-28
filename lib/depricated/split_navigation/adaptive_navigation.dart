import 'package:ursa_books/features/account/view/account_button.dart';
import 'package:flutter/material.dart';
import 'package:platform/platform.dart';
import 'package:provider/provider.dart';

// import '../../internal/routes.dart';
import 'context_menu.dart';
import '../../core/appbar/desktop_appbar.dart';

enum Layout { compact, medium, expanded }

class AdaptiveNavigation extends StatefulWidget {
  // final List<ExtendedGoRoute> sideBarRoutes;
  final Widget sidebar;
  final Widget details;
  final platform = const LocalPlatform();

  const AdaptiveNavigation({super.key, required this.sidebar, required this.details});

  @override
  State<AdaptiveNavigation> createState() {
    return _AdaptiveNavigation();
  }
}

class _AdaptiveNavigation extends State<AdaptiveNavigation> with TickerProviderStateMixin {
  final sidebarMaxWidth = 240.0;

  final state = SplitState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final frame = MediaQuery.sizeOf(context);
    state.setDesktopMode(frame.width > 600);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => state, child: state.desktopMode ? expandedLayout(context) : compactLayout(context));
  }

  Widget expandedLayout(BuildContext context) {
    final divierColor = Theme.of(context).dividerColor;

    return Stack(
      children: [
        Row(
          children: [
            ConstrainedBox(constraints: BoxConstraints(maxWidth: sidebarMaxWidth), child: expandedSidebar(context)),
            VerticalDivider(
              color: divierColor,
              width: 1,
              thickness: 1,
            ),
            Expanded(child: widget.details)
          ],
        ),
        const DesktopAppbar(
          child: SizedBox.expand(),
        )
      ],
    );
  }

  Widget compactLayout(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
        ),
        body: widget.details,
        drawer: Drawer(child: widget.sidebar));
  }

  Widget expandedSidebar(BuildContext context) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
            minimum: EdgeInsets.only(top: DesktopAppbar.height),
            child: Column(
              children: [Scaffold(appBar: const ContextMenu(), body: widget.sidebar), const AccountButton()],
            )));
  }

  // double get toolbarHeight {
  //   switch (widget.platform.operatingSystem) {
  //     case Platform.windows:
  //       return 32;
  //     case Platform.macOS:
  //       return 38;
  //     default:
  //       return 0;
  //   }
  // }
}

class SplitState extends ChangeNotifier {
  bool desktopMode = true;
  bool hideSidebar = false;

  void setDesktopMode(bool value) {
    if (desktopMode == value) {
      return;
    }
    desktopMode = value;
    notifyListeners();
  }

  void setSidebarHidden(bool value) {
    if (hideSidebar == value) {
      return;
    }
    hideSidebar = value;
    notifyListeners();
  }
}
