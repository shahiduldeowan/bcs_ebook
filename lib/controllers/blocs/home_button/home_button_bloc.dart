import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/home_button_model.dart';

part 'home_button_event.dart';
part 'home_button_state.dart';

class HomeButtonBloc extends Bloc<HomeButtonEvent, HomeButtonState> {
  HomeButtonBloc()
      : super(HomeButtonState(
            buttonList: HomeButtonModel.getColor, activeIndex: -1)) {
    on<HomeButtonEvent>(
        (event, emit) => emit(state.copyWith(activeIndex: event.activeIndex)));
  }
}
