
import 'package:equatable/equatable.dart';
import 'package:lua_v3/models/user_detail.dart';

class UpdateEvent extends Equatable{
  UpdateEvent () ;
  @override
  // TODO: implement props
  List<Object?> get props => [];
  get userDetail => null;
}

class UpdateInforEvent extends UpdateEvent {
  @override
  final UserDetail? userDetail;

  UpdateInforEvent({
    required this.userDetail,
  });

  @override
  List<Object?> get props => [userDetail];
}
