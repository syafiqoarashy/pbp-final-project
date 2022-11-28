import 'package:acb_isbe/page/publication_page.dart';
import 'package:flutter/material.dart';
import 'package:acb_isbe/main.dart';
import 'package:acb_isbe/page/login.dart';
import 'package:acb_isbe/page/mywatchlist_page.dart';

class displayDrawer {
  static display(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('')
          ),
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Conference Proceeding App')),
              );
            },
          ),
          ListTile(
            title: const Text('Publication'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PublicationPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          ListTile(
            title: const Text('My Watchlist'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}