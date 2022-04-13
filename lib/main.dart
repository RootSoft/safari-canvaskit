import 'package:flutter/material.dart';
import 'package:safari_canvaskit/config/routes/routes_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SafariApp());
}

class SafariApp extends StatelessWidget {
  const SafariApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safari Canvaskit',
      debugShowCheckedModeBanner: true,
      home: provideMainScreen(),
    );
  }
}
