part of 'category_test.cubit.dart';

@immutable
abstract class CategoryTestState extends Equatable {
  const CategoryTestState();
}

class CategoryTestInitial extends CategoryTestState {
  const CategoryTestInitial();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoryTestLoading extends CategoryTestState {
  const CategoryTestLoading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoryTestLoaded extends CategoryTestState {
  const CategoryTestLoaded();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoryTestQuestionLoading extends CategoryTestState {
  const CategoryTestQuestionLoading();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoryTestQuestionLoaded extends CategoryTestState {
  const CategoryTestQuestionLoaded();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Running extends CategoryTestState {

  final int duration;

  const Running(this.duration);

  @override
  // TODO: implement props
  List<Object> get props => [duration];
}