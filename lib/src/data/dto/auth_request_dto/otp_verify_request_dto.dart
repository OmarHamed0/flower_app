import 'package:flower_app/src/domain/entities/auth_request/otp_verify_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_verify_request_dto.g.dart';

@JsonSerializable()
class OtpVerifyRequestDto {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  OtpVerifyRequestDto({
    this.resetCode,
  });

  factory OtpVerifyRequestDto.fromJson(Map<String, dynamic> json) {
    return _$OtpVerifyRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OtpVerifyRequestDtoToJson(this);
  }

  factory OtpVerifyRequestDto.fromDomain(OtpVerifyRequest request) =>
      OtpVerifyRequestDto(resetCode: request.resetCode);
}
