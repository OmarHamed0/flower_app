import 'package:flower_app/src/data/api/core/response_model/occasions/occasion_response_model.dart';
import 'package:flower_app/src/domain/entities/occasions/OccasionsEntity.dart';

class OccasionModelDto {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  OccasionModelDto({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  List<OccasionsEntity> toDomain(OccasionResponseModel response) {
    return response.occasions!
        .map(
          (e) =>
          OccasionsEntity(
            id: e.Id,
            name: e.name,
            slug: e.slug,
            image: e.image,
          ),
    ).toList();
  }
}