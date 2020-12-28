import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:core';

class ConfirmValueValidator extends FieldValidator<String> {
  final GlobalKey<FormFieldState> referenceFieldKey;
  ConfirmValueValidator(this.referenceFieldKey, {String errorText})
      : super(errorText);

  @override
  bool isValid(String value) {
    String referenceValue = referenceFieldKey.currentState.value;
    return value == referenceValue;
  }
}
