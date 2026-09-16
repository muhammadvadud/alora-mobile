import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
sealed class Failure with _$Failure {
  /// Tarmoq bilan ulanish yo'qligi (NetworkFailure)
  const factory Failure.network() = _NetworkFailure;

  /// 400 validation_error. detail - xato matni, fieldErrors - maydonlar bo'yicha xatolar
  const factory Failure.validation(
    String detail,
    Map<String, String> fieldErrors,
  ) = _ValidationFailure;

  /// 401 Auth (login talab qilinadi)
  const factory Failure.auth() = _AuthFailure;

  /// 403 Ruxsat yo'q
  const factory Failure.permission() = _PermissionFailure;

  /// 404 Topilmadi
  const factory Failure.notFound() = _NotFoundFailure;

  /// 429 Limit tugadi / Throttled
  const factory Failure.limit(String detail) = _LimitFailure;

  /// 503 AI xizmati yoki boshqa xizmat vaqtincha ishlamayapti
  const factory Failure.serviceUnavailable() = _ServiceUnavailableFailure;

  /// 500 va boshqa server xatolari
  const factory Failure.server() = _ServerFailure;

  /// Noma'lum xatolik
  const factory Failure.unknown(String detail) = _UnknownFailure;
}
