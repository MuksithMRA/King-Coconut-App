// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sarasavi_mobile/constants/app_colors.dart';
// import 'package:sarasavi_mobile/controllers/user_controller.dart';
// import 'package:sarasavi_mobile/screens/account/about_screen.dart';
//
// class ContainerIconButton extends StatelessWidget {
//   final String? title;
//   final String? description;
//
//   UserController userController = Get.find<UserController>();
//
//   ContainerIconButton({
//     Key? key,
//      this.title,
//      this.description,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       child: TextButton(
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 8,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       title?.toUpperCase() == null ? "": title!.toUpperCase(),
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const Expanded(
//                 flex: 1,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Icon(Icons.arrow_forward_ios),
//                 ),
//               ),
//             ],
//           ),
//           style: ButtonStyle(
//               foregroundColor:
//                   MaterialStateProperty.all<Color>(AppColors.appColorBlack),
//               backgroundColor:
//                   MaterialStateProperty.all<Color>(AppColors.appColorLightGray),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(6),
//               ))),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => AboutScreen(title!, description!)),
//             );
//
//             // title;
//           }),
//     );
//   }
// }
