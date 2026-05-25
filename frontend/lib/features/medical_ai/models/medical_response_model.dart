class MedicalResponseModel {
  final bool success;
  final String response;

  MedicalResponseModel({
    required this.success,
    required this.response,
  });

  factory MedicalResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return MedicalResponseModel(
      success: json['success'],
      response: json['response'],
    );
  }
}