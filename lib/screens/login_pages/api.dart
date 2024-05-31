import 'package:dio/dio.dart';
import 'package:lua_v3/models/coach_detail_model.dart';
import 'package:lua_v3/models/respone_update.dart';
import 'package:lua_v3/models/subscription_course.dart';
import 'package:lua_v3/models/topic_model.dart';
import 'package:lua_v3/models/topic_update_model.dart';

import 'package:lua_v3/models/user_detail_model.dart';
import 'package:lua_v3/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://api.lua.cydeva.tech')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/api/v1/auth/mb/login/social/')
  Future<UserModel> verifyToken(@Body() Map<String, dynamic> body);

  @GET('/api/v1/auth/mb/user/favorite/content/list/')
  Future<TopicModel> getTopic();
  @PUT('/api/v1/auth/mb/user/update/')
  Future<ResponUpdate> updateInfoUser(@Body() FormData mapData);
  @POST('/api/v1/auth/mb/user/favorite/content/update/')
  Future<TopicUpdateModel> updateTopicList(
      @Body() Map<String, dynamic> mapJson);
  @GET('/api/v1/auth/mb/user/detail/')
  Future<UserDetailModel> getInfoUser();
  @GET('/api/v1/auth/mb/subscription/list/')
  Future<DescribeCourse> getDescribeCourse();
  @GET('/api/v1/home/mb/lecturer/popular/')
  Future<CoachDetailModel> getInfoCoach();
}
