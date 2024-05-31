import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lua_v3/screens/login_pages/api.dart';

import 'package:lua_v3/screens/update_pages/bloc/update_event.dart';
import 'package:lua_v3/screens/update_pages/bloc/update_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateState()) {
    on<UpdateInforEvent>(_updateInfor);
  }
  FutureOr<void> _updateInfor(
      UpdateEvent event, Emitter<UpdateState> emit) async {
        emit(state.copyWith(status: UpdateStatus.submit));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var accessToken = sharedPreferences.getString('accessToken');
    print(' token  :    $accessToken');
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
          emit(state.copyWith(status: UpdateStatus.success,
            messager: value.message,
          ));
        } else if (value.statusCode == 401) {
          emit(state.copyWith(status: UpdateStatus.error ,messager:  value.message));
          print("Status code: 401");
        }
      });
    } catch (error) {
      print(error);
    }
  }
}
