import 'package:azkar/core/utils/hive_service.dart';

import 'sebha_repo_interface.dart';

class SebhaRepoImp implements SebhaRepoInterface {
  final HiveService _hiveService;
  SebhaRepoImp(this._hiveService);
  @override
  Future addCounter({required String key, required int value , required String boxName}) async {
    await _hiveService.saveData(key, value, boxName);
  }

  @override
  Future getCounter({required String key, required String boxName}) async {
    return await _hiveService.getData(key, boxName);
  }

  @override
  Future resetCounter({required String key, required String boxName}) async {
    await _hiveService.saveData(key, 0, boxName);
  }
}
