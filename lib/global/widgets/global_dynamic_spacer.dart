import 'package:flutter/material.dart';

class GlobalDynamicSpacer extends StatelessWidget {

  const GlobalDynamicSpacer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SizedBox(),
    );
  }

}
