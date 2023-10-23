import 'package:app_ft_expense/src/api/repositories/get/get_transaction_response.dart';
import 'package:app_ft_expense/src/api/repositories/post/post_add_balance_body.dart';
import 'package:app_ft_expense/src/api/repositories/post/post_create_transaction_body.dart';
import 'package:app_ft_expense/src/api/repositories/post/post_register_body.dart';
import 'package:app_ft_expense/src/api/repositories/post/post_signin_body.dart';
import 'package:app_ft_expense/src/api/repositories/post/post_signin_response.dart';
import 'package:app_ft_expense/src/api/repositories/put/put_update_transaction_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/config.dart';
import '../repositories/get/get_balance_response.dart';
import '../repositories/get/get_categories_response.dart';
import '../repositories/get/get_sum_type_transaction_response.dart';
part 'service.g.dart';

@RestApi(baseUrl: GlobalData.baseUrl)
abstract class Services {
  factory Services(Dio dio, {String baseUrl}) = _Services;
  @POST("/api/auth/register")
  Future postRegister({@Body() required PostRegisterBody body});

  @POST("/api/auth/signin")
  Future<PostSigninResponse> postSignIn({@Body() required PostSigninBody body});

  @GET("/api/v1/transaction")
  Future<GetTransactionResponse> getTransaction();

  @POST("/api/v1/transaction")
  Future postCreateTransaction({@Body() required PostCreateTransactionBody body});

  @PUT("/api/v1/transaction")
  Future putUpdateTransaction({@Body() required PutUpdateTransactionBody body});

  @DELETE("/api/v1/transaction/{id}")
  Future deleteTransaction({@Path() required String id});

  @POST("/api/v1/balance")
  Future postCreateBalance({@Body() required PostAddBalanceBody body});

  @GET("/api/v1/categories")
  Future<GetCategoriesResponse>getCategories();

  @GET("/api/v1/balance")
  Future<GetBalanceResponse>getBalance();

  @GET("/api/v1/transaction/sum")
  Future<GetSumTypeTransactionResponse>getSumTypeTransactionResponse();





}
