import '../../domain/entities/guest_session.dart';

class GuestSessionModel extends GuestSession {
  GuestSessionModel({
    required bool success,
    required String guestSessionId,
    required String expiresAt,
  }) : super(
          success: success,
          guestSessionId: guestSessionId,
          expiresAt: expiresAt,
        );

  factory GuestSessionModel.fromJson(Map<String, dynamic> json) {
    return GuestSessionModel(
      success: json["success"],
      guestSessionId: json["guest_session_id"],
      expiresAt: json["expires_at"],
    );
  }
}
