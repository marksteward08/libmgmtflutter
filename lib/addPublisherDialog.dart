import 'package:libfinaloms/variables.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AddPublisher extends StatefulWidget {

  late final Function() syncPublishers;
  AddPublisher({required this.syncPublishers});

  @override
  State<AddPublisher> createState() => _AddPublisherState();
}

Widget buildToast(BuildContext context, ToastOverlay overlay) {
  return const SurfaceCard(
    child: Basic(
      title: Text('Publisher Added!'),
      trailingAlignment: Alignment.center,
    ),
  );
}

class _AddPublisherState extends State<AddPublisher> {

  final _publisherName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const SizedBox(
        width: 500,
        child: Text('Add a Publisher'),
      ),
      // TODO: Separate this
      content: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          TextField(
            useNativeContextMenu: true,
            placeholder: 'Publisher Name',
            controller: _publisherName,
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
          child: const Text('Add Publisher'),
          onPressed: () {
            publishers.add(
              {
                'publisherName' : _publisherName.text,
              }
            );
            widget.syncPublishers();
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
