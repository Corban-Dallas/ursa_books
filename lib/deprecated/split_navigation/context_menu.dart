import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'ui_context.dart';

class ContextMenu extends StatefulWidget implements PreferredSizeWidget {
  const ContextMenu({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _ContextMenu();
  }

  // 38 - macos compact unified
  @override
  Size get preferredSize {
    return const Size.fromHeight(50);
  }
}

class _ContextMenu extends State<ContextMenu>
    with SingleTickerProviderStateMixin {
  late UIContext _uiContext;
  late GoRouteInformationProvider _routeProvider;
  final MenuController _controller = MenuController();

  @override
  void initState() {
    _routeProvider = GoRouter.of(context).routeInformationProvider;
    _routeProvider.addListener(_updateState);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _updateState();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _routeProvider.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    final path = GoRouterState.of(context).fullPath ?? '/';
    setState(() {
      _uiContext = UIContext.fromPath(path) ?? UIContext.comics;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MenuAnchor(
          controller: _controller,
          builder: (context, _, child) {
            return _menuButton(context);
          },
          menuChildren: UIContext.values.map((uiContext) {
            return _menuItem(context, uiContext, constraints.maxWidth);
          }).toList());
    });
  }

  Widget _menuButton(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return ListTile(
      leading: Icon(_uiContext.icon),
      title: Text(
        _uiContext.mode,
        style: titleStyle,
      ),
      trailing: Icon(
        _controller.isOpen
            ? CupertinoIcons.chevron_down
            : CupertinoIcons.chevron_right,
        size: 16,
      ),
      onTap: _toogleMenu,
    );
  }

  Widget _menuItem(BuildContext context, UIContext uiContext, double width) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: width),
      child: ListTile(
        leading: Icon(uiContext.icon),
        title: Text(uiContext.mode),
        contentPadding: const EdgeInsets.only(left: 8, right: 8),
        onTap: () => _onTap(context, uiContext),
      ),
    );
  }

  void _toogleMenu() {
    setState(() {
      _controller.isOpen ? _controller.close() : _controller.open();
    });
  }

  void _onTap(BuildContext context, UIContext mode) {
    setState(() {
      _controller.close();
      switch (mode) {
        case UIContext.books:
          context.go('/books');
        case UIContext.audiobooks:
          context.go('/audiobooks');
        case UIContext.comics:
          context.go('/comics');
      }
    });
  }
}
