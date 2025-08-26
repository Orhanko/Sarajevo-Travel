import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarajevo_travel/models/event_models.dart';

class EventInfoBadges extends StatelessWidget {
  final Event event;
  const EventInfoBadges({super.key, required this.event});

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
                    Text(event.category.label, style: TextStyle(color: Color(0xFFD85151), fontWeight: FontWeight.bold)),
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
                      'assets/custom_icons/clock.svg',
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(Color(0xFFD85151), BlendMode.srcIn),
                    ),
                    SizedBox(width: 8),
                    Text(event.dateAndTime, style: TextStyle(color: Color(0xFFD85151), fontWeight: FontWeight.bold)),
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
                Text(event.address, style: TextStyle(color: Color(0xFFD85151), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
