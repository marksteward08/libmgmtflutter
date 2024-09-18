import 'package:flutter/cupertino.dart';
import 'package:libfinaloms/variables.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:libfinaloms/addAuthorDialog.dart';

class Authors extends StatefulWidget {
  const Authors({super.key});

  @override
  State<Authors> createState() => _AuthorsState();
}

class _AuthorsState extends State<Authors> {
  void syncAuthors() {
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  Text('Book Authors').textLarge().bold().withMargin(bottom: 15),
                  ...List.generate(authors.length, (index) {
                    return Card(
                      child: SizedBox(
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            const Icon(CupertinoIcons.person).withMargin(right: 10),
                            Text('${authors[index]['firstName']} ${authors[index]['middleName']} ${authors[index]['lastName']}').semiBold().medium(),
                          ],
                        ),
                      ),
                    ).intrinsic().withMargin(bottom: 15);
                  }),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
              right: 15,
              child: PrimaryButton(
                enableFeedback: true,
                child: Icon(CupertinoIcons.add).large().withPadding(top: 5, bottom: 5),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AddAuthor(syncAuthors: syncAuthors,)
                  );
                },
              )
          )
      ]),
    );
  }
}