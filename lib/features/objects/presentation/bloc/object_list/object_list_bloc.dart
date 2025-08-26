import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarajevo_travel/models/event_models.dart';
import 'object_list_event.dart';
import 'object_list_state.dart';
import 'package:sarajevo_travel/models/object_models.dart' as legacy;

class ObjectListBloc extends Bloc<ObjectListEvent, ObjectListState> {
  ObjectListBloc() : super(const ObjectListState()) {
    on<ObjectListStarted>((event, emit) async {
      emit(state.copyWith(status: ObjectListStatus.loading));
      try {
        final items = await _loadObjectsHardcoded();
        emit(state.copyWith(status: ObjectListStatus.success, objects: items));
      } catch (e) {
        emit(state.copyWith(status: ObjectListStatus.failure, message: e.toString()));
      }
    });
  }

  Future<List<legacy.Place>> _loadObjectsHardcoded() async {
    return <legacy.Place>[
      legacy.Place(
        photos: [
          "https://picsum.photos/id/300/1200/1300",
          "https://picsum.photos/id/301/1200/1300",
          "https://picsum.photos/id/302/1200/1300",
        ],

        name: '4 Sobe Gospođe Safije',
        description:
            'Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque sem placerat in id cursus mi pretium tellus duis convallis tempus leo eu aenean sed diam urna tempor pulvinar vivamus fringilla lacus nec metus bibendum egestas iaculis massa nisl malesuada lacinia integer nunc posuere ut hendrerit semper vel class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos himenaeos orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus donec rhoncus eros lobortis nulla molestie mattis scelerisque maximus eget fermentum odio phasellus non purus est efficitur laoreet mauris pharetra vestibulum fusce dictum risus blandit quis suspendisse aliquet nisi sodales consequat magna ante condimentum neque at luctus nibh finibus facilisis dapibus etiam interdum tortor ligula congue sollicitudin erat viverra ac tincidunt nam porta elementum a enim euismod quam justo lectus commodo augue arcu dignissim velit aliquam imperdiet mollis nullam volutpat porttitor ullamcorper rutrum gravida cras eleifend turpis fames primis vulputate ornare sagittis vehicula praesent dui felis venenatis ultrices proin libero feugiat tristique accumsan maecenas potenti ultricies habitant morbi senectus netus suscipit auctor curabitur facilisi cubilia curae hac habitasse platea dictumst lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque.',
        address: 'Hamdije Kreševljakovića 59',
        imageUrl: 'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=600&q=80',
        category: legacy.ObjectCategory.muzeji,
        mail: "info@sobe-safije.com",
        phoneNumber: "+387 33 123 456",
        url: "https://www.sobe-safije.com",
        content: [
          "Usluge keteringa dostupne",
          "Pusenje dozvoljeno",
          "Hrana za ponijeti",
          "Omogućen pristup osobama sa invaliditetommmmm",
        ],
        infoSpecs: [
          legacy.ObjectInfoSpec(opis: 'Ukupni kapacitet', vrijednost: '26'),
          legacy.ObjectInfoSpec(opis: 'Rezervacije', vrijednost: 'Nisu potrebne rezervacije'),
          legacy.ObjectInfoSpec(opis: 'Tip kuhinje', vrijednost: 'Fast food'),
          legacy.ObjectInfoSpec(opis: 'Poslužuju se obroci', vrijednost: 'Desert'),
          legacy.ObjectInfoSpec(opis: 'Poslužuju se pića', vrijednost: 'Kafa, čaj, negazirana pića, gazirana pića'),
          legacy.ObjectInfoSpec(opis: 'Wifi', vrijednost: 'Da'),
        ],
      ),
      legacy.Place(
        photos: [
          "https://picsum.photos/id/303/1200/1300",
          "https://picsum.photos/id/304/1200/1300",
          "https://picsum.photos/id/305/1200/1300",
        ],
        name: '5th Avenue',
        description:
            'Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque sem placerat in id cursus mi pretium tellus duis convallis tempus leo eu aenean sed diam urna tempor pulvinar vivamus fringilla lacus nec metus bibendum egestas iaculis massa nisl malesuada lacinia integer nunc posuere ut hendrerit semper vel class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos himenaeos orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus donec rhoncus eros lobortis nulla molestie mattis scelerisque maximus eget fermentum odio phasellus non purus est efficitur laoreet mauris pharetra vestibulum fusce dictum risus blandit quis suspendisse aliquet nisi sodales consequat magna ante condimentum neque at luctus nibh finibus facilisis dapibus etiam interdum tortor ligula congue sollicitudin erat viverra ac tincidunt nam porta elementum a enim euismod quam justo lectus commodo augue arcu dignissim velit aliquam imperdiet mollis nullam volutpat porttitor ullamcorper rutrum gravida cras eleifend turpis fames primis vulputate ornare sagittis vehicula praesent dui felis venenatis ultrices proin libero feugiat tristique accumsan maecenas potenti ultricies habitant morbi senectus netus suscipit auctor curabitur facilisi cubilia curae hac habitasse platea dictumst lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque.',
        address: 'Trg Oslobođenja - Alija Izetbegović',
        imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80',
        category: legacy.ObjectCategory.uliceTrgovi,
        phoneNumber: "+387 33 654 321",
        url: "https://www.5thavenue.com",
        prices: [
          EventObjectPrice(category: 'Cijena karte za odrasle', price: 'besplatno'),
          EventObjectPrice(category: 'Cijena karte za djecu', price: 'besplatno'),
        ],
      ),
      legacy.Place(
        photos: [
          "https://picsum.photos/id/306/1200/1300",
          "https://picsum.photos/id/307/1200/1300",
          "https://picsum.photos/id/308/1200/1300",
        ],
        name: 'Aromatica',
        description:
            'Lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque sem placerat in id cursus mi pretium tellus duis convallis tempus leo eu aenean sed diam urna tempor pulvinar vivamus fringilla lacus nec metus bibendum egestas iaculis massa nisl malesuada lacinia integer nunc posuere ut hendrerit semper vel class aptent taciti sociosqu ad litora torquent per conubia nostra inceptos himenaeos orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus donec rhoncus eros lobortis nulla molestie mattis scelerisque maximus eget fermentum odio phasellus non purus est efficitur laoreet mauris pharetra vestibulum fusce dictum risus blandit quis suspendisse aliquet nisi sodales consequat magna ante condimentum neque at luctus nibh finibus facilisis dapibus etiam interdum tortor ligula congue sollicitudin erat viverra ac tincidunt nam porta elementum a enim euismod quam justo lectus commodo augue arcu dignissim velit aliquam imperdiet mollis nullam volutpat porttitor ullamcorper rutrum gravida cras eleifend turpis fames primis vulputate ornare sagittis vehicula praesent dui felis venenatis ultrices proin libero feugiat tristique accumsan maecenas potenti ultricies habitant morbi senectus netus suscipit auctor curabitur facilisi cubilia curae hac habitasse platea dictumst lorem ipsum dolor sit amet consectetur adipiscing elit quisque faucibus ex sapien vitae pellentesque.',
        address: 'Kundurdžiluk 20',
        imageUrl: 'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?auto=format&fit=crop&w=600&q=80',
        category: legacy.ObjectCategory.prirodaUSarajevu,
        prices: [
          EventObjectPrice(category: 'Odrasli', price: '23KM'),
          EventObjectPrice(category: 'Djeca', price: '15KM'),
        ],
      ),
    ];
  }
}
