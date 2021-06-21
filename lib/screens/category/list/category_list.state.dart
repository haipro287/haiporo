part of 'category_list.cubit.dart';

@immutable
abstract class CategoryListState extends Equatable {
  const CategoryListState();
}

class CategoryListInitial extends CategoryListState {
  const CategoryListInitial();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoryListLoading extends CategoryListState {
  const CategoryListLoading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoryListLoaded extends CategoryListState {
  const CategoryListLoaded();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

