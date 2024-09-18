import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:libfinaloms/addBookDialog.dart';
import 'package:libfinaloms/variables.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {


  void syncBooks() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Browse Available Books').textLarge().bold().withMargin(bottom: 15),
                  Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    runSpacing: 15,
                    spacing: 15,
                    children: [
                      ...List.generate(book.length, (index) {
                        final authorName = '${authors[book[index]['bookAuthor']]['firstName']} ${authors[book[index]['bookAuthor']]['middleName'] ?? ''} ${authors[book[index]['bookAuthor']]['lastName']}';
                        final publisherName = '${publishers[book[index]['bookPublisher']]['publisherName']}';

                        return Card(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  book[index]['bookCover'],
                                  height: 180, width: 130,
                                  errorBuilder:  (BuildContext context, Object exception, StackTrace? stackTrace) {
                                    return Container(
                                      height: 180,
                                      width: 130,
                                      color: Colors.gray, // Placeholder color
                                      child: const Icon(Icons.error, color: Colors.red), // Error icon
                                    );
                                  },
                                ),
                              ).withMargin(bottom: 10),
                              Text(book[index]['bookTitle']).small().semiBold().withMargin(bottom: 5).withAlign(Alignment.center),
                              Text(authorName.trim()).muted().small().withMargin(bottom: 3).withAlign(Alignment.center),
                              Text(publisherName).muted().small().withAlign(Alignment.center),

                              // Text(publishers[book[index]['bookAuthor']]['publisherName']).muted().small(),
                            ],
                          ),
                        ).intrinsic();
                      }),
                    ],
                  ).withMargin(bottom: 15),
                ],
              ),
            ).withMargin(top: 20)
          )
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: PrimaryButton(
              enableFeedback: true ,
              child: const Icon(CupertinoIcons.add).large().withPadding(top: 5, bottom: 5),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AddBook(syncBooks: syncBooks,)
                );
              },
            ),
          ),
      ]),
    );
  }
}