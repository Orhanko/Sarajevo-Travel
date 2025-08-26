import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// class PhotoCarousel extends StatefulWidget {
//   const PhotoCarousel({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _PhotoCarouselState();
//   }
// }

// class _PhotoCarouselState extends State<PhotoCarousel> {
//   int currentIndex = 0;
//   List<String> photos = [
//     'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=600&q=80',
//     'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80',
//     'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?auto=format&fit=crop&w=600&q=80',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CarouselSlider(
//           items:
//               photos
//                   .map(
//                     (photo) => Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         image: DecorationImage(image: NetworkImage(photo), fit: BoxFit.cover),
//                       ),
//                     ),
//                   )
//                   .toList(),
//           options: CarouselOptions(
//             height: 330.0,
//             enlargeCenterPage: true,
//             viewportFraction: 0.8,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//           ),
//         ),
//         SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children:
//               photos
//                   .asMap()
//                   .entries
//                   .map(
//                     (item) => Container(
//                       height: 10,
//                       width: 10,
//                       margin: EdgeInsets.symmetric(horizontal: 4),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: currentIndex == item.key ? Color(0xFFD85151) : Colors.grey,
//                       ),
//                     ),
//                   )
//                   .toList(),
//         ),
//         SizedBox(height: 8),
//       ],
//     );
//   }
// }

class PhotoCarousel extends StatefulWidget {
  final List<String> photos;

  const PhotoCarousel({super.key, required this.photos});

  @override
  State<StatefulWidget> createState() => _PhotoCarouselState();
}

class _PhotoCarouselState extends State<PhotoCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items:
              widget.photos
                  .map(
                    (photo) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(image: NetworkImage(photo), fit: BoxFit.cover),
                      ),
                    ),
                  )
                  .toList(),
          options: CarouselOptions(
            height: 330.0,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 16),
        // Prikazujemo indikatore samo ako ima više od jedne slike
        if (widget.photos.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                widget.photos
                    .asMap()
                    .entries
                    .map(
                      (item) => Container(
                        height: 10,
                        width: 10,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == item.key ? Color(0xFFD85151) : Colors.grey,
                        ),
                      ),
                    )
                    .toList(),
          ),
        SizedBox(height: 8),
      ],
    );
  }
}
