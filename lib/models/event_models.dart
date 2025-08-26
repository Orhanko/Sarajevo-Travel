enum EventCategory {
  koncert,
  svirkaUzivo,
  party,
  film,
  izlozba,
  performans,
  pozorisnaPredstava,
  opera,
  balet,
  sportskiDogadaj,
  festival,
  konferencija,
  sajam,
  dogadaj,
}

extension EventCategoryExtension on EventCategory {
  String get label {
    switch (this) {
      case EventCategory.koncert:
        return 'Koncert';
      case EventCategory.svirkaUzivo:
        return 'Svirka Uživo';
      case EventCategory.party:
        return 'Party';
      case EventCategory.film:
        return 'Film';
      case EventCategory.izlozba:
        return 'Izložba';
      case EventCategory.performans:
        return 'Performans';
      case EventCategory.pozorisnaPredstava:
        return 'Pozorišna Predstava';
      case EventCategory.opera:
        return 'Opera';
      case EventCategory.balet:
        return 'Balet';
      case EventCategory.sportskiDogadaj:
        return 'Sportski Događaj';
      case EventCategory.festival:
        return 'Festival';
      case EventCategory.konferencija:
        return 'Konferencija';
      case EventCategory.sajam:
        return 'Sajam';
      case EventCategory.dogadaj:
        return 'Događaj';
    }
  }
}

class Event {
  final List<String> photos;
  final String name;
  final String address;
  final String imageUrl;
  final EventCategory category;
  final String dateAndTime;
  final String description;
  final List<EventSchedule>? schedule;
  final List<EventObjectPrice>? prices;
  final String? mail;
  final String? phoneNumber;
  final String? url;

  Event({
    required this.photos,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.category,
    required this.dateAndTime,
    required this.description,
    this.mail,
    this.phoneNumber,
    this.url,
    this.schedule,
    this.prices,
  });
}

class EventSchedule {
  final String dan;
  final String datum;
  final String vrijeme;

  EventSchedule({required this.dan, required this.datum, required this.vrijeme});
}

class EventObjectPrice {
  final String category;
  final String price;

  EventObjectPrice({required this.category, required this.price});
}

