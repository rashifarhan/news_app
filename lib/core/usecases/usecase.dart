//type and params are generic types
abstract class UseCase<Type,Params>{
  Future<Type> call({Params params});
}