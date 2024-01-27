// import 'package:flutter/material.dart';
// import 'package:overlapping_panels/overlapping_panels.dart';

// class _MyHomePageState extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         OverlappingPanels(
//           // Using the Builder widget is not required. You can pass your widget directly. 
//           // But to use `OverlappingPanels.of(context)` you need to wrap your widget in a Builder
//           left: Builder(builder: (context) {
//             return const Scaffold(
//               body: Center(
//                 child: Text('Left Page'),
//               ),
//             );
//           }),
//           right: Builder(
//             builder: (context) => const Scaffold(
//             body: Center(
//                 child: Text('Right Page'),
//               ),
//             ),
//           ),
//           main: Builder(
//             builder: (context) {
//               return const MainPage();
//             },
//           ),
//           onSideChange: (side) {
//             setState(() {
//               if (side == RevealSide.main) {
//                 // hide something
//               } else if (side == RevealSide.left) {
//                 // show something
//               }
//             });
//           },
//         ),
//       ],
//     );
//   }