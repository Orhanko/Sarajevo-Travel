import 'package:flutter/material.dart';
import 'package:sarajevo_travel/app_bar_icon.dart';
import 'package:sarajevo_travel/widgets/event_card.dart';
import 'package:sarajevo_travel/models/event_models.dart';

class EventsScreen extends StatelessWidget {
  static const List<String> filters = [
    'Sve',
    'Koncert',
    'Svirka uživo',
    'Party',
    'Film',
    'Izložba',
    'Performans',
    'Pozorišna predstava',
    'Opera',
    'Balet',
    'Sportski događaj',
    'Festival',
    'Konferencija',
    'Sajam',
    'Događaj',
  ];

  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 110,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.05),
              child: Container(
                height: 0.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withAlpha(Theme.of(context).brightness == Brightness.dark ? 80 : 200)),
                  ],
                ),
              ),
            ),
            title: Image.asset('assets/logo/logotip.png', height: 36, fit: BoxFit.contain),
            actions: [
              Container(margin: EdgeInsets.only(right: 16), child: AppBarIcon(icon: 'assets/custom_icons/sort.svg')),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 38,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            filters.map((filter) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Color(0xFFE0E5EB), // boja bordera
                                      width: 1, // debljina bordera (po potrebi)
                                    ),
                                    // color: Colors.transparent, // opcionalno, ako želiš biti eksplicitan
                                  ),
                                  child: Text(filter),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => EventCard(event: dummyEvents[index]),
              childCount: dummyEvents.length,
            ),
          ),
        ],
      ),
    );
  }
}
