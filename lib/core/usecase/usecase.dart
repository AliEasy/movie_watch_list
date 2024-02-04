abstract class BaseUseCaseOptionalParam<Type, Params> {
  Future<Type> call({Params params});
}

abstract class BaseUseCaseWithParam<Type, Params> {
  Future<Type> call(Params params);
}
