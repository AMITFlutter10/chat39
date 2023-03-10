import 'package:bloc/bloc.dart';
import 'package:chat39/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cubitt_account_state.dart';

class tAccountCubit extends Cubit<tAccountState> {
  tAccountCubit() : super(tAccountInitial());
  static tAccountCubit get(context) => BlocProvider.of(context);
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store =FirebaseFirestore.instance;
 UserModel registerUser =UserModel();
  registerByEmailAndPassword(String e,
      String p, String name) async {
    UserCredential credential =
        await auth.createUserWithEmailAndPassword(
            email: e, password: p);
    emit(RegisterByEmailAndPasswordState());
    registerUser.name= name;
    registerUser.email=e;
    registerUser.password =p;
    registerUser.id= credential.user!.uid;
    await store.collection("Users").doc(registerUser.id).
    set(registerUser.toJson());
    emit(RegisterByEmailAndPasswordSaveState());
  }



}
