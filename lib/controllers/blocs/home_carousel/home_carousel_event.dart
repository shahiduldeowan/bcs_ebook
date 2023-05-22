part of 'home_carousel_bloc.dart';

@immutable
abstract class HomeCarouselEvent extends Equatable {}

class GetHomeCarouselEvent extends HomeCarouselEvent {
  @override
  List<Object?> get props => [];
}

class ActiveIndexUpdateCarouselEvent extends HomeCarouselEvent {
  ActiveIndexUpdateCarouselEvent(this.activeIndex);

  final int activeIndex;

  @override
  List<Object?> get props => [activeIndex];
}
