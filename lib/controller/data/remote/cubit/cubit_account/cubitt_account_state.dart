part of 'cubitt_account_cubit.dart';

@immutable
abstract class tAccountState {}

class tAccountInitial extends tAccountState {}
class RegisterByEmailAndPasswordState extends tAccountState {}
class RegisterByEmailAndPasswordSaveState extends tAccountState {}
class LoginByEmailAndPasswordSaveState extends tAccountState {}
class LoginByEmailAndPasswordState extends tAccountState {}
class SelectPhotoState extends tAccountState {}
class GoogleByEmailAndPasswordSaveState extends tAccountState {}
