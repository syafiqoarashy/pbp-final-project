import 'package:acb_isbe/page/home.dart';
import 'package:flutter/material.dart';
import 'package:acb_isbe/page/publication_page.dart';
import 'package:acb_isbe/page/sessions.dart';
import 'package:acb_isbe/page/login.dart';
import 'package:acb_isbe/page/events_page.dart';
import 'package:acb_isbe/page/authors_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:acb_isbe/page/speakers.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'ACB-ISBE',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
        routes: {
          "/login": (BuildContext context) => const LoginPage(),
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key, this.index = 0}) : super(key: key);

  int index;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  void getInitiate() {
    if(widget.index != 0) {
      index = widget.index;
    }
  }

  final screens = [
    HomePage(),
    Center(child: Text('EVENTS')),
    PublicationPage(track: 'Track'),
    MyAuthorsPage(),
    SessionsPage(),
    SpeakersPage(),
  ];

  @override
  void initState()
  {
    super.initState();
    getInitiate();//call it over here
  }
  Widget build(BuildContext context) => Scaffold(

      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        currentIndex: index,
        onTap: (index) =>
            setState(() => this.index = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.home_outlined
              ),
              activeIcon: Icon(
                  Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.calendar_month_outlined
              ),
              activeIcon: Icon(
                  Icons.calendar_month_rounded
              ),
              label: 'Events'),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.article_outlined
              ),
              activeIcon: Icon(
                  Icons.article_rounded
              ),
              label: 'Papers'),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.edit_outlined
              ),
              activeIcon: Icon(
                  Icons.edit
              ),
              label: 'Authors'),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.view_module_outlined,
              ),
              activeIcon: Icon(
                  Icons.view_module_rounded,
              ),
              label: 'Sessions'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined),
              activeIcon:
              Icon(Icons.people_alt_outlined),
              label: 'Speakers'),
        ],
      ),
    );
  }

