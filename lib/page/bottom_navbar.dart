import 'package:acb_isbe/page/publication_page.dart';
import 'package:flutter/material.dart';
import 'package:acb_isbe/main.dart';
import 'package:acb_isbe/page/login.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// class displayNavbar {
//   static display(BuildContext context) {
//     return Container(
//       color: Colors.deepPurple,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
//         child: GNav(
//           backgroundColor: Colors.deepPurple,
//           color: Colors.white,
//           activeColor: Colors.white,
//           tabBackgroundColor: Colors.white.withOpacity(0.2),
//           gap: 8,
//           tabs: [
//             GButton(
//               icon: Icons.home,
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Conference Proceeding App')),
//                 );
//               },
//             ),
//             GButton(
//               icon: Icons.calendar_month_rounded,
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Conference Proceeding App')),
//                 );
//               },
//             ),
//             GButton(
//               icon: Icons.article_rounded,
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const PublicationPage()),
//                 );
//               },
//             ),
//             GButton(
//               icon: Icons.edit,
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Conference Proceeding App')),
//                 );
//               },
//             ),
//             GButton(
//               icon: Icons.account_circle,
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const LoginPage()),
//                 );
//               },
//             ),
//           ]
//         ),
//       ),
//     );
//   }
// }

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

class displayNavbar {
  static display(BuildContext context) {
    int index = 4;

    return NavigationBar(
      backgroundColor: Colors.deepPurple,
      selectedIndex: index,
      destinations: const [
        NavigationDestination(
            icon: Icon(
                Icons.home,
                color: Colors.white
            ),
            label: 'Home'),
        NavigationDestination(
            icon: Icon(
                Icons.calendar_month_rounded,
                color: Colors.white
            ),
            label: 'Events'),
        NavigationDestination(
            icon: Icon(
                Icons.article_rounded,
                color: Colors.white
            ),
            label: 'Publication'),
        NavigationDestination(
            icon: Icon(
                Icons.edit,
                color: Colors.white
            ),
            label: 'Authors'),
        NavigationDestination(
            icon: Icon(
                Icons.account_circle,
                color: Colors.white
            ),
            label: 'Profile'),
      ],
    );
  }
}