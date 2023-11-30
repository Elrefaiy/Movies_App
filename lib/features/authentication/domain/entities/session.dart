class Session {
  final bool success;
  final String? sessionId;
  final bool? failure;
  final int? statusCode;
  final String? statusMsg;

  Session({
    required this.success,
    required this.sessionId,
    required this.failure,
    required this.statusCode,
    required this.statusMsg,
  });
}
