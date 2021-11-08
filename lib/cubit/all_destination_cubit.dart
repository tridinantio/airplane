import 'package:airplane/models/destination_model.dart';
import 'package:airplane/services/all_destination_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_destination_state.dart';

class AllDestinationCubit extends Cubit<AllDestinationState> {
  AllDestinationCubit() : super(AllDestinationInitial());

  void fetchAllDestination() async {
    try {
      emit(AllDestinationLoading());

      List<DestinationModel> destinations =
          await AllDestinationService().fetchDestinations();
      emit(AllDestinationSuccess(destinations));
    } catch (e) {
      emit(AllDestinationFailed(e.toString()));
    }
  }
}
