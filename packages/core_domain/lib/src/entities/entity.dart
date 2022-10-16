import '../events/domain_event.dart';

class Entity {
  String? id;
  DateTime createdAt = DateTime.now();
  DateTime? modifiedAt;
  List<DomainEvent> domainEvents = [];

  Entity({this.id});

  @override
  bool operator ==(covariant Entity other) => other.id == id;
}
