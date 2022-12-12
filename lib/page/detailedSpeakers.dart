import 'package:acb_isbe/main.dart';
import 'package:acb_isbe/page/speakers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:acb_isbe/model/speakers_model.dart';
import 'package:flutter/services.dart';

List<Speakers> listSpeakers = [];

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.data});

  final Speakers data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'graphics/speakers main.png',
            width: 130,
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset(
                                  'graphics/default_photo.png',
                                  width: double.infinity,
                                ))),
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text(data.type.toString()),
                                    Text(
                                      data.name,
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(data.affiliation),
                                    Text(data.country)
                                  ],
                                ))),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 20,
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF2F2F2)),
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Text(
                                  "Sessions",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(data.speechTitle),
                                Text(data.room),
                                Text(data.time)
                              ],
                            ))),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF2F2F2)),
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Text(
                                  "Abstract",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(data.speechAbstract.toString())
                              ],
                            ))),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF2F2F2)),
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Text(
                                  "About Speaker",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(data.profile)
                              ],
                            ))),
                  ],
                ),
              )
            ]))));
  }
}
