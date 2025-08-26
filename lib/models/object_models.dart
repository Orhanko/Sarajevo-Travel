import 'package:sarajevo_travel/models/event_models.dart';

enum ObjectCategory {
  atrakcije,
  muzeji,
  uliceTrgovi,
  vidikovci,
  prirodaUSarajevu,
  okoSarajeva,
  restoraniZalogajnice,
  cafeiKlubovi,
  soping,
  aktivniOdmor,
  zdravljeWelnes,
  zaDjecu,
  smjestaj,
  pozorista,
  galerije,
  kina,
  sportskiDogadjaji,
  koncertniObjekti,
  ambasadeKonzulati,
  usluge,
  turistickeAgencije,
}

extension ObjectCategoryExtension on ObjectCategory {
  String get label {
    switch (this) {
      case ObjectCategory.atrakcije:
        return 'Atrakcije';
      case ObjectCategory.muzeji:
        return 'Muzeji';
      case ObjectCategory.uliceTrgovi:
        return 'Ulice i trgovi';
      case ObjectCategory.vidikovci:
        return 'Vidikovci';
      case ObjectCategory.prirodaUSarajevu:
        return 'Priroda u Sarajevu';
      case ObjectCategory.okoSarajeva:
        return 'Oko Sarajeva';
      case ObjectCategory.restoraniZalogajnice:
        return 'Restorani i zalogajnice';
      case ObjectCategory.cafeiKlubovi:
        return 'Cafei i klubovi';
      case ObjectCategory.soping:
        return 'Šoping';
      case ObjectCategory.aktivniOdmor:
        return 'Aktivni odmor';
      case ObjectCategory.zdravljeWelnes:
        return 'Zdravlje i welnes';
      case ObjectCategory.zaDjecu:
        return 'Za djecu';
      case ObjectCategory.smjestaj:
        return 'Smještaj';
      case ObjectCategory.pozorista:
        return 'Pozorišta';
      case ObjectCategory.galerije:
        return 'Galerije';
      case ObjectCategory.kina:
        return 'Kina';
      case ObjectCategory.sportskiDogadjaji:
        return 'Sportski događaji';
      case ObjectCategory.koncertniObjekti:
        return 'Koncertni objekti';
      case ObjectCategory.ambasadeKonzulati:
        return 'Ambasade i konzulati';
      case ObjectCategory.usluge:
        return 'Usluge';
      case ObjectCategory.turistickeAgencije:
        return 'Turističke agencije';
    }
  }
}

class Place {
  final String name;
  final String description;
  final String address;
  final String imageUrl;
  final ObjectCategory category;
  final List<String> photos;
  final String? mail;
  final String? phoneNumber;
  final String? url;
  final List<EventObjectPrice>? prices;
  final List<String>? content;
  final List<ObjectInfoSpec>? infoSpecs;

  Place({
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.category,
    required this.photos,
    required this.description,
    this.mail,
    this.phoneNumber,
    this.url,
    this.prices,
    this.content,
    this.infoSpecs,
  });
}

class ObjectInfoSpec {
  final String opis;
  final String vrijednost;

  ObjectInfoSpec({required this.opis, required this.vrijednost});
}
