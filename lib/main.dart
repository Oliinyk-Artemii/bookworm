import 'package:flutter/material.dart';
import 'package:untitled/project_router.dart';

void main() {
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.dialog.name,
      onGenerateRoute: ProjectRouter.generateRoute,
    );
  }
}