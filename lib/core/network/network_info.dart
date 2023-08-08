import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get hasConnection;
}

class NetworkInfompl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;
  const NetworkInfompl({
    required this.connectionChecker,
  });

  @override
  Future<bool> get hasConnection async {
    return await connectionChecker.hasConnection;
  }
}
