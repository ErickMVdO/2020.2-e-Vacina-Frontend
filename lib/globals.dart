import 'package:dio/dio.dart';
import 'package:e_vacina/controllers/userController.dart';
import 'package:e_vacina/controllers/vaccineController.dart';
import 'package:e_vacina/controllers/profileController.dart';
import 'package:e_vacina/services/api.dart';

UserController userController = new UserController();
ProfileController profileController = new ProfileController();
VaccineController vaccineController = new VaccineController();

Api api = new Api();

var options = BaseOptions(
  baseUrl: 'https://28b34824a95f.ngrok.io', //'https://6f7f2a7a5e77.ngrok.io',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

var dio = Dio(options);
