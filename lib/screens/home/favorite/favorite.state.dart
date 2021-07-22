part of 'favorite.cubit.dart';

@immutable
abstract class FavoriteState extends Equatable{
  const FavoriteState();
}

class Initial extends FavoriteState {
  const Initial();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Loading extends FavoriteState {
  const Loading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Loaded extends FavoriteState {
  const Loaded();

  @override
  // TODO: implement props
  List<Object> get props => [];
}