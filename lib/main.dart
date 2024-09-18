import 'package:flutter/cupertino.dart';
import 'package:libfinaloms/borrow.dart';
import 'package:libfinaloms/member.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:libfinaloms/authors.dart';
import 'package:libfinaloms/books.dart';
import 'package:libfinaloms/publisher.dart';

void main() {
  runApp(
    ShadcnApp(
      title: 'My App',
      home: const Navigation(),
      theme: ThemeData(
        colorScheme: ColorSchemes.darkStone(),
        radius: 0.8,
      ),
    ),
  );
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int selected = 0;

  NavigationBarAlignment alignment = NavigationBarAlignment.spaceAround;
  bool expands = true;
  NavigationLabelType labelType = NavigationLabelType.none;
  bool customButtonStyle = true;

  NavigationButton buildButton(String label, IconData icon) {
    return NavigationButton(
      style: customButtonStyle
          ? const ButtonStyle.muted(density: ButtonDensity.icon)
          : null,
      selectedStyle: customButtonStyle
          ? const ButtonStyle.fixed(density: ButtonDensity.icon)
          : null,
      label: Text(label),
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> test = [
      const Books(),
      const Authors(),
      const Member(),
      const Publisher(),
      const BorrowedBooks()
    ];

    return OutlinedContainer(
      border
      width: 500,
      height: 400,
      child: Scaffold(

        footers: [
          const Divider(),
          NavigationBar(
            alignment: alignment,
            labelType: labelType,
            expands: expands,
            onSelected: (index) {
              setState(() {
                selected = index;
              });
            },
            index: selected,
            children: [
              buildButton('Book', CupertinoIcons.book),
              buildButton('Author', CupertinoIcons.person),
              buildButton('Library Members', CupertinoIcons.group),
              buildButton('Publisher', CupertinoIcons.building_2_fill),
              buildButton('Borrow', CupertinoIcons.hand_raised),
            ],
          ),
        ],
        child: SafeArea(
          child: Container(
            child: test[selected],
          ),
        ),
      ),
    );
  }
}
