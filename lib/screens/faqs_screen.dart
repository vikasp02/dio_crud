import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio_crud/view_models/faqs_view_model.dart';

class FaqsScreen extends StatefulWidget {
  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FaqsViewModel>(context, listen: false).fetchFaqs();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FaqsViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('FAQs')),
      body:
          viewModel.isLoading
              ? Center(child: CircularProgressIndicator())
              : viewModel.errorMessage != null
              ? Center(child: Text(viewModel.errorMessage!))
              : ListView.builder(
                itemCount: viewModel.faqs.length,
                itemBuilder: (context, index) {
                  final faq = viewModel.faqs[index];
                  return ListTile(
                    title: Text(faq.question ?? 'No question'),
                    subtitle: Text(faq.answer ?? 'No answer'),
                    trailing: Text(
                      faq.createdAt?.toLocal().toString().split(' ').first ??
                          '',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  );
                },
              ),
    );
  }
}
