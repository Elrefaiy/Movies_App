class GuestSession {
  final bool success;
  final String guestSessionId;
  final String expiresAt;

  GuestSession({
    required this.success,
    required this.guestSessionId,
    required this.expiresAt,
  });
}
