part of 'all_destination_cubit.dart';

abstract class AllDestinationState extends Equatable {
  const AllDestinationState();

  @override
  List<Object> get props => [];
}

class AllDestinationInitial extends AllDestinationState {}

class AllDestinationLoading extends AllDestinationState {}

class AllDestinationSuccess extends AllDestinationState {
  final List<DestinationModel> destinations;

  AllDestinationSuccess(this.destinations);

  @override
  // TODO: implement props
  List<Object> get props => [destinations];
}

class AllDestinationFailed extends AllDestinationState {
  final String error;

  AllDestinationFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
