import 'package:flutter/material.dart';
import '../../../../models/object_models.dart';

class ObjectCard extends StatelessWidget {
  final Place object;
  final VoidCallback? onTap;

  const ObjectCard({super.key, required this.object, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? const Color(0x40FFFFFF) // 25% bijela
                    : const Color(0x40000000), // 25% crna // 25% crna (#000000) = 0x40 alfa
            offset: const Offset(0, 1), // X: 0, Y: 1
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
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: SizedBox(
              height: 155,
              child: Row(
                children: [
                  // Slika zauzima TAČNO 50% kartice
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(8)),
                      child: SizedBox.expand(
                        child: Ink.image(image: NetworkImage(object.imageUrl), height: 250, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  // Desni deo kartice
                  Expanded(
                    flex: 1,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
                        color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF131313) : Colors.white,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).brightness == Brightness.dark
                                        ? Color(0xFF402020)
                                        : Color(0xFFFFEBEB),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                object.category.label,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFD85151),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(object.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 18, color: Colors.grey),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(object.address, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
