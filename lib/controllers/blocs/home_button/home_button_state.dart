part of 'home_button_bloc.dart';

class HomeButtonState extends Equatable {
  const HomeButtonState({
    required this.buttonList,
    required this.activeIndex,
  });

  final List<HomeButtonModel> buttonList;
  final int activeIndex;

  HomeButtonState copyWith({
    List<HomeButtonModel>? buttonList,
    int? activeIndex,
  }) {
    return HomeButtonState(
      buttonList: buttonList ?? this.buttonList,
      activeIndex: activeIndex ?? this.activeIndex,
    );
  }

  @override
  List<Object> get props => [buttonList, activeIndex];
}
