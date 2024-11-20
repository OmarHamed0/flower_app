import 'package:flower_app/src/domain/entities/auth_response/otp_verify_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_verify_response_dto.g.dart';

@JsonSerializable()
class OtpVerifyResponseDto {
  @JsonKey(name: "status")
  final String? status;

  OtpVerifyResponseDto({
    this.status,
  });

  factory OtpVerifyResponseDto.fromJson(Map<String, dynamic> json) {
    return _$OtpVerifyResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OtpVerifyResponseDtoToJson(this);
  }

  OtpVerifyResponse toDomain() => OtpVerifyResponse(status: status);
}
