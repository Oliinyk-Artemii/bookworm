import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubits/messager/messager_cubit.dart';
import 'package:untitled/cubits/user/user_cubit.dart';
import 'package:untitled/project_router.dart';
import 'package:untitled/utils/di_utils.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(
      name: 'Bookworm',
      options: const FirebaseOptions(
        appId: '1:785501196505:android:5fc10b5715f1462b25aec8',
        projectId: 'bookworm-272ea',
        messagingSenderId: '785501196505',
        apiKey:
            '	AAAAtuOFENk:APA91bF26R-qLH1e-6k7-2mhq-vWMOuRR2y7znkQB6tZDWGfhgaoFue1e3QPzhOKB34b4wKJXZy7YvJvbSft-0nuVdUQc0KPlULvkb4VJe8QHbwwjzwrxxGkvfgqg0TyakUU-eXltSLp',
      ));

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
