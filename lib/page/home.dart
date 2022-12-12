import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:acb_isbe/page/publication_page.dart';
import 'package:flutter/material.dart';
import 'package:acb_isbe/main.dart';
import 'package:acb_isbe/page/login.dart';
import 'package:acb_isbe/model/testimonials.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Contents extends StatelessWidget {
  final int num;
  Contents({Key? key, required this.num}) : super(key: key);
  List<Testimonials> listTestimonials = [];
  Future<List<Testimonials>> fetchTestimonials() async {
    var url =
    Uri.parse('https://acbisbe.up.railway.app/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );
    listTestimonials = [];

    // final String response = await rootBundle.loadString('jsonfile/testimonials.json');
    // final data = json.decode(response) as List<dynamic>;

    var data = jsonDecode(utf8.decode(response.bodyBytes));
    for (var d in data) {
      if (d != null) {
        listTestimonials.add(Testimonials.fromJson(d["fields"]));
      }
    }

    return listTestimonials;
  }
  @override
  Widget build(BuildContext context) {
    return (num==2) ? FutureBuilder(
        future: fetchTestimonials(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator(
              color: Colors.deepPurple,
            ));
          } else {
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                listTestimonials.map((data) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${data.username}",
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                )
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${data.content}",
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "From : ${data.institute}",
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ),

                      ),
                    ),
                  );
                }).toList());
          }
        }) :
    (num==1) ?
        Container(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
          child: Container(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 25),
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
            child: Text('The International Symposium on Biomedical Engineering (ISBE) is an annual event initiated by the Research Center for Biomedical Engineering, Universitas Indonesia (RCBE UI). The event is organized to improve the communication of science, research, and technology among students, faculty, and researchers in Indonesia and abroad who study and or have a career in biomedical engineering.\n\nThis International Symposium on Biomedical Engineering would be one of the ways to strengthen the biomedical agenda in Indonesia with international relations. The Asian Congress on Biotechnology (ACB) 2022 is an international conference jointly organized by the Asian Federation of Biotechnology (AFOB) and the Research Center for Biomedical Engineering Universitas Indonesia (RCBE UI). \n\nThe ACB 2022 will be held in conjunction with The 7th International Symposium on Biomedical Engineering (ISBE). We aim to provide a platform for researchers and young scientists from around the world to present novel findings and discuss the future of biotechnology for 2022 and beyond. The meeting will include a variety of important sessions ranging from applied microbiology, medical biotechnology, nanotechnology, biomaterials/regenerative medicine, synthetic biology, and more. The theme of this conference is “Biotech for Stronger Recovery” which will underpin the need for collaboration and cooperation of individuals and industries from a wide range of biochemical backgrounds.',
            style: TextStyle(color: Colors.white)) ,
          ),
        ) :

    Container(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: Container(
        padding: const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 25),
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
        SizedBox(height: 40),
        Image.asset('graphics/aws.png', scale: 6),
        SizedBox(height: 20),
        Image.asset('graphics/gojek.png', scale: 6),
        SizedBox(height: 20),
        Image.asset('graphics/kemendikbud.png', scale: 8),
        SizedBox(height: 20),
        Image.asset('graphics/ui.png', scale: 8),
        SizedBox(height: 40),
      ],
      ),
    ));



  }


}


class Category extends StatelessWidget {
  final String image;
  final String title;
  final double scales;
  final int decide;
  const Category({Key? key, required this.image, required this.title, required this.scales, required this.decide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Routing the menu to the form page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => (decide==1) ? PublicationPage():(decide==2)?LoginPage():PublicationPage()),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 80,
            height: 70,
            child: Column(
              children: [
                SizedBox(
                  child: Image.asset(
                    image,
                    scale: scales,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  int number=1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(height: 50),
            UpperBar(),
            SizedBox(height: 10),
            Padding(
                padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Category(image: 'graphics/event.png', title: 'Events', scales: 1.5, decide: 1,),
                SizedBox(width: 5),
                Category(image: 'graphics/speakers.png', title: 'Speakers', scales: 1.5, decide: 2,),
                SizedBox(width: 5),
                Category(image: 'graphics/sessions.png', title: 'Sessions', scales: 1.6, decide: 1,),
              ],
            ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 16,
              bottom: 16,
              left: 50,
              right: 50),
              child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      number = 1;
                    });
                  },
                  child: number==1 ? Text('About',
                      style: TextStyle(
                    decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600
                    ),
                  )
                  : Text('About'),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      number = 2;
                      print(number);
                    });
                  },
                  child: number==2 ? Text('Testimonials',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600
                  ),
                )
              : Text('Testimonials'),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      number = 3;
                      print(number);
                    });
                  },
                  child: number==3 ? Text('Partners',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600
                    ),
                  )
                      : Text('Partners'),
                ),
              ],
            ),
            ),
            //
            number == 1 ? Contents(num: 1) : number == 2 ? Contents(num: 2) : Contents(num: 3),
          ],
        ),

      ),

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