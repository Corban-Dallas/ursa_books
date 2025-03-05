import 'package:flutter/material.dart';
// third party
import 'package:window_manager/window_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Rust
import 'data/rust/api/books.dart';
import 'data/rust/api/core.dart';
import 'data/rust/frb_generated.dart';
// Dart
// import 'features/books/domain/books_repository.dart';
import 'features/books/domain/user_books_repository.dart';
import 'app/theme.dart';
import 'app/launch_page.dart';
import 'package:ursa_books/app/router.dart';
// Features
import 'package:ursa_books/features/audiobooks/audiobooks.dart';
import 'package:ursa_books/features/books/books.dart';
import 'package:ursa_books/features/comics/comics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // For desktop window
  await prepareWindow();
  // Entry point
  runApp(const MyApp());
}

Future<void> prepareWindow() async {
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
      minimumSize: Size(400, 400),
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      windowButtonVisibility: true);
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyApp();
  }
}

final router = AppRouter(activities: [Books.activity, Audiobooks.activity, Comics.activity]);

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initModel();
  }

  late Application app;
  late ArkBooks booksCtr;

  bool started = false;

  Future<void> initModel() async {
    await RustLib.init();
    // Init app base services
    // final dir = await getApplicationDocumentsDirectory();
    final dir = await getApplicationSupportDirectory();
    final appConfig = AppConfig(storageDir: dir.path);
    app = await Application.newInstance(config: appConfig);
    await app.start();
    final mainPortal = await app.mainPortal();
    booksCtr = await mainPortal!.booksCtr();

    // Prepare model
    setState(() {
      started = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (started) {
      return applicationBuilder(context);
    } else {
      return const MaterialApp(home: LaunchPage());
    }
  }

  Widget applicationBuilder(BuildContext context) {
    return RepositoryProvider.value(
      value: UserBooksRepository(booksCtr),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: getTheme(),
        routerConfig: router.router,
      ),
    );
  }
}
