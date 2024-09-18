import 'package:libfinaloms/addPublisherDialog.dart';
import 'package:libfinaloms/variables.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:flutter/cupertino.dart';

class Publisher extends StatefulWidget {
  const Publisher({super.key});

  @override
  State<Publisher> createState() => _PublisherState();
}

class _PublisherState extends State<Publisher> {
  void syncPublishers() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              const Text('Publishers').textLarge().bold().withMargin(bottom: 15),
              ...List.generate(publishers.length, (index) {
                return Card(
                  child: SizedBox(
                    width: 500,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(CupertinoIcons.building_2_fill)
                            .withMargin(right: 10),
                        Text('${publishers[index]['publisherName']}')
                            .semiBold()
                            .medium(),
                      ],
                    ),
                  ),
                ).intrinsic().withMargin(bottom: 15);
              }),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: PrimaryButton(
            enableFeedback: true,
            child:
                const Icon(CupertinoIcons.add).large().withPadding(top: 5, bottom: 5),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AddPublisher(
                        syncPublishers: syncPublishers,
                      ));
            },
          ),
        )
      ]),
    );
  }
}
