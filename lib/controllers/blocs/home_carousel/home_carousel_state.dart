// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_carousel_bloc.dart';

abstract class HomeCarouselState extends Equatable {}

class HomeCarouselInitial extends HomeCarouselState {
  @override
  List<Object?> get props => [];
}

class HomeCarouselLoaded extends HomeCarouselState {
  final List<HomeCarouselModel> value;
  final int activeIndex;
  HomeCarouselLoaded({
    required this.value,
    this.activeIndex = 0,
  });

  HomeCarouselLoaded copyWith({
    List<HomeCarouselModel>? value,
    int? activeIndex,
  }) {
    return HomeCarouselLoaded(
      value: value ?? this.value,
      activeIndex: activeIndex ?? this.activeIndex,
    );
  }

  @override
  List<Object?> get props => [value, activeIndex];
}
