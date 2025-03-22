import 'package:test_mdc/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  @override
  Future<void> resetPassword({required String email, required String password}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUn({required String fullName, required String email, required String password}) {
    // TODO: implement signUn
    throw UnimplementedError();
  }

}