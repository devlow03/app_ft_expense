import 'dart:io';

import 'package:app_ft_expense/src/core/config.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'media_services.g.dart';

@RestApi(baseUrl: GlobalData.baseUrl)
abstract class MediaServices {
  factory MediaServices(Dio dio, {String baseUrl}) = _MediaServices;
  @POST('/api/auth/users/avatar')
  @MultiPart()
  Future uploadImage(@Part() File image);
}