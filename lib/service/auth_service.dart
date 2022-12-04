import 'package:firebase_auth/firebase_auth.dart';

class  AuthService {
  final FirebaseAuth fireAuth = FirebaseAuth.instance;


  Future<bool> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var authResult = await fireAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // TODO: Create firestore user here and keep it locally.
      return authResult.user != null;
    } catch (e) {
      return false;
    }
  }

  // Future<bool> signUpWithEmail({
  //   required String name,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required String isAvailable,
  //
  // }) async {
  //   try {
  //     var authResult = await fireAuth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     String? token = await FirebaseMessaging.instance.getToken();
  //
  //     current =Client(authResult.user!.uid ,name, email, phone,token!);
  //     await firestore.createClient(current!);
  //     // TODO: Create firestore user here and keep it locally.
  //     return authResult.user != null;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Future<bool> isUserLoggedIn() async {
    User? user = await fireAuth.currentUser;
    if( user != null){
      return user!=null;
    }
    return user!=null;
  }

  String? getCurrentUid(){
    return  fireAuth.currentUser?.uid;
  }


}
