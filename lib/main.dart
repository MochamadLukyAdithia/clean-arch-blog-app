import 'package:clean_blog_app/core/secret/app_secret.dart';
import 'package:clean_blog_app/core/theme/theme.dart';
import 'package:clean_blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_blog_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:clean_blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_blog_app/features/auth/presentation/pages/sign_in.dart';
import 'package:clean_blog_app/features/auth/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            userSignUp: UserSignUp(
              AuthRepositoryImpl(
                AuthRemoteDataSourceImpl(supabaseClient: supabase.client),
              ),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dartThemeMode,
      home: const SignIn(),
    );
  }
}
