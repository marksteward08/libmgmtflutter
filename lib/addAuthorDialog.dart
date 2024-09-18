import 'package:libfinaloms/variables.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AddAuthor extends StatefulWidget {

  late final Function() syncAuthors;
  AddAuthor({required this.syncAuthors});

  @override
  State<AddAuthor> createState() => _AddAuthorState();
}

Widget buildToast(BuildContext context, ToastOverlay overlay) {
  return const SurfaceCard(
    child: Basic(
      title: Text('Author Added!'),
      trailingAlignment: Alignment.center,
    ),
  );
}

class _AddAuthorState extends State<AddAuthor> {

  final _firstName = TextEditingController();
  final _middleName = TextEditingController();
  final _lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const SizedBox(
        width: 500,
        child: Text('Add an Author'),
      ),
      // TODO: Separate this
      content: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
           TextField(
            useNativeContextMenu: true,
            placeholder: 'First Name',
            controller: _firstName,
          ),
          const SizedBox(
            height: 15,
          ),
           TextField(
            useNativeContextMenu: true,
            placeholder: 'Middle Name',
            controller: _middleName,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            useNativeContextMenu: true,
            placeholder: 'Last Name',
            controller: _lastName,
          ),
          const SizedBox(
            height: 15,
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
          child: const Text('Add Author'),
          onPressed: () {
            authors.add( {
                'firstName' : _firstName.text,
                'middleName' : _middleName.text,
                'lastName' : _lastName.text,
              }
            );
            widget.syncAuthors();
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