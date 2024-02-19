import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [CustomAppBar()],
          ),
        ),
      ),
    );
  }
}


