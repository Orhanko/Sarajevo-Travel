import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ObjectContentPanel extends StatelessWidget {
  final List<String>? content;
  const ObjectContentPanel({super.key, required this.content});

  bool get hasContent {
    return content != null && content!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    if (!hasContent) {
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
              title: Text("Sadržaj"),
              iconColor: Color(0xFFD85151),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.transparent),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ...List.generate(content!.length, (index) {
                          final item = content![index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: index == content!.length - 1 ? 0 : 16),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/custom_icons/check.svg',
                                  width: 18,
                                  height: 18,
                                  colorFilter: ColorFilter.mode(Color(0xFFD85151), BlendMode.srcIn),
                                ),
                                const SizedBox(width: 16),
                                Expanded(child: Text(item, softWrap: true, maxLines: null)),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
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
