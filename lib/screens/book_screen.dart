import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_web/config/sidebar_menu.dart';
import 'package:math_web/model/books.dart';
import 'package:math_web/screens/pdf_reader.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  List<String> cardBackgroundImages = [
    'assets/images/diffrensial.jpg',
    'assets/images/mat2015.jpg',
    'assets/images/krosswordlar.png',
    'assets/images/mat8_9_10.jpg',
    'assets/images/math_olimp.jpg',
    'assets/images/okat_usuly.jpg',
    'assets/images/okat_usuly.jpg',
    'assets/images/yokary_mat.jpg',
  ];
  List<Book> books = [];
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    loadJson().then((list) {
      setState(() {
        for (var element in list) {
          books.add(Book.fromJson(element));
        }
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1.9,
                  crossAxisSpacing: 2,
                ),
                itemCount: books.length,
                itemBuilder: (BuildContext contex, int index) {
                  final book = books[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PdfReader(
                                  pdfUrl: book.pdfUrl,
                                )),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  image: AssetImage(
                                    cardBackgroundImages[index],
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          height: 180,
                          width: 150,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                book.bookName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 20),
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: const Text('Oka'))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }

  Future<dynamic> loadJson() async {
    final json = await rootBundle.loadString('assets/json/books_json.json');

    return jsonDecode(json);
  }
}
