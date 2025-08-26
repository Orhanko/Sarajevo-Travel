import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarajevo_travel/models/object_models.dart';

class ObjectInfoBadges extends StatelessWidget {
  final Place object;
  const ObjectInfoBadges({super.key, required this.object});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF402020) : Color(0xFFFFEBEB),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/custom_icons/grid.svg',
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(Color(0xFFD85151), BlendMode.srcIn),
                    ),
                    SizedBox(width: 8),
                    Text(
                      object.category.label,
                      style: TextStyle(color: Color(0xFFD85151), fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF402020) : Color(0xFFFFEBEB),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/custom_icons/navigation.svg',
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(Color(0xFFD85151), BlendMode.srcIn),
                    ),
                    SizedBox(width: 8),
                    Text("54km", style: TextStyle(color: Color(0xFFD85151), fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF402020) : Color(0xFFFFEBEB),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/custom_icons/map-pin.svg',
                  width: 18,
                  height: 18,
                  colorFilter: ColorFilter.mode(Color(0xFFD85151), BlendMode.srcIn),
                ),
                SizedBox(width: 8),
                Text(object.address, style: TextStyle(color: Color(0xFFD85151), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
