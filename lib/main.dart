import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/directions_page.dart';
import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/pages/map_pages.dart';
import 'package:qr_reader/services/ui_provider.dart';
import 'package:qr_reader/theme/ThemeGreen.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    /*bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());
    if(inDebug){
      return ErrorWidget(details.exception);
    }*/
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error\n${details.exception}',
        style: const TextStyle(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'mpa': (_) => const MapPage(),
        },
        theme: ThemeGreen.themeData,
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return const MapPage();

      case 1:
        return const DirectionsPage();

      default:
        return const MapPage();
    }
  }
}
