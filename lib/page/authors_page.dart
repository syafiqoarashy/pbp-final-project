import 'package:acb_isbe/page/authors_details.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:acb_isbe/model/authors_model.dart';
import 'package:flutter/services.dart';


class AuthorsData{
  static List dataAuthors = [];
}

class MyAuthorsPage extends StatefulWidget {
  const MyAuthorsPage({super.key});

  @override
  State<MyAuthorsPage> createState() => _MyAuthorsPageState();
}


class _MyAuthorsPageState extends State<MyAuthorsPage> {
  List<Authors> listAuthors = [];
  String searchKeyword = '';
  List<Authors> finalList = [];
  List<Authors> authorsList = [];
  List<Authors> univList= [];



  Future<List<Authors>> fetchAuthors(String value) async {
    listAuthors = [];
    final String response = await rootBundle.loadString('jsonfile/authors.json');
    final data = json.decode(response) as List<dynamic>;

    for (var i in data){
      if (i !=null) {
        var id = (i["fields"]['submission_id']);
        var lastName = (i["fields"]['last_name']);
        var email = (i["fields"]['email']);
        var country = (i["fields"]['country']);
        var organization = (i["fields"]['organization']);
        var personId = (i["fields"]['person_id']);
        var fullName = (i["fields"]['full_name']);

        var po = Authors(submissionId: id.toString(), lastName: lastName, email: email, country: country, organization: organization, personId: personId, fullName: fullName);
        listAuthors.add(po);
      }
    }

    searchKeyword = value;
      setState(() {
      authorsList = listAuthors.where((element) => element.fullName!.toLowerCase().contains(value.toLowerCase())).toList();
      univList = listAuthors.where((element) => element.organization!.toLowerCase().contains(value.toLowerCase())).toList();
      finalList = authorsList + univList;
    });
    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
        backgroundColor: Colors.deepPurple,
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged:(value) => fetchAuthors(value),
                      cursorColor: Colors.deepPurple,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                        ),
                        hintText: 'Search for Author/University',
                        prefixIcon: Icon(Icons.search, color: Colors.deepPurple,)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: fetchAuthors(searchKeyword),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.data == null){
                  return const Center(child: CircularProgressIndicator(
                    color: Colors.deepPurple,
                  ));
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: finalList.map((data){
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${data.fullName}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "${data.organization}, ${data.country}",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  "${data.email}",
                                  style: const TextStyle(
                                    fontSize: 12.0
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyAuthorsDetailsPage(
                                  id: data.submissionId,
                                  lastName: data.lastName,
                                  email: data.email,
                                  country: data.country,
                                  organization: data.organization,
                                  personId: data.personId,
                                  fullName: data.fullName
                                ))
                              );
                            },
                          ),
                        ),
                      );
                    }).toList()
                  );
                }
              },
            )
          ],
        )
      ),
    );
  }


}