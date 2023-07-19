// import 'package:flutter/material.dart';

// import '../consent/colors.dart';
// import 'home.dart';

// class DetailPage extends StatelessWidget {

//   final String mapa;
//   final String totalTime;
//   final String thumbnailUrl;
  
//   const DetailPage({ this.mapa, this.totalTime, this.thumbnailUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 400,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Image.asset(
//                 'images/p3.jpg',
//                 fit: BoxFit.cover,
//                 ), 
//             ),
//             bottom: PreferredSize(preferredSize:Size.fromHeight(10),
//             child: Container(
//               width: double.infinity,
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70),
//                   topRight: Radius.circular(70)
//                 ),
//                 color: Colors.white,
//               ),
//               child: Column(children: [
//                 SizedBox(height: 15),
//                 Container(
//                   width: 80,
//                   height: 4,
//                   color: font,
//                 )
//               ]),
//             ),
//             ),
//             //AQUI VA LAS ACCIONES DE MEGUSTA Y  RETROCEDER
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: CircleAvatar(
//                   backgroundColor: Color.fromRGBO(250, 250, 250, 0.6),
//                   radius: 18,
//                   child: Icon(
//                     Icons.favorite_border,
//                     size: 25,
//                     color: font,
//                     ),
//                   ),
//               ),
//             ],
//             title: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: CircleAvatar(
//                   backgroundColor: Color.fromRGBO(250, 250, 250, 0.6),
//                   radius: 18,
//                   // child: GestureDetector(
//                   //   onTap: () {
//                   //     Navigator.of(context).push(
//                   //       MaterialPageRoute(builder: (BuildContext context) {
//                   //         return HomePage();
//                   //       },
//                   //       ),
//                   //     );
//                   //   },
//                   //   // child: Icon(
//                   //   //   Icons.arrow_back,
//                   //   //   size: 25,
//                   //   //   color: font,
//                   //   //   ),
//                   // ),
//                   ),
//               ),
//           ),
//         ],  
//         ) 
//         // [
//         //   Text('$mapa'),
//         //   Text('$totalTime'),
//         // ],
//       ),
//     );
//   }
// }