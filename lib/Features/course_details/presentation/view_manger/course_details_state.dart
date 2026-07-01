abstract class EnrollState{}
class EnrollInitial extends EnrollState{}
class EnrollLoading extends EnrollState{}
class EnrollFailure extends EnrollState{
  final String error;
  EnrollFailure({required this.error});
}
class EnrollSuccess extends EnrollState{}
class AlreadyEnrollState extends EnrollState{}
class NotEnrollState extends EnrollState{}
