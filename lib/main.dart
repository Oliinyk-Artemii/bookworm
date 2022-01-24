import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubits/messager/messager_cubit.dart';
import 'package:untitled/cubits/user/user_cubit.dart';
import 'package:untitled/project_router.dart';
import 'package:untitled/utils/di_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();

  DIUtils.injectDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BookwarmApp(),
  ));
}

class BookwarmApp extends StatelessWidget {
  const BookwarmApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<UserCubit>(
          create: (context) => DIUtils.get<UserCubit>(),
        ),
        BlocProvider<MessagerCubit>(
          create: (context) => DIUtils.get<MessagerCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.base.name,
        onGenerateRoute: ProjectRouter.generateRoute,
      ),
    );
  }
}
