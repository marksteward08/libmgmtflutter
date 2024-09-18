import 'package:libfinaloms/borrowBookDialog.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:libfinaloms/variables.dart';
import 'package:intl/intl.dart';


class BorrowedBooks extends StatefulWidget {
  const BorrowedBooks({super.key});

  @override
  State<BorrowedBooks> createState() => _BorrowedBooksState();
}

class _BorrowedBooksState extends State<BorrowedBooks> {

  void syncBorrows() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Borrowed Books').textLarge().bold().withMargin(bottom: 15),
              ...List.generate(borrowedBooks.length, (index) {
                return Card(
                  child: SizedBox(
                    width: 500,
                    child: Row(
                      children:[
                        Image.network(book[borrowedBooks[index]['borrowedBook']]['bookCover'],
                          width: 90,
                          height: 110,
                          fit: BoxFit.cover,
                        ).withMargin(right: 30),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(book[borrowedBooks[index]['borrowedBook']]['bookTitle']).semiBold(),
                              Text('Borrower: ' + members[borrowedBooks[index]['borrower']]['name']).small().muted().italic(),
                              Text('Borrow Date: ${DateFormat('MM/dd/yyyy').format(borrowedBooks[index]['borrowDate'])}').small().muted().italic(),
                              Text('Return Date: ${DateFormat('MM/dd/yyyy').format(borrowedBooks[index]['returnDate'])}').small().muted().italic(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ).intrinsic().withMargin(bottom: 15);
              }),
            ],
          ),
                ),
          Positioned (
            bottom: 15,
            right: 15,
            child: PrimaryButton(
              enableFeedback: true,
              child: Icon(CupertinoIcons.add).large().withPadding(top: 5, bottom: 5),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => BorrowBook(syncBorrows: syncBorrows,),
                );
              },
            ),
          )
      ]),
    );
  }
}