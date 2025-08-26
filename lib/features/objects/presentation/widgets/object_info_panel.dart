import 'package:flutter/material.dart';
import 'package:sarajevo_travel/models/object_models.dart';

class ObjectInfoPanel extends StatelessWidget {
  final Place object;
  const ObjectInfoPanel({super.key, required this.object});
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
                  child: Text(object.description, textAlign: TextAlign.justify),
                ),
                if (object.infoSpecs != null && object.infoSpecs!.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ...List.generate(object.infoSpecs!.length, (index) {
                          final item = object.infoSpecs![index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: index == object.infoSpecs!.length - 1 ? 0 : 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.opis,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD85151)),
                                ),
                                SizedBox(height: 4),
                                Text((item.vrijednost)),
                              ],
                            ),
                          );
                        }),
                      ],
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
