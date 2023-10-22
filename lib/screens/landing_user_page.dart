// import 'package:flutter/material.dart';
//
// import '/colors.dart';
// import '/screens/signin_page.dart';
//
// class LandingUserPage extends StatelessWidget {
//   const LandingUserPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.01,
//               ),
//               const Text(
//                 "A Life",
//                 style: TextStyle(
//                   color: darkRedColor,
//                   fontSize: 36,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.07,
//               ),
//               const Image(
//                 image: AssetImage("asset/images/landing_page_img.png"),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.05,
//               ),
//               const Text(
//                 "CHOOSE YOUR ACCOUNT",
//                 style: TextStyle(
//                   color: lightRedColor,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.05,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => const LandingUserPage(),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   side: const BorderSide(
//                     color: buttonBorderColor,
//                     width: 2,
//                   ),
//                   backgroundColor: mainRedColor,
//                   foregroundColor: Colors.white,
//                   minimumSize: Size(MediaQuery.of(context).size.width * 0.7,
//                       MediaQuery.of(context).size.width * 0.14),
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(50),
//                     ),
//                   ),
//                 ),
//                 child: const Text(
//                   "HOSPITAL",
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.03,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => DonorLoginPage(),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   side: const BorderSide(
//                     color: buttonBorderColor,
//                     width: 2,
//                   ),
//                   backgroundColor: mainRedColor,
//                   foregroundColor: Colors.white,
//                   minimumSize: Size(MediaQuery.of(context).size.width * 0.7,
//                       MediaQuery.of(context).size.width * 0.14),
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(50),
//                     ),
//                   ),
//                 ),
//                 child: const Text(
//                   "DONOR",
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
