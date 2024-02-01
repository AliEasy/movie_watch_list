abstract class BaseUseCaseOptionalParam<Type, Params> {
  Future<Type> call({Params params});
}
