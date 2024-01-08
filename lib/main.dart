import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:jimla/provider/product.dart';
import 'package:jimla/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => ProductProvider())
            ],
            child: const MyApp(),
        );
      }
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jimla',
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}
