import 'package:flutter/material.dart';

class FakePopUpRoute<T> extends PageRoute<T> {
  FakePopUpRoute({required this.builder, super.settings, super.fullscreenDialog});

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  // TODO: implement maintainState
  bool get maintainState => true;

  @override
  // TODO: implement barrierColor
  Color? get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return new FadeTransition(opacity: animation, child: child);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return builder(context);
  }

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => "Holy barrier";
}