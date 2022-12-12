import 'package:flutter/material.dart';
import 'package:acb_isbe/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Widget _bottomContainer({required Color color, required double price, required String name, required String title, required String subtitle, required String images}){
    //   return Container(
    //     height: 160,
    //     decoration: BoxDecoration(
    //       color: color,
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     child: Row(
    //       children: [
    //         Container(
    //           width: 190,
    //           padding: EdgeInsets.only(left: 20, top: 20),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text('\$ $price IDR'),
    //               SizedBox(height: 10,),
    //               Text(name,
    //               style: TextStyle(fontSize: 20, color: Color(0xff0c3469),
    //               fontWeight: FontWeight.bold),
    //               ),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(title, style: TextStyle(
    //                     color: Color(0xff0c3469),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 5,
    //                   ),
    //                   Text(subtitle, style: TextStyle(
    //                     color: Color(0xff0c3469),
    //                   ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           height: 190,
    //           width: 200,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.only(
    //               topRight: Radius.circular(10),
    //               bottomRight: Radius.circular(10),
    //             ),
    //             image: DecorationImage(
    //                 image: AssetImage(images))
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    return Scaffold(

      body: SafeArea(
        child: ListView(
          children: [
            UpperBar(),
          ],
        ),
      )
    );
  }
}

class UpperBar extends StatelessWidget {
  const UpperBar({ Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        height: 130,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.5],
            colors: [
              Color(0xff886ff2),
              Color(0xff6849ef),
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hello, \nUser',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome to ACB-ISBE 2022',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset('graphics/acb_isbe.png',
                      scale: 1.8),
                )

              ],
            ),

          ],
        ),
      )
    );
  }

}