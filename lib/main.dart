import 'package:ecomm_391/data/remote/helper/api_helper.dart';
import 'package:ecomm_391/data/remote/repository/user_repo.dart';
import 'package:ecomm_391/domain/constants/app_routes.dart';
import 'package:ecomm_391/ui/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) =>
          UserBloc(userRepository: UserRepository(apiHelper: ApiHelper())),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.mRoutes,
    );
  }
}
