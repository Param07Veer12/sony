import 'package:flutter/material.dart';

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        style: BorderStyle.solid,
        color: Colors.grey
        
      ),
      borderRadius: BorderRadius.circular(10));
}