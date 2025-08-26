import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    super.key,
    required this.icon,
    this.color, // Dodaj parametar boje
  });

  final String icon;
  final Color? color; // Nullable boja

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = color ?? Theme.of(context).colorScheme.onSurfaceVariant;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor:
          Theme.of(context).brightness == Brightness.dark ? Colors.white.withAlpha(50) : Colors.black.withAlpha(50),
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: SvgPicture.asset(icon, colorFilter: ColorFilter.mode(effectiveColor, BlendMode.srcIn)),
        ),
      ),
    );
  }
}
