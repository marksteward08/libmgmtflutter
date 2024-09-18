import 'package:libfinaloms/variables.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class BorrowBook extends StatefulWidget {
  late final Function() syncBorrows;
  BorrowBook({required this.syncBorrows});

  @override
  State<BorrowBook> createState() => _BorrowBookState();
}

Widget buildToast(BuildContext context, ToastOverlay overlay) {
  return const SurfaceCard(
    child: Basic(
      title: Text('Transaction Scheduled!'),
      trailingAlignment: Alignment.center,
    ),
  );
}

class _BorrowBookState extends State<BorrowBook> {
  String? selectedBook;
  String? selectedBookDetail;

  String? selectedMember;
  String? selectedMemberDetail;

  DateTime? borrowDate = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime? returnDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const SizedBox(
        width: 500,
        child: Text('Borrow Book'),
      ),
      // TODO: Separate this
      content: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: Select<String>(
              itemBuilder: (context, item) {
                return Text(item);
              },
              searchFilter: (item, query) {
                return item.toLowerCase().contains(query.toLowerCase()) ? 1 : 0;
              },
              popupConstraints: const BoxConstraints(
                maxHeight: 300,
                maxWidth: 200,
              ),
              onChanged: (value) {
                setState(() {
                  selectedBook = value;
                  selectedBookDetail = book[int.parse(value!)]['bookTitle'];
                });
              },
              value: selectedBookDetail,
              placeholder: const Text('Book to Borrow'),
              children: [
                SelectGroup(
                  children: [
                    ...List.generate(book.length, (index) {
                        return SelectItemButton(
                          value: '$index',
                          child: Flexible(
                            child: Row(
                              children: [
                                Image.network(book[index]['bookCover'],
                                  width: 70,
                                  height: 50,
                                ),
                                Text(book[index]['bookTitle']
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ).withMargin(bottom: 15),
          SizedBox(
            width: double.infinity,
            child: Select<String>(
              itemBuilder: (context, item) {
                return Text(item);
              },
              searchFilter: (item, query) {
                return item.toLowerCase().contains(query.toLowerCase()) ? 1 : 0;
              },
              popupConstraints: const BoxConstraints(
                maxHeight: 300,
                maxWidth: 200,
              ),
              onChanged: (value) {
                setState(() {
                  selectedMember = value;
                  selectedMemberDetail = members[int.parse(value!)]['name'];
                });
              },
              value: selectedMemberDetail,
              placeholder: const Text('Borrowing Member'),
              children: [
                SelectGroup(
                  children: [
                    ...List.generate(members.length, (index) {
                      return SelectItemButton(
                        value: '$index',
                        child: Flexible(
                          child: Row(
                            children: [
                              Text(members[index]['name']
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    ),
                  ],
                ),
              ],
            ),
          ).withMargin(bottom: 15),
          SizedBox(
            width: double.infinity,
            child: DatePicker(
              placeholder: const Text('Borrow Date'),
              value: borrowDate,
              mode: PromptMode.popover,
              stateBuilder: (date) {
                return DateState.enabled;
              },
              onChanged: (value) {
                setState(() {
                  borrowDate = value;
                });
              },
            ).withMargin(bottom: 15),
          ),
          SizedBox(
            width: double.infinity,
            child: DatePicker(
              placeholder: const Text('Return Date'),
              value: returnDate,
              mode: PromptMode.popover,
              stateBuilder: (date) {
                return DateState.enabled;
              },
              onChanged: (value) {
                setState(() {
                  returnDate = value;
                });
              },
            ),
          ),
        ],
      ),
      actions: [
        OutlineButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // ABOVE TO BE SEPARATED
        PrimaryButton(
          child: const Text('Add To Borrowlist'),
          onPressed: () {
            borrowedBooks.add(
              {
                'borrowedBook' : int.parse(selectedBook!),
                'borrower' : int.parse(selectedMember!),
                'borrowDate' : borrowDate,
                'returnDate' : returnDate,
              }
            );
            widget.syncBorrows();
            showToast(
              context: context,
              builder: buildToast,
              location: ToastLocation.topRight
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
