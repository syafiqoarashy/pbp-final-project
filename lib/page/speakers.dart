import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:acb_isbe/model/speakers_model.dart';
import 'package:flutter/services.dart';
import 'package:acb_isbe/page/detailedSpeakers.dart';

List<Speakers> listSpeakers = [];

class SpeakersPage extends StatefulWidget {
  const SpeakersPage({Key? key}) : super(key: key);

  @override
  State<SpeakersPage> createState() => _SpeakersPageState();
}

class _SpeakersPageState extends State<SpeakersPage> {
  String keyword = '';
  String speakersType = 'All';
  List<String> listSpeakersType = ['All', 'Plenary', 'Invited'];
  List<Speakers> finalList = [];
  List<Speakers> dummyListData = [];

  Future<List<Speakers>> fetchSpeakers(String keyword) async {
    listSpeakers = [];

    final String response =
        await rootBundle.loadString('jsonfile/speakers_rev.json');
    final data = await json.decode(response);

    for (var d in data) {
      if (d != null) {
        listSpeakers.add(Speakers.fromJson(d));
      }
    }

    if (keyword.isNotEmpty) {
      dummyListData.clear();
      listSpeakers.forEach((item) {
        if (item.name.contains(keyword)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        finalList.clear();
        finalList.addAll(dummyListData);
      });
      return finalList;
    } else {
      setState(() {
        finalList.clear();
        finalList.addAll(listSpeakers);
      });
      return finalList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Image.asset(
              'graphics/speakers main.png',
              width: 130,
            ),
          ),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          Container(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Column(children: [
              SizedBox(
                  width: 332,
                  height: 35,
                  child: Center(
                    child: TextField(
                      onChanged: (keyword) => fetchSpeakers(keyword),
                      cursorColor: Colors.deepPurple,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Search for speakers',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.deepPurple,
                          )),
                    ),
                  )),
              ListTile(
                title: const Text(
                  'Speakers Type',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: DropdownButton(
                  value: speakersType,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: listSpeakersType.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      speakersType = newValue!;
                    });
                  },
                ),
              ),
            ]),
          ),
          FutureBuilder(
              future: fetchSpeakers(keyword),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                      children: const [
                        Text(
                          "No matching speaker found",
                          style: TextStyle(
                              color: Color.fromARGB(255, 95, 104, 110),
                              fontSize: 20),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: finalList.map((element) {
                        return Container(
                            child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: ListTile(
                                    title: Column(
                                      children: [Text("${element.name}")],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                    data: element,
                                                  )));
                                    })));
                      }).toList(),
                    );
                  }
                }
              })
        ]))));
  }
}
