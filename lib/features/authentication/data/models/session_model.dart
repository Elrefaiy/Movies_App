import 'package:movies_application/features/authentication/domain/entities/session.dart';

class SessionModel extends Session {
  SessionModel({
    required bool success,
    required String? sessionId,
    required bool? failure,
    required int? statusCode,
    required String? statusMsg,
  }) : super(
          success: success,
          sessionId: sessionId,
          failure: failure,
          statusCode: statusCode,
          statusMsg: statusMsg,
        );

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      success: json["success"],
      sessionId: json["session_id"] ?? ' ',
      failure: json["failure"] ?? false,
      statusCode: json["status_code"] ?? 200,
      statusMsg: json["status_message"] ?? 'Session Approved!',
    );
  }
}
