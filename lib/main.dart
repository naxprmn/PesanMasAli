import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:overflow/provider/view_model.dart';
import 'package:overflow/view/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(providers: [
        ChangeNotifierProvider<MarkerModel>(
          create: (_) => MarkerModel(),
        ),
      ], child: const MyApp()), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PESAN MAS ALI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const MyHomePage(),
    );
  }
}
