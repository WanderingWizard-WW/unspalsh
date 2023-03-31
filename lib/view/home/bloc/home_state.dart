part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();

  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  const HomeLoadedState(this.photos);

  final List<UnsplashPhoto> photos;

  @override
  List<Object> get props => [photos];
}

class HomeErrorState extends HomeState {
  const HomeErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class HomeEmptyState extends HomeState {
  const HomeEmptyState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
