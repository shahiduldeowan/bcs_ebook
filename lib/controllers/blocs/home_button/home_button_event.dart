part of 'home_button_bloc.dart';

class HomeButtonEvent extends Equatable {
  const HomeButtonEvent(this.activeIndex);

  final int activeIndex;

  @override
  List<Object> get props => [activeIndex];
}
