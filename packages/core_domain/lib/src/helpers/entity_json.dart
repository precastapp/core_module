import '../entities/entity.dart';

extension EntityJson on Entity {
  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt,
        'modifiedAt': modifiedAt,
      };
}
