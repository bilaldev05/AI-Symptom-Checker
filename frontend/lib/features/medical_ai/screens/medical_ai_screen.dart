import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../models/medical_response_model.dart';
import '../services/medical_api_service.dart';

class MedicalAiScreen extends StatefulWidget {
  const MedicalAiScreen({super.key});

  @override
  State<MedicalAiScreen> createState() =>
      _MedicalAiScreenState();
}

class _MedicalAiScreenState
    extends State<MedicalAiScreen> {

  final TextEditingController symptomsController =
      TextEditingController();

  final MedicalApiService api =
      MedicalApiService();

  bool isLoading = false;

  MedicalResponseModel? result;

  String? error;

  Future<void> analyzeSymptoms() async {

    FocusScope.of(context).unfocus();

    if (symptomsController.text.trim().isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter symptoms",
          ),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
      error = null;
      result = null;
    });

    try {

      final response =
          await api.analyzeSymptoms(
        symptomsController.text.trim(),
      );

      setState(() {
        result = response;
      });

    } catch (e) {

      setState(() {
        error = e.toString();
      });

    } finally {

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "AI Medical Assistant",
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                      BorderRadius.circular(28),
                ),

                child: const Row(
                  children: [

                    Icon(
                      Icons.health_and_safety,
                      color: Colors.white,
                      size: 40,
                    ),

                    SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            "AI Symptom Checker",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 6),

                          Text(
                            "Describe your symptoms and get AI-generated medical guidance.",
                            style: TextStyle(
                              color: Colors.white70,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Symptoms",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: symptomsController,
                maxLines: 6,

                decoration: const InputDecoration(
                  hintText:
                      "Example:\nFever, headache, fatigue, sore throat...",
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 56,

                child: ElevatedButton(
                  onPressed:
                      isLoading
                          ? null
                          : analyzeSymptoms,

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primary,

                    foregroundColor:
                        Colors.white,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        18,
                      ),
                    ),
                  ),

                  child:
                      isLoading
                          ? const SizedBox(
                            height: 24,
                            width: 24,

                            child:
                                CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                          : const Text(
                            "Analyze Symptoms",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                ),
              ),

              const SizedBox(height: 30),

              if (error != null)
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color:
                        Colors.red.withOpacity(0.1),

                    borderRadius:
                        BorderRadius.circular(20),
                  ),

                  child: Text(
                    error!,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),

              if (result != null)
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(24),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.04),

                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Row(
                        children: const [

                          Icon(
                            Icons.auto_awesome,
                            color: AppColors.primary,
                          ),

                          SizedBox(width: 10),

                          Text(
                            "AI Analysis",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Text(
                        result!.response,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.8,
                          color:
                              AppColors.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 24),

                      Container(
                        padding:
                            const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: Colors.orange
                              .withOpacity(0.08),

                          borderRadius:
                              BorderRadius.circular(
                            16,
                          ),
                        ),

                        child: const Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            Icon(
                              Icons.warning_amber,
                              color: Colors.orange,
                            ),

                            SizedBox(width: 12),

                            Expanded(
                              child: Text(
                                "This is not a medical diagnosis. Please consult a healthcare professional.",
                                style: TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}