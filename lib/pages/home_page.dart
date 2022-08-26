import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:random_color/random_color.dart';

import '../widgets/quotes_file.dart';
import 'intro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  var apiUrl = Uri.parse("https://type.fit/api/quotes");

  Future<List<dynamic>> getPost() async {
    final response = await http.get(apiUrl);
    return postFromJson(response.body);
  }

  List<dynamic> postFromJson(String str) {
    List<dynamic> jsonData = jsonDecode(str);
    jsonData.shuffle();
    return jsonData;
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.popUntil(context, (route) => route.isFirst);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const IntroPage()));
  }

  final RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.logout,
              size: 20,
            ),
            onPressed: logOut,
          ),
        ],
        title: Text(
          "Quotes For YOU",
          style: GoogleFonts.lato(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          FutureBuilder<List<dynamic>>(
              future: getPost(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return ErrorWidget(snapshot.hasData);
                  }
                  return Expanded(
                    child: PageView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var model = snapshot.data![index];
                        return QuotesFile(
                            quote: model["text"].toString(),
                            author: model["author"].toString(),
                            onShareClick: () {
                              showSimpleAlert();
                            },
                            onLikeClick: () {
                              showSimpleAlert();
                            },
                            bdColor: _randomColor.randomColor(
                                colorHue: ColorHue.multiple(
                                    colorHues: [ColorHue.random])));
                      },
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }

  showSimpleAlert() {
    Alert(
      context: context,
      title: "Sorry",
      desc: "This service does not work yet!",
      style: AlertStyle(
          backgroundColor: Colors.purple.shade100,
          alertPadding: const EdgeInsets.all(8),
          titleStyle: const TextStyle(fontWeight: FontWeight.bold)),
    ).show();
  }
}
