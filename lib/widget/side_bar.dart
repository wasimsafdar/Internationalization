import 'package:flutter/material.dart';

import '../localization/localization.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(Localization.of(context)!.getString('username').toString(),),
        ),
        ListTile(
          title: Text(Localization.of(context)!.getString('job title').toString(),),
        ),
      ],
    );
  }
}
