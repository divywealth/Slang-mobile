String? isEmpty(String? value, String errorMessage) {
  if(value == null || value.isEmpty) {
    return errorMessage;
  }
  return null;
}

String? isValidPassword(String? value, String errorMessage1, String errorMessage2){
  if (value == null || value.isEmpty) {
    return errorMessage1;
  }else if(value.length < 6) {
    return errorMessage2;
  };
  return null;
}
