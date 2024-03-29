import 'package:dartz/dartz.dart';
import 'package:flutter_ecatalog/data/models/request/login_request_model.dart';
import 'package:flutter_ecatalog/data/models/request/register_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/login_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/response/register_response_model.dart';

class AuthDataSource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel model) async {
    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/users/'),
      body: model.toJson(),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      print(response.body);
      return Right(RegisterResponseModel.fromJson(response.body));
    } else {
      print(response.body);

      return const Left('Register Gagal');
    }
  }

  Future<Either<String, LoginResponseModel>> login(
      LoginRequestModel model) async {
    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/auth/login'),
      body: model.toJson(),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      print(response.body);
      return Right(LoginResponseModel.fromJson(response.body));
    } else {
      print(response.body);

      return const Left('Login Gagal');
    }
  }
}
