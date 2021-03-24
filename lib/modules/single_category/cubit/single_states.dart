abstract class  SingleScreenStates {}
class SingleScreenStateInitial extends SingleScreenStates{}
class SingleScreenStateLoading extends SingleScreenStates{}
class SingleScreenStateSuccess extends SingleScreenStates{}
class SingleScreenStateError extends SingleScreenStates{
  final String error;
  SingleScreenStateError(this.error);

}