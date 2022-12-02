import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:great_quran/blocs/models/azan/azan.dart';
import 'package:great_quran/data/remote/client/remote_client.dart';
import 'package:great_quran/data/remote/endpoints.dart';
import 'package:great_quran/data/remote/interfaces/i_azan_time_api.dart';

class AzanTimeApi implements IAzanTimeApi {
  static final provider = Provider<IAzanTimeApi>(
    (ref) => AzanTimeApi(
      ref.read(RemoteClient.provider),
    ),
  );

  // * Dependencies
  final RemoteClient _remoteClient;
  AzanTimeApi(this._remoteClient);

  // *  Methods
  @override
  Future<Azan> getAzan() async {
    final url = AppEndpoints.url;
    try {
      final response = await _remoteClient.get(url);
      return Azan.fromJson(response.data);
    } catch (e, s) {
      debugPrint('Error Api $e\n$s');
      rethrow;
    }
  }
}
