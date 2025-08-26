import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailContactPanel extends StatelessWidget {
  final String? mail;
  final String? phoneNumber;
  final String? url;

  const DetailContactPanel({super.key, this.mail, this.phoneNumber, this.url});

  // Pomoćna metoda za provjeru je li string null ili prazan
  bool _isNullOrEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }

  // Provjera postoji li barem jedan kontakt podatak
  bool get hasContactInfo {
    return !_isNullOrEmpty(mail) || !_isNullOrEmpty(phoneNumber) || !_isNullOrEmpty(url);
  }

  @override
  Widget build(BuildContext context) {
    // Ako nema kontakt informacija, vraćamo prazan widget
    if (!hasContactInfo) {
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
              title: Text("Kontakt"),
              iconColor: Color(0xFFD85151),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email - prikazujemo samo ako nije null ili prazan
                      if (!_isNullOrEmpty(mail)) ...[
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/custom_icons/mail.svg',
                              width: 18,
                              height: 18,
                              colorFilter: ColorFilter.mode(Color(0xFFD85151), BlendMode.srcIn),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email', style: TextStyle(fontWeight: FontWeight.w600)),
                                  SizedBox(height: 4.0),
                                  Text(mail!),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                      ],

                      // Telefon - prikazujemo samo ako nije null ili prazan
                      if (!_isNullOrEmpty(phoneNumber)) ...[
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/custom_icons/phone-call.svg',
                              width: 18,
                              height: 18,
                              colorFilter: ColorFilter.mode(Color(0xFFD85151), BlendMode.srcIn),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Telefon', style: TextStyle(fontWeight: FontWeight.w600)),
                                  SizedBox(height: 4.0),
                                  Text(phoneNumber!),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                      ],

                      // Web stranica - prikazujemo samo ako nije null ili prazna
                      if (!_isNullOrEmpty(url)) ...[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/custom_icons/globe.svg',
                                width: 18,
                                height: 18,
                                colorFilter: ColorFilter.mode(Color(0xFFD85151), BlendMode.srcIn),
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Web stranica', style: TextStyle(fontWeight: FontWeight.w600)),
                                    SizedBox(height: 4.0),
                                    Text(url!),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
