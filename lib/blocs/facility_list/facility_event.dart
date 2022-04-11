part of 'facility_bloc.dart';

abstract class FacilityEvent extends Equatable {
  const FacilityEvent();
}

class AddFacilityEvent extends Equatable {
  final int facilityId;

  const AddFacilityEvent({required this.facilityId});

  @override
  List<Object> get props => [facilityId];
}

// class