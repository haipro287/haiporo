part of 'home.cubit.dart';

@immutable
abstract class HomeState extends Equatable{
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  const HomeLoaded();

  @override
  // TODO: implement props
  List<Object> get props => [];
}