import 'package:equatable/equatable.dart';
import 'package:sarajevo_travel/models/object_models.dart';

enum ObjectListStatus { initial, loading, success, failure }

class ObjectListState extends Equatable {
  final ObjectListStatus status;
  final List<Place> objects;
  final String? message;

  const ObjectListState({this.status = ObjectListStatus.initial, this.objects = const [], this.message});

  ObjectListState copyWith({ObjectListStatus? status, List<Place>? objects, String? message}) => ObjectListState(
    status: status ?? this.status,
    objects: objects ?? this.objects,
    message: message ?? this.message,
  );

  @override
  List<Object?> get props => [status, objects, message];
}
