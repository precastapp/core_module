import '../entities/entity.dart';

extension EntityJson on Entity {
  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt,
        'modifiedAt': modifiedAt,
      };
  static Entity fromJson(Map<String, dynamic> json, [Entity? entity]) {
    entity ??= Entity(id: json['id']);
    entity.createdAt = json['createdAt'];
    entity.modifiedAt = json['modifiedAt'];
    return entity;
  }
}
