import 'package:flutter/material.dart';

class RouteAnimations {
  static PageRouteBuilder fadeIn(RoutePageBuilder pageBuilder) {
    return PageRouteBuilder(
      transitionsBuilder: (c, anim, a2, child) => FadeTransition(
        opacity: anim,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: pageBuilder,
    );
  }
}