// Dummy lista evenata
final List<Event> dummyEvents = [
  Event(
    photos: [
      "https://picsum.photos/id/237/1200/1300",
      "https://picsum.photos/id/238/1200/1300",
      "https://picsum.photos/id/239/1200/1300",
    ],
    name: 'AJB DOC Film Festival 2025',
    address: 'Hamdije Kreševljakovića 59',
    imageUrl: 'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=600&q=80',
    category: EventCategory.sajam,
    dateAndTime: "01 Jan / 20:00",
    mail: 'info@primjer.com',
    phoneNumber: '+385 1 234 5678',
    url: 'www.primjer.com',
    description:
        'Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque sem placerat in id cursus mi pretium tellus duis convallis tempus leo eu aenean sed diam urna tempor pulvinar vivamus fringilla lacus nec metus bibendum egestas iaculis massa nisl malesuada lacinia integer nunc posuere ut hendrerit semper vel class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos himenaeos orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus donec rhoncus eros lobortis nulla molestie mattis scelerisque maximus eget fermentum odio phasellus non purus est efficitur laoreet mauris pharetra vestibulum fusce dictum risus blandit quis suspendisse aliquet nisi sodales consequat magna ante condimentum neque at luctus nibh finibus facilisis dapibus etiam interdum tortor ligula congue sollicitudin erat viverra ac tincidunt nam porta elementum a enim euismod quam justo lectus commodo augue arcu dignissim velit aliquam imperdiet mollis nullam volutpat porttitor ullamcorper rutrum gravida cras eleifend turpis fames primis vulputate ornare sagittis vehicula praesent dui felis venenatis ultrices proin libero feugiat tristique accumsan maecenas potenti ultricies habitant morbi senectus netus suscipit auctor curabitur facilisi cubilia curae hac habitasse platea dictumst lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque.',
    schedule: [
      EventSchedule(dan: 'Petak', datum: '25.08.2025.', vrijeme: '15:00'),
      EventSchedule(dan: 'Subota', datum: '28.08.2025.', vrijeme: '20:00'),
    ],
    prices: [
      EventObjectPrice(category: 'Cijena karte za odrasle', price: '10KM'),
      EventObjectPrice(category: 'Cijena karte za djecu', price: '5KM'),
    ],
  ),
  Event(
    photos: [
      "https://picsum.photos/id/1/1200/1300",
      "https://picsum.photos/id/2/1200/1300",
      "https://picsum.photos/id/3/1200/1300",
      "https://picsum.photos/id/45/1200/1300",
      "https://picsum.photos/id/34/1200/1300",
      "https://picsum.photos/id/23/1200/1300",
    ],
    name: 'Crvena Jabuka Europe Tour 2025',
    address: 'Trg Oslobođenja - Alija Izetbegović',
    imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80',
    category: EventCategory.opera,
    dateAndTime: "19 May / 12:00",
    mail: 'info@primjer.com',

    description:
        'Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque sem placerat in id cursus mi pretium tellus duis convallis tempus leo eu aenean sed diam urna tempor pulvinar vivamus fringilla lacus nec metus bibendum egestas iaculis massa nisl malesuada lacinia integer nunc posuere ut hendrerit semper vel class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos himenaeos orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus donec rhoncus eros lobortis nulla molestie mattis scelerisque maximus eget fermentum odio phasellus non purus est efficitur laoreet mauris pharetra vestibulum fusce dictum risus blandit quis suspendisse aliquet nisi sodales consequat magna ante condimentum neque at luctus nibh finibus facilisis dapibus etiam interdum tortor ligula congue sollicitudin erat viverra ac tincidunt nam porta elementum a enim euismod quam justo lectus commodo augue arcu dignissim velit aliquam imperdiet mollis nullam volutpat porttitor ullamcorper rutrum gravida cras eleifend turpis fames primis vulputate ornare sagittis vehicula praesent dui felis venenatis ultrices proin libero feugiat tristique accumsan maecenas potenti ultricies habitant morbi senectus netus suscipit auctor curabitur facilisi cubilia curae hac habitasse platea dictumst lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque.',
  ),
  Event(
    photos: [
      "https://picsum.photos/id/4/1200/1300",
      "https://picsum.photos/id/5/1200/1300",
      "https://picsum.photos/id/6/1200/1300",
    ],
    name: 'Damir Imamović u Svrzinoj kući',
    address: 'Kundurdžiluk 20, 71000 Sarajevo',
    imageUrl: 'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?auto=format&fit=crop&w=600&q=80',
    category: EventCategory.balet,
    dateAndTime: "13 Dec / 22:00",
    mail: "info@primjer.com",
    url: "www.primjer.com",
    description:
        'Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque sem placerat in id cursus mi pretium tellus duis convallis tempus leo eu aenean sed diam urna tempor pulvinar vivamus fringilla lacus nec metus bibendum egestas iaculis massa nisl malesuada lacinia integer nunc posuere ut hendrerit semper vel class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos himenaeos orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus donec rhoncus eros lobortis nulla molestie mattis scelerisque maximus eget fermentum odio phasellus non purus est efficitur laoreet mauris pharetra vestibulum fusce dictum risus blandit quis suspendisse aliquet nisi sodales consequat magna ante condimentum neque at luctus nibh finibus facilisis dapibus etiam interdum tortor ligula congue sollicitudin erat viverra ac tincidunt nam porta elementum a enim euismod quam justo lectus commodo augue arcu dignissim velit aliquam imperdiet mollis nullam volutpat porttitor ullamcorper rutrum gravida cras eleifend turpis fames primis vulputate ornare sagittis vehicula praesent dui felis venenatis ultrices proin libero feugiat tristique accumsan maecenas potenti ultricies habitant morbi senectus netus suscipit auctor curabitur facilisi cubilia curae hac habitasse platea dictumst lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque.',
    schedule: [
      EventSchedule(dan: 'Petak', datum: '25.08.2025.', vrijeme: '13:00'),
      EventSchedule(dan: 'Subota', datum: '28.08.2025.', vrijeme: '17:00'),
    ],
  ),
  Event(
    photos: [
      "https://picsum.photos/id/7/1200/1300",
      "https://picsum.photos/id/8/1200/1300",
      "https://picsum.photos/id/9/1200/1300",
    ],
    name: 'Ured ambasade Republike Azerbejdžan',
    address: 'Dzemala Bijedica 305',
    imageUrl: 'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?auto=format&fit=crop&w=600&q=80',
    category: EventCategory.svirkaUzivo,
    dateAndTime: "30 Sep / 18:00",
    description:
        'Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque sem placerat in id cursus mi pretium tellus duis convallis tempus leo eu aenean sed diam urna tempor pulvinar vivamus fringilla lacus nec metus bibendum egestas iaculis massa nisl malesuada lacinia integer nunc posuere ut hendrerit semper vel class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos himenaeos orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus donec rhoncus eros lobortis nulla molestie mattis scelerisque maximus eget fermentum odio phasellus non purus est efficitur laoreet mauris pharetra vestibulum fusce dictum risus blandit quis suspendisse aliquet nisi sodales consequat magna ante condimentum neque at luctus nibh finibus facilisis dapibus etiam interdum tortor ligula congue sollicitudin erat viverra ac tincidunt nam porta elementum a enim euismod quam justo lectus commodo augue arcu dignissim velit aliquam imperdiet mollis nullam volutpat porttitor ullamcorper rutrum gravida cras eleifend turpis fames primis vulputate ornare sagittis vehicula praesent dui felis venenatis ultrices proin libero feugiat tristique accumsan maecenas potenti ultricies habitant morbi senectus netus suscipit auctor curabitur facilisi cubilia curae hac habitasse platea dictumst lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque.',
  ),
  Event(
    photos: [
      "https://picsum.photos/id/10/1200/1300",
      "https://picsum.photos/id/11/1200/1300",
      "https://picsum.photos/id/12/1200/1300",
    ],
    name: 'Zlatarsko-juvelirska radnja Senad Softić',
    address: 'Hamdije Kreševljakovića 59',
    imageUrl: 'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?auto=format&fit=crop&w=600&q=80',
    category: EventCategory.sportskiDogadaj,
    dateAndTime: "02 Aug / 16:00",
    url: "www.primjer.com",
    description:
        'Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque sem placerat in id cursus mi pretium tellus duis convallis tempus leo eu aenean sed diam urna tempor pulvinar vivamus fringilla lacus nec metus bibendum egestas iaculis massa nisl malesuada lacinia integer nunc posuere ut hendrerit semper vel class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos himenaeos orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus donec rhoncus eros lobortis nulla molestie mattis scelerisque maximus eget fermentum odio phasellus non purus est efficitur laoreet mauris pharetra vestibulum fusce dictum risus blandit quis suspendisse aliquet nisi sodales consequat magna ante condimentum neque at luctus nibh finibus facilisis dapibus etiam interdum tortor ligula congue sollicitudin erat viverra ac tincidunt nam porta elementum a enim euismod quam justo lectus commodo augue arcu dignissim velit aliquam imperdiet mollis nullam volutpat porttitor ullamcorper rutrum gravida cras eleifend turpis fames primis vulputate ornare sagittis vehicula praesent dui felis venenatis ultrices proin libero feugiat tristique accumsan maecenas potenti ultricies habitant morbi senectus netus suscipit auctor curabitur facilisi cubilia curae hac habitasse platea dictumst lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque.',
  ),
];
