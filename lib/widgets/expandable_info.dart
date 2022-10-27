import 'package:flutter/material.dart';

class ExpandableInfo extends StatefulWidget {
  final Widget child;
  final bool shallExpand;

  const ExpandableInfo(
      {super.key, required this.child, required this.shallExpand});

  @override
  State<ExpandableInfo> createState() => _ExpandableInfoState();
}

class _ExpandableInfoState extends State<ExpandableInfo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    checkExpand();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  ///Setting up the animation
  void prepareAnimations() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void didUpdateWidget(ExpandableInfo oldWidget) {
    super.didUpdateWidget(oldWidget);
    checkExpand();
  }

  void checkExpand() {
    if (widget.shallExpand) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }
}
