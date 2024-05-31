import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lua_v3/models/user_detail.dart';

import 'package:lua_v3/screens/login_pages/api.dart';

import 'package:lua_v3/screens/login_pages/bloc/login_event.dart';
import 'package:lua_v3/screens/login_pages/bloc/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<HandleGoogleSignInEvent>(_handleGoogleSignInEvent);
  }

  Future<void> _handleGoogleSignInEvent(
      HandleGoogleSignInEvent event, Emitter<LoginState> emit) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var idToken = await signInWithGoogle();
    String? userEmail;

    final apiToken = RestClient(Dio());
    try {
      if (idToken != null) {
        GoogleSignIn googleSignIn = GoogleSignIn();
        GoogleSignInAccount? googleUser = await googleSignIn.signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        if (googleUser?.email != null) {
          userEmail = googleUser?.email;
          print('email: $userEmail');
          String? idToken = googleAuth?.idToken ?? '';
          print('token :  $idToken');
        }

        googleSignIn.signOut();

        await apiToken.verifyToken({
          "token": idToken,
          "provider": "google",
          "device_id": "123"
        }).then((value) async {
          if (value.statusCode == 200) {
            String? userToken = value.userData!.token;
            await sharedPreferences.setString('accessToken', userToken!);
            print(userToken);
            emit(LoginSuccessState(
                messager: value.message,
                email: userEmail!,
                userDetail: value.userData?.info ?? UserDetail()));
          } else if (value.statusCode == 403) {
            emit(LoginFailState(messager: value.message));
          } else
            (emit(LoginLoadingState()));
        });
      }
    } catch (error) {
      print('error $error');
    }
  }

  signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleUser?.email != null) {
        String? userEmail = googleUser?.email;
        print('email: $userEmail');
        String? idToken = googleAuth?.idToken ?? '';
        print('token :  $idToken');
        return idToken;
      }
    } catch (errors) {
      print(errors);
      emit(LoginErrorState(errorMessage: errors.toString()));
    }
  }
}
