import 'package:flutter/material.dart';
import 'package:get/get.dart';

 class StartEdgeSlideTransition extends CustomTransition {
  StartEdgeSlideTransition();

  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: animation, curve: curve ?? Curves.easeOutCubic),
      ),
      // يجعل الإزاحة الأفقية تُقرأ كـ«بداية ← نهاية» بدل «يسار ← يمين».
      textDirection: Directionality.of(context),
      child: child,
    );
  }
}
