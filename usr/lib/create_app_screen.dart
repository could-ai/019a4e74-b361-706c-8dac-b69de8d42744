import 'package:flutter/material.dart';

class CreateAppScreen extends StatefulWidget {
  const CreateAppScreen({super.key});

  @override
  State<CreateAppScreen> createState() => _CreateAppScreenState();
}

class _CreateAppScreenState extends State<CreateAppScreen> {
  final _formKey = GlobalKey<FormState>();
  String _appName = '';
  String _appDescription = '';
  String _appUrl = '';

  void _publishApp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here you would typically handle the app publishing logic,
      // like saving it to a database.
      // For now, we'll just pop the screen and maybe show a snackbar.
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('App "$_appName" published!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publish New App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'App Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an app name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _appName = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'App Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _appDescription = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'App URL (e.g., GitHub repo, download link)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an app URL';
                  }
                  if (!(Uri.tryParse(value)?.isAbsolute ?? false)) {
                    return 'Please enter a valid URL';
                  }
                  return null;
                },
                onSaved: (value) {
                  _appUrl = value!;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _publishApp,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Publish App'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
