class RequestToken {
  final bool success;
  final String expiresAt;
  final String requestToken;

  RequestToken({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });
}
