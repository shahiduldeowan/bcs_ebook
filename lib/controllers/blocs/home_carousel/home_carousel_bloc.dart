import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todos/data/model/home_carousel_model.dart';

import '../../../data/repo/home_carousel_repo.dart';

part 'home_carousel_event.dart';
part 'home_carousel_state.dart';

class HomeCarouselBloc extends Bloc<HomeCarouselEvent, HomeCarouselState> {
  final HomeCarouselRepo _repo;
  HomeCarouselBloc(this._repo) : super(HomeCarouselInitial()) {
    on<GetHomeCarouselEvent>((event, emit) => emit(
          HomeCarouselLoaded(value: _repo.getData()),
        ));

    on<ActiveIndexUpdateCarouselEvent>((event, emit) {
      if (state is HomeCarouselLoaded) {
        final cntState = state as HomeCarouselLoaded;
        emit(cntState.copyWith(activeIndex: event.activeIndex));
        return;
      }

      emit(HomeCarouselLoaded(
        value: _repo.getData(),
        activeIndex: event.activeIndex,
      ));
    });
  }
}
