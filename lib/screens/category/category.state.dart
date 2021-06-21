part of 'category.cubit.dart';

@immutable
abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryState {
  const CategoryLoaded();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

