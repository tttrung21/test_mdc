abstract class AuthRepository{
  Future<void> signIn({required String email, required String password});
  Future<void> signUn({required String fullName ,required String email, required String password});
  Future<void> resetPassword({required String email, required String password});
}