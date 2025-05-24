import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox("zekr1");
    await Hive.openBox("zekr2");
    await Hive.openBox("zekr3");
   
  }

  Future<void> saveData(String key, int data, String boxName) async {
    final box = Hive.box(boxName);
    await box.put(key, data);
  }

  Future<int?> getData(String key, String boxName) async {
    final box = Hive.box(boxName);
    return await box.get(key);
  }
}
