import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/account_states_model.dart';

abstract class GetAccountStatesRemoteDS {
  Future<AccountStatesModel> getAccountStates(int movieId);
}

class GetAccountStatesRemoteDSImpl implements GetAccountStatesRemoteDS {
  final SharedPreferences sharedPreferences;
  final ApiConsumer apiConsumer;

  GetAccountStatesRemoteDSImpl({
    required this.sharedPreferences,
    required this.apiConsumer,
  });

  @override
  Future<AccountStatesModel> getAccountStates(int movieId) async {
    bool isGuest = sharedPreferences.getBool(AppStrings.isGeust)!;
    String id = sharedPreferences.getString(AppStrings.sessionId)!;

    var response = await apiConsumer.get(
      path: EndPoints.accountStates(movieId),
      queryParameters: isGuest ? {"guest_session_id": id} : {"session_id": id},
    );
    return AccountStatesModel.fromJson(response);
  }
}
