import 'package:flower_app/src/domain/entities/occasions/OccasionsEntity.dart';

class OccasionsStates{}

class InitialState extends OccasionsStates{}
class LoadingState extends OccasionsStates{}
class LoadedState extends OccasionsStates{
  final List<OccasionsEntity> occasions;
  LoadedState({required this.occasions});
}
class ErrorState extends OccasionsStates{
  final Exception exception;
  ErrorState({required this.exception});
}

class ChangeOccasionState extends OccasionsStates{
  final String id;
  ChangeOccasionState({required this.id});
}