part of 'cubitt_account_cubit.dart';

@immutable
abstract class tAccountState {}

class tAccountInitial extends tAccountState {}
class RegisterByEmailAndPasswordState extends tAccountState {}
class RegisterByEmailAndPasswordSaveState extends tAccountState {}
