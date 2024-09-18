import 'package:libfinaloms/addMemberDialog.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:libfinaloms/variables.dart';

class Member extends StatefulWidget {
  const Member({super.key});

  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {

  void syncMembers() {
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children:[
          SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Library Members').textLarge().bold().withMargin(bottom: 15),
                ...List.generate(members.length, (index) {
                  return Card(
                    child: SizedBox(
                      width: 500,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          const Icon(CupertinoIcons.group).withMargin(right: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(members[index]['name']).semiBold().medium().withMargin(bottom: 5),
                              Text(members[index]['address']).muted().small(),
                            ],
                          ),
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
              child: const Icon(CupertinoIcons.add).large().withPadding(top: 5, bottom: 5),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddMember(syncMembers: syncMembers),
                );
              },
            ),
          )
      ]),
    );
  }
}