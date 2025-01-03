// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather_provider.dart';
import 'weather_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIMWeathers',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}
