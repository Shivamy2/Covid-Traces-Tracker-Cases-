import 'package:CovidTracker/constraints.dart';
import 'package:flutter/material.dart';

Constraints color = new Constraints();

class CustomHeader extends PreferredSize {
  final Widget child;
  final double height;
  CustomHeader({this.child, this.height = kToolbarHeight});
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: color.primary,
      ),
      height: preferredSize.height,
      child: child,
      alignment: Alignment.center,
    );
  }
}

class CustomBottomBar extends PreferredSize {
  final Widget child;
  final double height;
  CustomBottomBar({this.child, this.height = kToolbarHeight});
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child: child,
      alignment: Alignment.center,
      color: Colors.grey[400],
    );
  }
}
