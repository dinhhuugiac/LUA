import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_event.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_state.dart';
import 'package:lua_v3/screens/login_pages/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountState()) {
    on<ChosseAccountEvent>(_chosseAccountEvent);
    on<LogoutAccountEvent>(_logoutAccountEvent);
  }

  FutureOr<void> _chosseAccountEvent(
      ChosseAccountEvent event, Emitter<AccountState> emit) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var accessToken = sharedPreferences.getString('accessToken');
    final inforUser = RestClient(Dio(BaseOptions(
        contentType: 'multipart/form-data',
        headers: {'Authorization': 'Bearer $accessToken '})));

    emit(state.copyWith(status: AccountStatus.loading));

    try {
      await inforUser.getInfoUser().then((value) => {
            if (value.status_code == 200)
              {
                emit(state.copyWith(
                    status: AccountStatus.success,
                    message: value.message,
                    userDetail: value.userDetail))
              }
            else
              {
                emit(state.copyWith(
                    status: AccountStatus.error, message: value.message))
              }
          });
    } catch (e) {
      emit(state.copyWith(status: AccountStatus.error, message: e.toString()));
    }
  }

  FutureOr<void> _logoutAccountEvent(
    
      LogoutAccountEvent event, Emitter<AccountState> emit) async {
        print('ahihiihihi');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    try {
      await sharedPreferences.remove('accessToken');
      emit(state.copyWith(status: AccountStatus.logoutsuccsess));
    } catch (e) {
      print(e.toString());
    }
  }
}
