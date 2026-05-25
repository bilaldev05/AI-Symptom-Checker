import 'package:dio/dio.dart';

import '../models/medical_response_model.dart';

class MedicalApiService {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://127.0.0.1:8000/api/v1",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  Future<MedicalResponseModel> analyzeSymptoms(
    String symptoms,
  ) async {

    try {

      final response = await dio.post(
        "/medical/analyze",
        data: {
          "symptoms": symptoms,
        },
      );

      return MedicalResponseModel.fromJson(
        response.data,
      );

    } on DioException catch (e) {

      throw Exception(
        e.response?.data.toString() ??
            "Server Error",
      );
    }
  }
}