import 'package:azkar/core/utils/hive_service.dart';

import 'sebha_repo_interface.dart';

class SebhaRepoImp implements SebhaRepoInterface {
  final HiveService _hiveService;
  SebhaRepoImp(this._hiveService);
  @override
  Future addCounter({required String key, required int value}) async {
    await _hiveService.saveData(key, value);
  }

  @override
  Future getCounter({required String key}) async {
    return await _hiveService.getData(key);
  }

  @override
  Future resetCounter({required String key}) async {
    await _hiveService.saveData(key, 0);
  }
}
