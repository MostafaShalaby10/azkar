import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String _boxName = 'appBox';
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_boxName).then((value) {
      print('Hive initialized and box opened: ${value.isOpen}');
    });
  }
   Future<void> saveData( String key , int data) async {
    final box = Hive.box(_boxName);
    await box.put(key, data);
  }
   Future<int?> getData(String key) async {
    final box = Hive.box(_boxName);
    return await box.get(key);
  }
}
