import 'package:flutter/material.dart';
import 'package:acb_isbe/main.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:acb_isbe/page/home.dart';
import 'package:acb_isbe/page/cookie_request.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = "";
  String _content = "";
  String _institute = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _username = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _username = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Username cannot be empty!';
                    }
                    return null;
                  },
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Content",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _content = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _content = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Content cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Institute",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _institute = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _institute = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Username cannot be empty!';
                      }
                      return null;
                    },
                  ),
    ),
    SizedBox(height: 30),
    Center(
    child: Column(
    children: [
    SizedBox(
    width: 350,
    height: 50,
    child: TextButton(
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
    const Color(0xFFFEA150),
    ),
    ),
    onPressed: () async {
    if (_formKey.currentState!.validate()) {
    final response = await request.post(
    "https://acbisbe.up.railway.app/diary/add_flutter/",
    {
    "username": _username,
    "content": _content,
    "institute": _institute,
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
    content: Text("Successfully added!",
    style:
    TextStyle(fontFamily: 'Poppins')),
    ));
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(
    builder: (context) =>
    const HomePage()),
    );
    }
    },
    child: const Text(
    "+ Tambah Log",
    style: TextStyle(
    color: Colors.white,
    fontFamily: 'Poppins',
    fontSize: 20),
    ),
    ),
    ),
    SizedBox(height: 10),
    Center(
    child: Column(
    children: [
    SizedBox(
    width: 350,
    height: 50,
    child: OutlinedButton(
    style: ButtonStyle(
    side: MaterialStateProperty.all(
    BorderSide(
    color:
    Color.fromARGB(255, 255, 139, 55),
    width: 1,
    )),
    ),
    onPressed: () async {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(
    builder: (context) =>
    const HomePage()),
    );
    },
    child: const Text(
    "Back",
    style: TextStyle(
    color: Color.fromARGB(
    255, 226, 108, 24),
    fontFamily: 'Poppins',
    fontSize: 20),
    ),
    ),
    )
    ],
    ),
    ),
              ],
            ),
          )
        ]
    )
      ),
    )));
  }

}