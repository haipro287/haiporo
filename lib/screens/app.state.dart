part of 'app.cubit.dart';

@immutable
abstract class AppState extends Equatable{
  const AppState();
}

class AppInitial extends AppState {
  const AppInitial();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AppLoading extends AppState {
  const AppLoading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AppLoaded extends AppState {
  const AppLoaded();

  @override
  // TODO: implement props
  List<Object> get props => [];
}