import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/login_cubit/login_cubit.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'screens/HomePage.dart';
import 'screens/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(FirebaseAuth.instance),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null ? '/login' : '/',
        routes: {
          '/login': (context) => LoginPage(),
          '/': (context) => HomePage(),
        },
      ),
    );
  }
}
