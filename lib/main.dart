import 'package:flutter/material.dart';
import 'package:ursa_books/app/portal.dart';
import 'package:ursa_books/data/rust/third_party/ark_application/application.dart';
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

  late DApplication app;
  late DPortal portal;
  late ArkBooks booksCtr;

  bool started = false;

  Future<void> initModel() async {
    await RustLib.init();
    // Init app base services
    // final dir = await getApplicationDocumentsDirectory();
    final dir = await getApplicationSupportDirectory();
    final appConfig = ApplicationConfig(storageDir: dir.path);
    app = await DApplication.run(config: appConfig);
    final portal = await app.mainPortal();
    this.portal = portal!;
    booksCtr = portal.booksCtr();

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
  // return MultiBlocProvider(providers: [
  //   BlocProvider<BooksCollectionBloc>(
  //     create: (BuildContext context) => BooksCollectionBloc(context.read<UserBooksRepository>()),
  //   ),
  //   BlocProvider<BookImportCubit>(
  //     create: (BuildContext context) => BookImportCubit(context.read<UserBooksRepository>()),
  //   ),
  // ], child: const BooksCollection());

  Widget applicationBuilder(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserBooksRepository>(create: (context) => UserBooksRepository(booksCtr)),
        RepositoryProvider<Portal>(create: (context) => Portal(portal)),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: getTheme(),
        routerConfig: router.router,
      ),
    );
    // return RepositoryProvider.value(
    //   value: UserBooksRepository(booksCtr),
    //   child: MaterialApp.router(
    //     debugShowCheckedModeBanner: false,
    //     theme: getTheme(),
    //     routerConfig: router.router,
    //   ),
    // );
  }
}
