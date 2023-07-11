class NetworkResponse {void onHTTPResponse({required int requestCode,required String response,}){}
  void onHTTPError({required int requestCode,required String response,}){}
void onNoInternetAndServerError({required String message}){}
}
