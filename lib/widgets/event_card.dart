import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarajevo_travel/screens/event_detail_screen.dart';
import 'package:sarajevo_travel/models/event_models.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark ? const Color(0x40FFFFFF) : const Color(0x40000000),
            offset: const Offset(0, 1),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF131313) : Colors.white,
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withAlpha(30)
                    : Color(0xFF131313).withAlpha(30),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => EventDetailScreen(event: event)));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Ink.image(image: NetworkImage(event.imageUrl), height: 250, fit: BoxFit.cover),
                Ink(
                  color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF131313) : Colors.white,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Badge/kategorija
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.dark ? Color(0xFF402020) : Color(0xFFFFEBEB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          event.category.label,
                          style: const TextStyle(fontSize: 12, color: Color(0xFFD85151), fontWeight: FontWeight.w600),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Naziv
                      Text(
                        event.name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 8),

                      // Lokacija
                      // Lokacija + datum: fiksna/ograničena visina, pa kartica ne raste
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 60), // podešavaj po font-sizeu
                        child: Row(
                          children: [
                            // Lijeva polovina (datum/vrijeme)
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/custom_icons/clock.svg',
                                    width: 18,
                                    height: 18,
                                    colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                  ),
                                  const SizedBox(height: 6),
                                  Flexible(
                                    child: Text(
                                      event.dateAndTime,
                                      maxLines: 2, // dopuštamo do 2 reda
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Srednji razdjelnik — uvijek na sredini
                            VerticalDivider(width: 32, thickness: 1, color: Colors.grey.withAlpha(102)),

                            // Desna polovina (lokacija)
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/custom_icons/map-pin.svg',
                                    width: 18,
                                    height: 18,
                                    colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                                  ),
                                  const SizedBox(height: 6),
                                  Flexible(
                                    child: Text(
                                      event.address,
                                      maxLines: 2, // do 2 reda, pa ellipsis
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
