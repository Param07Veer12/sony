import 'package:flutter/material.dart';

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderSide:  BorderSide(
        width: 1,
        style: BorderStyle.solid,
        color: Colors.grey.shade300
        
      ),
      borderRadius: BorderRadius.circular(10));
}