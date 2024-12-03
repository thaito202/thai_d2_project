import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './pages/first_page.dart';
import './translations/locale_keys.g.dart';
import './translations/codegen_loader.g.dart';
import 'theme/theme_data.dart';
import 'theme/theme_manage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
      ],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp()));
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/firstPage/:name',
    name: 'firstPage',
    builder: (context, state) {
      final name = state.pathParameters['name'];
      return FirstPage(title: 'Demo $name');
    },
  ),
]);
ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      title: 'Localization Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      routerConfig: _router,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localization Demo'),
        actions: [
          Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _themeManager.toggleTheme(newValue);
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.hi.tr()),
            const SizedBox(
              height: 20,
            ),
            Text(LocaleKeys.test.tr()),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await context.setLocale(const Locale('vi'));
              },
              child: const Text('Translate to Vietnamese'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await context.setLocale(const Locale('en'));
              },
              child: const Text('Dịch sang tiếng Anh'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                //context.goNamed('firstPage');
                context.go('/firstPage/Flutter Navigator');
              },
              child: const Text('Go to First Page'),
            ),
          ],
        ),
      ),
    );
  }
}
