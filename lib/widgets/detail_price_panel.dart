import 'package:flutter/material.dart';
import 'package:sarajevo_travel/models/event_models.dart';

class DetailPricePanel extends StatelessWidget {
  final List<EventObjectPrice>? prices;
  const DetailPricePanel({super.key, required this.prices});

  bool get hasPriceInfo {
    return prices != null && prices!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    if (!hasPriceInfo) {
      return SizedBox.shrink();
    }
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
              title: Text("Cijene"),
              iconColor: Color(0xFFD85151),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ...List.generate(prices!.length, (index) {
                        final item = prices![index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: index == prices!.length - 1 ? 0 : 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.price, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD85151))),
                              SizedBox(height: 4),
                              Text((item.category)),
                            ],
                          ),
                        );
                      }),
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
