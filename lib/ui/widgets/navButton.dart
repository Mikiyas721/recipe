import 'package:flutter/material.dart';
import '../../util/extensions/common.dart';

class NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const NavButton({Key key, this.icon, this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.primaryColor,
      child: InkWell(
        child: Container(
          padding: 5.allPadding,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(icon),
            2.vSpace,
            Text(
              label,
              style: context.bodyText2,
            )
          ]),
        ),
        onTap: onTap,
      ),
    );
  }
}
