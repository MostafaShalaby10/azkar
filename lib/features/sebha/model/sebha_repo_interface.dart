abstract class SebhaRepoInterface {
  Future addCounter({required String key, required int value , required String boxName});
  Future getCounter({required String key , required String boxName});
  Future resetCounter({required String key , required String boxName});
}
