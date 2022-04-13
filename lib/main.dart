import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:safari_canvaskit/config/routes/routes_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register service location
  final router = configureRoutes('/');

  runApp(SafariApp(
    router: router,
  ));
}

class SafariApp extends StatelessWidget {
  final GoRouter router;

  const SafariApp({
    required this.router,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safari Canvaskit',
      debugShowCheckedModeBanner: true,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        scrollbars: false,
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      home: provideMainScreen(),
    );
  }

  ///
  ///  @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routeInformationParser: router.routeInformationParser,
//       routerDelegate: router.routerDelegate,
//       builder: (context, child) => ResponsiveWrapper.builder(
//         child,
//         maxWidth: 1200,
//         minWidth: 480,
//         defaultScale: false,
//         breakpoints: [
//           ResponsiveBreakpoint.resize(
//             480,
//             name: MOBILE,
//           ),
//           ResponsiveBreakpoint.autoScale(
//             800,
//             name: TABLET,
//           ), // autoscale
//           ResponsiveBreakpoint.resize(
//             1000,
//             name: DESKTOP,
//           ),
//           const ResponsiveBreakpoint.autoScale(2460, name: '4K'), // autoscale
//         ],
//         background: Container(
//           color: Colors.white,
//         ),
//       ),
//       title: 'Safari Canvaskit',
//       debugShowCheckedModeBanner: false,
//       scrollBehavior: const MaterialScrollBehavior().copyWith(
//         scrollbars: false,
//         dragDevices: {
//           PointerDeviceKind.mouse,
//           PointerDeviceKind.touch,
//           PointerDeviceKind.stylus,
//           PointerDeviceKind.unknown
//         },
//       ),
//     );
//   }
}
