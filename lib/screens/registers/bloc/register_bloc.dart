import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lua_v3/screens/login_pages/api.dart';
import 'package:lua_v3/screens/registers/bloc/register_event.dart';
import 'package:lua_v3/screens/registers/bloc/register_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<SubmitRegisterEvent>(_submitRegisterEvent);
  }
  FutureOr<void> _submitRegisterEvent(
      SubmitRegisterEvent event, Emitter<RegisterState> emit) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var accessToken = sharedPreferences.getString('accessToken');
    final response = RestClient(Dio(BaseOptions(
        contentType: 'multipart/form-data',
        headers: {'Authorization': 'Bearer $accessToken '})));

    try {
      FormData formData;

      if (event.userDetail?.avatar != null &&
          event.userDetail!.avatar!.isNotEmpty &&
          event.userDetail!.avatar!.contains('/data/user/')) {
        formData = FormData.fromMap({
          'phone_number': event.userDetail?.phone_number ?? '',
          'avatar': event.userDetail?.avatar != null
              ? await MultipartFile.fromFile(event.userDetail!.avatar!)
              : null,
          'gender': event.userDetail?.gender ?? '',
          'address': event.userDetail?.address ?? '',
          'full_name': event.userDetail?.full_name ?? '',
        });
      } else {
        formData = FormData.fromMap({
          'phone_number': event.userDetail?.phone_number ?? '',
          'gender': event.userDetail?.gender ?? '',
          'address': event.userDetail?.address ?? '',
          'full_name': event.userDetail?.full_name ?? '',
        });
      }

      await response.updateInfoUser(formData).then((value) async {
        if (value.statusCode == 200) {
          emit(RegistelStatelSuccess(
            messager: value.message,
          ));
        } else if (value.statusCode == 401) {
          emit(RegistelStateFail(messager: value.message));
          print("Status code: 401");
        }
      });
    } catch (error) {
      print(error);
    }
  }
}
