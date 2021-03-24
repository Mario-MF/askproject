abstract class HomeScreenStates {}
class HomeStateInitial extends HomeScreenStates{}
class HomeStateLoading extends HomeScreenStates{}
class HomeStateSuccess extends HomeScreenStates{}
class HomeStateError extends HomeScreenStates{
  final String error;
  HomeStateError(this.error);

}