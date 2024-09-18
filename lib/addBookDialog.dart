import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:libfinaloms/variables.dart';

Widget buildToast(BuildContext context, ToastOverlay overlay) {
  return const SurfaceCard(
    child: Basic(
      title: Text('Book Added!'),
      trailingAlignment: Alignment.center,
    ),
  );
}

class AddBook extends StatefulWidget {

  late final Function() syncBooks;
  AddBook({required this.syncBooks});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  File? image;
  String? selectedAuthor;
  String? selectedPublisher;
  final bookTitle = TextEditingController();
  final bookCover = TextEditingController();

  String? selectedAuthorDetail;
  String? selectedPublisherDetail;

  // Function to pick an image from the gallery
  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const SizedBox(
        width: 500,
        child: Text('Add a Book'),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: insert file to DB
          // PrimaryButton(
          //   child: Text('Add Book Cover'),
          //   onPressed: () {
          //     pickImage();
          //   },
          // )
           TextField(
            useNativeContextMenu: true,
            placeholder: 'Book Title',
            controller: bookTitle,
          ).withMargin(top: 15,bottom: 15),
           TextField(
            useNativeContextMenu: true,
            placeholder: 'Book Cover (ISBN-10)',
            controller: bookCover,
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
                  selectedAuthor = value;
                  selectedAuthorDetail = '${authors[int.parse(value!)]['firstName']} ${authors[int.parse(value)]['middleName']} ${authors[int.parse(value)]['lastName']}';
                });
              },
              value: selectedAuthorDetail,
              placeholder: const Text('Author'),
              children: [
                SelectGroup(
                  children: [
                    ...List.generate(authors.length, (index) {
                      return SelectItemButton(
                        value: '$index',
                        child: Text('${authors[index]['firstName']} ${authors[index]['middleName']} ${authors[index]['lastName']}'),
                      );
                    })
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
                  selectedPublisher = value;
                  selectedPublisherDetail = publishers[int.parse(value!)]['publisherName'];
                });
              },
              value: selectedPublisherDetail,
              placeholder: const Text('Publisher'),
              children: [
                SelectGroup(
                  children: [
                    ...List.generate(publishers.length, (index) {
                      return SelectItemButton(
                        value: '$index',
                        child: Text('${publishers[index]['publisherName']}'),
                      );
                    })
                  ],
                ),
              ],
            ),
          )
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
          child: const Text('Add Book'),
          onPressed: () {
            book.add(
                {
                  'bookTitle' : bookTitle.text,
                  'bookCover' : 'https://covers.openlibrary.org/b/isbn/${bookCover.text}-L.jpg',
                  'bookAuthor' : int.parse(selectedAuthor!) ?? 'Unknown',
                  'bookPublisher' : int.parse(selectedPublisher!) ?? 'Unknown',
                }
            );
            widget.syncBooks();
            showToast(
              context: context,
              builder: buildToast,
              location: ToastLocation.topRight,
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}