abstract class SebhaRepoInterface {
  Future addCounter({required String key, required int value});
  Future getCounter({required String key});
  Future resetCounter({required String key});
}
