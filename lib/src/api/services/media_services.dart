import 'package:app_ft_expense/src/core/config.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'media_services.g.dart';

@RestApi(baseUrl: GlobalData.baseUrl)
abstract class MediaServices {
  factory MediaServices(Dio dio, {String baseUrl}) = _MediaServices;

  @POST("/api/auth/users/avatar")
  @MultiPart()
  Future uploadFile(@Part(name: 'image') MultipartFile image);
}
