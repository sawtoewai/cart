// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'Food  Delivery/Provider/card_provider.dart';
// import 'Food  Delivery/View/onboard_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // Root widget of the app
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (create) => CartProvider(),
//         ),
//       ],
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//       home: AppOnBoardPage(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'Food  Delivery/Provider/card_provider.dart';
import 'Food  Delivery/View/onboard_page.dart';



void main() {
  debugPaintSizeEnabled = false; // Disables debug layout borders
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppOnBoardPage(),
      ),
    );
  }
}
