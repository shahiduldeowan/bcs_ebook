import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './controllers/debug/app_observer.dart';
import './ui/themes/app_theme.dart';
import './ui/routers/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPortrait();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

Future setPortrait() async => await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
