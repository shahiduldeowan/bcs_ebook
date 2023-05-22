import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todos/controllers/blocs/home_carousel/home_carousel_bloc.dart';
import '../../controllers/blocs/home_button/home_button_bloc.dart';
import '../../data/repo/home_carousel_repo.dart';
import '../views/home_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
            builder: (homeCtx) => MultiRepositoryProvider(
                  providers: [
                    RepositoryProvider(
                        create: (homeCarouselCtx) => HomeCarouselRepo()),
                  ],
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (homeCarouselCtx) => HomeCarouselBloc(
                          RepositoryProvider.of(homeCarouselCtx),
                        )..add(GetHomeCarouselEvent()),
                      ),
                      BlocProvider(
                        create: (homeBtnCtx) => HomeButtonBloc(),
                      ),
                    ],
                    child: const HomeScreen(),
                  ),
                ));
      default:
        return null;
    }
  }
}
