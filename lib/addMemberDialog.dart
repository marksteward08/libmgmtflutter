import 'package:libfinaloms/variables.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AddMember extends StatefulWidget {

  late final Function() syncMembers;
  AddMember({required this.syncMembers});

  @override
  State<AddMember> createState() => _AddMemberState();
}

Widget buildToast(BuildContext context, ToastOverlay overlay) {
  return const SurfaceCard(
    child: Basic(
      title: Text('Member Added!'),
      trailingAlignment: Alignment.center,
    ),
  );
}

class _AddMemberState extends State<AddMember> {

  final _memberName = TextEditingController();
  final _memberAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const SizedBox(
        width: 500,
        child: Text('Add a Member'),
      ),
      // TODO: Separate this
      content: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          TextField(
            useNativeContextMenu: true,
            placeholder: 'Member Name',
            controller: _memberName,
          ).withMargin(bottom: 10),
          TextField(
            useNativeContextMenu: true,
            placeholder: 'Member Address',
            controller: _memberAddress,
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
          child: const Text('Add Member'),
          onPressed: () {
            members.add({
              'name' : _memberName.text,
              'address' : _memberAddress.text,
            });
            widget.syncMembers();
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
