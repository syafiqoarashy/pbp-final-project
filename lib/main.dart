import 'package:acb_isbe/page/home.dart';
import 'package:flutter/material.dart';
import 'package:acb_isbe/page/publication_page.dart';
import 'package:acb_isbe/page/sessions.dart';
import 'package:acb_isbe/page/login.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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
    Center(child: Text('AUTHORS')),
    SessionsPage(),
    LoginPage(),
  ];

  @override
  void initState()
  {
    super.initState();
    getInitiate();//call it over here
  }
  Widget build(BuildContext context) => Scaffold(

    body: screens[index],
    bottomNavigationBar: NavigationBar(
      backgroundColor: Colors.deepPurple,
      selectedIndex: index,
      onDestinationSelected: (index) =>
          setState(() => this.index = index),
      animationDuration: Duration(seconds: 1),
      destinations: const [
        NavigationDestination(
            icon: Icon(
                Icons.home_outlined,
                color: Colors.white
            ),
            selectedIcon: Icon(
                Icons.home,
                color: Colors.white
            ),
            label: 'Home'),
        NavigationDestination(
            icon: Icon(
                Icons.calendar_month_outlined,
                color: Colors.white
            ),
            selectedIcon: Icon(
                Icons.calendar_month_rounded,
                color: Colors.white
            ),
            label: 'Events'),
        NavigationDestination(
            icon: Icon(
                Icons.article_outlined,
                color: Colors.white
            ),
            selectedIcon: Icon(
                Icons.article_rounded,
                color: Colors.white
            ),
            label: 'Publication'),
        NavigationDestination(
            icon: Icon(
                Icons.edit_outlined,
                color: Colors.white
            ),
            selectedIcon: Icon(
                Icons.edit,
                color: Colors.white
            ),
            label: 'Authors'),
        NavigationDestination(
            icon: Icon(
                Icons.view_module_outlined,
                color: Colors.white
            ),
            selectedIcon: Icon(
                Icons.view_module_rounded,
                color: Colors.white
            ),
            label: 'Sessions'),
        NavigationDestination(
            icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white
            ),
            selectedIcon: Icon(
                Icons.account_circle_rounded,
                color: Colors.white
            ),
            label: 'Profile'),
      ],
    ),
  );
}