import 'package:acb_isbe/page/publication_page.dart';
import 'package:flutter/material.dart';
import 'package:acb_isbe/main.dart';
import 'package:acb_isbe/page/login.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class displayNavbar {
  static display(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        child: GNav(
          backgroundColor: Colors.deepPurple,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.white.withOpacity(0.2),
          gap: 8,
          tabs: [
            GButton(
              icon: Icons.home,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Conference Proceeding App')),
                );
              },
            ),
            GButton(
              icon: Icons.calendar_month_rounded,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Conference Proceeding App')),
                );
              },
            ),
            GButton(
              icon: Icons.article_rounded,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PublicationPage()),
                );
              },
            ),
            GButton(
              icon: Icons.edit,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Conference Proceeding App')),
                );
              },
            ),
            GButton(
              icon: Icons.account_circle,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ]
        ),
      ),
    );
  }
}