import 'package:flutter/material.dart';
import 'package:sarajevo_travel/models/event_models.dart';

class EventInfoPanel extends StatelessWidget {
  final Event event;
  const EventInfoPanel({super.key, required this.event});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.withAlpha(50)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.transparent,
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white.withAlpha(30)
                      : Color(0xFF131313).withAlpha(30),
            ),
            child: ExpansionTile(
              title: Text("Informacije"),
              iconColor: Color(0xFFD85151),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
                  child: Text(event.description, textAlign: TextAlign.justify),
                ),
                if (event.schedule != null && event.schedule!.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0, top: 4),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.transparent),
                      clipBehavior: Clip.antiAlias,
                      child: Table(
                        border: TableBorder.symmetric(inside: BorderSide(color: Colors.grey.withAlpha(150))),
                        children: [
                          // Plavi header red
                          TableRow(
                            decoration: BoxDecoration(color: Color(0xFFD85151)),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Dan',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Datum',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Vrijeme',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Drugi podatkovni red s blijedo sivom pozadinom
                          ...event.schedule!.map(
                            (schedule) => TableRow(
                              decoration: BoxDecoration(color: Colors.grey.withAlpha(80)),
                              children: [
                                TableCell(
                                  child: Padding(padding: const EdgeInsets.all(8.0), child: Text(schedule.dan)),
                                ),
                                TableCell(
                                  child: Padding(padding: const EdgeInsets.all(8.0), child: Text(schedule.datum)),
                                ),
                                TableCell(
                                  child: Padding(padding: const EdgeInsets.all(8.0), child: Text(schedule.vrijeme)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
