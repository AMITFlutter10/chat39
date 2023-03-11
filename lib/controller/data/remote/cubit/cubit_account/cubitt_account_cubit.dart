import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chat39/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'cubitt_account_state.dart';

class tAccountCubit extends Cubit<tAccountState> {
  tAccountCubit() : super(tAccountInitial());
  static tAccountCubit get(context) => BlocProvider.of(context);
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store =FirebaseFirestore.instance;
  FirebaseStorage storage =FirebaseStorage.instance;
  UserModel registerUser =UserModel();
  ImagePicker imagePicker =ImagePicker();
  GoogleSignIn googleSignIn =GoogleSignIn();
  XFile? userImage;
  image(String camera)async {
    try {
      if (camera == "cam") {
        userImage = await imagePicker.pickImage(
            source: ImageSource.camera);
           storage.ref().child("${registerUser.id}").putFile(File(userImage!.path));
        emit(SelectPhotoState());
        registerUser.photo =   await storage.ref().child("images/")
            .child("${registerUser.id}").getDownloadURL();
        print( registerUser.photo);
        return userImage!.readAsBytes();
      } else if (camera == "gallery") {
        userImage = await imagePicker.pickImage(
            source: ImageSource.gallery);
        await storage.ref().child("images/")
            .child("image.png").putFile(File(userImage!.path));
        emit(SelectPhotoState());
      }
    } catch (error) {
      print(error);
    }
  }

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
    await storage.ref().child("images/").child("${registerUser.id}.png}")
        .putFile(File(userImage!.path));
    registerUser.photo=  await storage.ref().child("images/").child("${registerUser.id}.png}")
        .getDownloadURL();
    await store.collection("Users").doc(registerUser.id).
    set(registerUser.toJson());
    emit(RegisterByEmailAndPasswordSaveState());
  }

  loginByEmailAndPassword(String e,
      String p,) async {
    UserCredential credential =
    await auth.signInWithEmailAndPassword(
        email: e, password: p);
    emit(LoginByEmailAndPasswordState());
    var dataUsers= await store.collection("Users").doc(credential.
    user!.uid).
    get();
    registerUser= UserModel.fromJson(dataUsers.data()!);
    emit(LoginByEmailAndPasswordSaveState());
  }

 singInByGoogle()async{
 await googleSignIn.signOut();
 GoogleSignInAccount? googleSignInAccount= await googleSignIn.signIn();
 GoogleSignInAuthentication? googleSignInAuthentication =
    await googleSignInAccount!.authentication;
  AuthCredential userCredential =
     GoogleAuthProvider.credential(
       idToken: googleSignInAuthentication.idToken,
       accessToken: googleSignInAuthentication.accessToken,);
     var user=  await auth.signInWithCredential(userCredential);
       registerUser.id =user.user!.uid;
       registerUser.name=googleSignInAccount.displayName;
       registerUser.email=googleSignInAccount.email;
       registerUser.photo=googleSignInAccount.photoUrl;
       await store.collection("Users").doc(registerUser.id)
           .set(registerUser.toJson());
       emit(GoogleByEmailAndPasswordSaveState());

  }




}
