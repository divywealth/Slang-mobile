
import 'package:flutter/material.dart';

InputDecoration authInputDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black),
    borderRadius: BorderRadius.circular(15)
  ),
  border: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF096a09)),
      borderRadius: BorderRadius.circular(15)
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(15),
  ),
  errorMaxLines: 1,
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  errorStyle: TextStyle(
    color: Colors.red,
  ),
);