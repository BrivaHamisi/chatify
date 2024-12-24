import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SnackbarService {
  late BuildContext _buildContext;

  static SnackbarService instance = SnackbarService();

  SnackbarService() {}

  set buildContext(BuildContext _context) {
    _buildContext = _context;
  }

  void showSnackError(String _message) {
    ScaffoldMessenger.of(_buildContext).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(
          _message,
          style: const TextStyle(color: Colors.red, fontSize: 15),
        ),
      ),
    );
  }

  void showSnackSuccess(String _message) {
    ScaffoldMessenger.of(_buildContext).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(
          _message,
          style: const TextStyle(color: Colors.green, fontSize: 15),
        ),
      ),
    );
  }
}
