import 'package:dio_crud/models/faqs_model.dart';
import 'package:flutter/material.dart';
import 'package:dio_crud/api_services/api_service.dart';

class FaqsViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  List<Faq> faqs = [];
  Future<void> fetchFaqs() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await ApiService().getFaqs();

      if (response != null) {
        final faqsModel = Faqs.fromJson(response);
        faqs = faqsModel.faqs ?? [];
      } else {
        errorMessage = "Failed to load FAQs.";
      }
    } catch (e) {
      errorMessage = "An error occurred: $e";
    }

    isLoading = false;
    notifyListeners();
  }
}
