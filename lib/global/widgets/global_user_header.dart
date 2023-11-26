import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GlobalUserHeader extends StatelessWidget {

  const GlobalUserHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 30, 50, 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          border: Border.all(
            width: 5,
            color: const Color(0xFF000000),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22.5,
            vertical: 12.5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Row(
                children: [

                  Icon(
                    MdiIcons.account,
                    size: 35,
                    color: const Color(0xFF000000),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      "Nickname",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),

                ],
              ),

              Image.asset(
                "assets/jpgs/global/global_uk_flag.jpg",
              ),

            ],
          ),
        ),
      ),
    );
  }

}
