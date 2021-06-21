part of 'search.cubit.dart';

@immutable
abstract class SearchState extends Equatable{
  const SearchState();
}

class Initial extends SearchState {
  const Initial();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Loading extends SearchState {
  const Loading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Loaded extends SearchState {
  const Loaded();

  @override
  // TODO: implement props
  List<Object> get props => [];
}