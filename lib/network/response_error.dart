class ResponseError implements Exception {
  final String message;

  const ResponseError([this.message = "Unknown error occurred."]);

  factory ResponseError.fromStatus(String statusCode, String errorMessage) {
    switch (statusCode) {
      case "E":
        return ResponseError(errorMessage);
      default:
        return const ResponseError();
    }
  }}