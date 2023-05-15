abstract class BaseUseCase<T,G>{
  Future<T> invoke({required G param});
}
abstract class StreamUseCase<T, G>{
  Stream<T> invoke({required G param});
}