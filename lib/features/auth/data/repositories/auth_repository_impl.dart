import 'package:clean_blog_app/core/error/exception.dart';
import 'package:clean_blog_app/core/error/failure.dart';
import 'package:clean_blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(
        email: email,
        password: password,
        name: name,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
