import 'package:form_field_validator/form_field_validator.dart';

class DoubleValidator extends FieldValidator<String> {
  DoubleValidator({String errorText}) : super(errorText);

  @override
  bool isValid(String value) {
    double doubleValue = double.tryParse(value);
    if (doubleValue == null || doubleValue.isNaN || doubleValue.isInfinite) {
      return false;
    }
    return true;
  }
}
