import 'package:flutter/material.dart';
import 'package:sarajevo_travel/app_bar_icon.dart';
import 'package:sarajevo_travel/models/event_models.dart';
import 'package:sarajevo_travel/widgets/detail_contact_panel.dart';
import 'package:sarajevo_travel/widgets/event_info_badges.dart';
import 'package:sarajevo_travel/widgets/event_info_panel.dart';
import 'package:sarajevo_travel/widgets/detail_price_panel.dart';
import 'package:sarajevo_travel/widgets/photo_carousel.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;
  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Detalji'),
        actions: [
          Container(margin: EdgeInsets.only(right: 16), child: AppBarIcon(icon: 'assets/custom_icons/share.svg')),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.8),
          child: Container(
            height: 0.8,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey.withAlpha(Theme.of(context).brightness == Brightness.dark ? 80 : 200)),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            PhotoCarousel(photos: event.photos),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(event.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Column(
                    children: [
                      EventInfoBadges(event: event),
                      SizedBox(height: 24),
                      EventInfoPanel(event: event),
                      DetailPricePanel(prices: event.prices),
                      DetailContactPanel(mail: event.mail, phoneNumber: event.phoneNumber, url: event.url),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
