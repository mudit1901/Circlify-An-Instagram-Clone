import 'package:circlify/provider/user_provider.dart';
import 'package:circlify/utils/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webscreenLayout;
  final Widget mobilescreenLayout;
  const ResponsiveLayout(
      {super.key,
      required this.webscreenLayout,
      required this.mobilescreenLayout});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userprovider = Provider.of(context, listen: false);
    await _userprovider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.webscreenLayout;
        } else {
          return widget.mobilescreenLayout;
        }
      },
    );
  }
}
