import 'package:acb_isbe/page/authors_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:acb_isbe/model/publication_model.dart';
import 'package:flutter/services.dart';
import 'package:acb_isbe/page/publication_details.dart';



class MyAuthorsDetailsPage extends StatefulWidget {
  MyAuthorsDetailsPage({Key? key,
    required this.id,
    required this.lastName,
    this.email,
    required this.country,
    required this.organization,
    required this.personId,
    required this.fullName,

  }):super(key: key);

  String id;
  String lastName;
  String? email;
  String country;
  String organization;
  int personId;
  String fullName;

  @override
  State<MyAuthorsDetailsPage> createState() => _MyAuthorsDetailsPageState();
}


class _MyAuthorsDetailsPageState extends State<MyAuthorsDetailsPage> {

  List<Publication> listPublication = [];
  String Keyword = '';

  String idPub = '';
  String trackId = '';
  String track = '';
  String title = '';
  String authorsName = '';
  DateTime? submitted;
  DateTime? lastUpdated;
  String keywords = '';
  String? decision;
  String? reviewsSent;
  String publicationAbstract = '';
  String location= '';
  DateTime date = DateTime.now();
  String time = '';
  String chair = '';

  Future<List<Publication>> fetchPublication() async {
    listPublication = [];

    final String response = await rootBundle.loadString(
        'jsonfile/publication.json');
    final data = json.decode(response) as List<dynamic>;

    for (var d in data) {
      if (widget.id == d["fields"]["id"]) {
        // print("masuk1");
        // idPub = d["fields"]["id"];
        // print(idPub);
        // print("masuk2");
        // trackId = d["fields"]["trackId"];
        // print("masuk3");
        // track = d["fields"]["track"];
        // print("masuk2.001");
        // title = d["fields"]["title"];
        // print("masuk2.01");
        // authorsName = d["fields"]["authors_name"];
        // print("masuk2.1");
        // submitted = d["fields"]["submitted"];
        // print("masuk2.12");
        // lastUpdated = d["fields"]["lastUpdated"];
        // print("masuk2.13");
        // keywords = d["fields"]["keywords"];
        // decision = d["fields"]["decision"];
        // print("masuk2.2");
        // reviewsSent = d["fields"]["reviewsSent"];
        // publicationAbstract = d["fields"]["abstract"];
        // location = d["fields"]["location"];
        // print("masuk2.5");
        // date = d["fields"]["date"];
        // time = d["fields"]["time"];
        // chair = d["fields"]["chair"];
        //
        // print("masuk3");
        // print(d["fields"]["title"]);
        Keyword = d["fields"]["title"];
        //print(Keyword);
        
        //var po = Publication(id: idPub, trackId: trackId, track: track, title: title, authorsName: authorsName,submitted: submitted,lastUpdated: lastUpdated, keywords: keywords,decision: decision,reviewsSent: reviewsSent, publicationAbstract: publicationAbstract, location: location, date: date, time: time, chair: chair);
        //listPublication.add(po);
        //print(listPublication);
      }
    }
    return listPublication;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          Padding(padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          child: Text(
            '${widget.fullName}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize:20,
              fontWeight: FontWeight.w700,
            ),
          ),),

          Image.asset('assets/images/author-min.png',
          height: 400,
          width: 400,
          ),

          Padding(padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
            children: [
              Text(
              '${widget.organization}, ${widget.country}',
                style: const TextStyle(
                  fontSize:15,
                ),
              ),
              Text(
                '${widget.email}',
                style: const TextStyle(
                  fontSize:15,
                ),
              ),
              ],
            ),

          )
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            child: Container(
            decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: const [
                Text(
              'Biography',
              style: TextStyle(
                fontSize:15,
                fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec fringilla odio, ac pharetra metus. Praesent libero augue, imperdiet non porta at, lobortis eget tortor. Suspendisse rhoncus non magna id elementum. Duis ligula eros, tempor vitae nibh nec, porta posuere ante. Sed vel nisi non metus congue malesuada. Etiam eu ipsum quis nisi fringilla lobortis vel et ipsum. Duis vitae sem id tellus pellentesque pellentesque maximus in ligula. Proin ultrices, nisl et porta lacinia, metus mauris sollicitudin massa, eget ultrices elit magna sit amet sapien. Suspendisse aliquet metus a quam consectetur lobortis. Etiam lacinia dolor vel sapien malesuada porta. In hac habitasse platea dictumst. Mauris interdum ligula quis ante suscipit venenatis ut vel sapien. Mauris vestibulum non metus eu tempus.',
                  style: TextStyle(
                    fontSize:15,
                  ),
                ),
        ],
      ),
      ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children:[
                  Text(
                    'Publication',
                    style: TextStyle(
                      fontSize:15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  FutureBuilder(
                      future: fetchPublication(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return const Center(child: CircularProgressIndicator(
                            color: Colors.deepPurple,
                          ));
                        } else {
                          return Text(Keyword);
                        }
                      }),

                  ],
              ),
            ),
          ),
        ]
      )
    );}
}