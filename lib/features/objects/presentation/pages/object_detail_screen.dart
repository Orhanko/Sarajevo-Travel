import 'package:flutter/material.dart';
import 'package:sarajevo_travel/app_bar_icon.dart';
import 'package:sarajevo_travel/models/object_models.dart';
import 'package:sarajevo_travel/widgets/detail_contact_panel.dart';
import 'package:sarajevo_travel/widgets/detail_price_panel.dart';
import 'package:sarajevo_travel/features/objects/presentation/widgets/object_content_panel.dart';
import 'package:sarajevo_travel/features/objects/presentation/widgets/object_info_badges.dart';
import 'package:sarajevo_travel/features/objects/presentation/widgets/object_info_panel.dart';
import 'package:sarajevo_travel/widgets/photo_carousel.dart';

class ObjectDetailScreen extends StatelessWidget {
  final Place object;
  const ObjectDetailScreen({super.key, required this.object});

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
            PhotoCarousel(photos: object.photos),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(object.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Column(
                    children: [
                      ObjectInfoBadges(object: object),
                      SizedBox(height: 24),
                      ObjectInfoPanel(object: object),
                      ObjectContentPanel(content: object.content),
                      DetailPricePanel(prices: object.prices),
                      DetailContactPanel(mail: object.mail, phoneNumber: object.phoneNumber, url: object.url),
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
