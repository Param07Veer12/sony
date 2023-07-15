



import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sony/network/web_urls.dart';
import 'package:sony/utils/common_widgets/constants.dart';

import '../utils/common_widgets/colors_used/colors_used.dart';
import 'network_response.dart';
import 'package:http/http.dart' as http;

class NetworkClass {
  String endUrl = "";
  late NetworkResponse networkResponse;
  int requestCode = 0;
  Map? jsonBody;
  AlertDialog? alertDialog;
  bool isShowing = false;
  String filePath = "";
 final EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();
    
  NetworkClass(String url, this.networkResponse, this.requestCode) {
    endUrl = url;
  }

  NetworkClass.fromNetworkClass(String url, this.networkResponse, this.requestCode, this.jsonBody) {
    endUrl = url;
  }

  NetworkClass.multipartNetworkClass(
    this.endUrl,
    this.networkResponse,
    this.requestCode,
    this.jsonBody,
  );

  Future<void> callGetService(BuildContext context, bool showLoader) async {
    try {
      if (showLoader) {
        isShowing = true;
        showLoaderDialog(context);
      }

      if (kDebugMode) {
        print("URL---->" + baseUrl + endUrl);
      }
      final response = await http.get(Uri.parse(baseUrl + endUrl));
      if (kDebugMode) {
        print("Response---->" + response.body.toString());
      }

      if (kDebugMode) {
        print("StatusCode---->" + response.statusCode.toString());
      }

      if (response.statusCode == 200) {
        if (showLoader) {
          if (alertDialog != null && isShowing) {
            isShowing = false;
            Navigator.pop(context);
          }
        }
        networkResponse.onHTTPResponse(
          requestCode: requestCode,
          response: response.body.toString(),
        );
      }
      // else if(response.statusCode == 401){
      //   if (showLoader) {
      //     if (alertDialog != null && isShowing) {
      //       isShowing = false;
      //       Navigator.pop(context);
      //     }
      //   }
      //   Navigator.of(context).push(PageRouteBuilder(
      //       opaque: false,
      //       pageBuilder: (BuildContext context, _, __) => PopUpView(
      //         popUpTitle: "Your session expired! login again",
      //         voidCallback: () {
      //           SharedPreferencesClass.prefs.clear();
      //           Navigator.pushAndRemoveUntil(
      //               context, MaterialPageRoute(builder: (context) => const SignInPage()), (route) => false);
      //         },
      //       )));
      // }
      else {
        if (showLoader) {
          if (alertDialog != null && isShowing) {
            isShowing = false;
            Navigator.pop(context);
          }
        }
        networkResponse.onHTTPError(requestCode: requestCode, response: response.body.toString());
      }
    } on SocketException catch (e) {
      Navigator.pop(context);
      switch (e.osError?.errorCode) {
        case 7:
          // commonAlert(context, 'No Internet Connection!');
          print("NO internet connection");
          break;
        case 111:
          //commonAlert(context, 'Unable to connect to server!');
          print("unable to connect to server");
          break;
      }
      print('Socket Exception thrown --> $e');
    } on TimeoutException catch (e) {
      Navigator.pop(context);
      // commonAlert(context, 'Please! Try Again');
      print('Please! Try Again');
      print('TimeoutException thrown --> $e');
    } catch (err) {
      Navigator.pop(context);
      print('Error While Making network call -> $err');
    }
  }

  Future<void> callPostService(BuildContext context, bool showLoader) async {
    try {
      if (showLoader) {
        isShowing = true;
        showLoaderDialog(context);
      }

      if (kDebugMode) {
        print("PostURLLL---->" + baseUrl + endUrl);
      }
      if (kDebugMode) {
        print("PostParams--->" + jsonBody.toString());
      }

      final response = await http.post(Uri.parse(baseUrl + endUrl), body: json.encode(jsonBody),headers:{ 'Content-Type': 'application/json' });

      if (kDebugMode) {
        print("PostResponse---->" + response.body.toString());
      }

      if (kDebugMode) {
        print("StatusCodePost---->" + response.statusCode.toString());
      }

      if (response.statusCode == 200) {
        if (showLoader) {
          if (alertDialog != null && isShowing) {
            isShowing = false;
            Navigator.pop(context);
          }
        }

        networkResponse.onHTTPResponse(requestCode: requestCode, response: response.body.toString());
      }
      // else if(response.statusCode == 401){
      //   if (showLoader) {
      //     if (alertDialog != null && isShowing) {
      //       isShowing = false;
      //       Navigator.pop(context);
      //     }
      //   }
      //   Navigator.of(context).push(PageRouteBuilder(
      //       opaque: false,
      //       pageBuilder: (BuildContext context, _, __) => PopUpView(
      //         popUpTitle: "Your session expired! login again",
      //         voidCallback: () {
      //           SharedPreferencesClass.prefs.clear();
      //           Navigator.pushAndRemoveUntil(
      //               context, MaterialPageRoute(builder: (context) => const SignInPage()), (route) => false);
      //         },
      //       )));
      // }
      else {
        if (alertDialog != null && isShowing) {
          isShowing = false;
          Navigator.pop(context);
        }
        networkResponse.onHTTPError(requestCode: requestCode, response: response.body.toString());
      }
    } on SocketException catch (e) {
      Navigator.pop(context);
      switch (e.osError?.errorCode) {
        case 7:
          //commonAlert(context, 'No Internet Connection!');

          networkResponse.onNoInternetAndServerError(message: "No Internet Connection!");
          break;
        case 111:
          networkResponse.onNoInternetAndServerError(message: "unable to connect to server");
          break;
      }
      print('Socket Exception thrown --> $e');
    } on TimeoutException catch (e) {
      Navigator.pop(context);
      //commonAlert(context, 'Please! Try Again');
      print("please try again");
      print('TimeoutException thrown --> $e');
    } catch (err) {
      Navigator.pop(context);
      print('Error While Making network call -> $err');
    }
  }

  Future<void> callGetServiceWithToken(BuildContext context, bool showLoader) async {
    try {
      if (showLoader) {
        isShowing = true;
        showLoaderDialog(context);
      }
      var token = "";
    encryptedSharedPreferences.getString(ACCESS_TOKEN).then((String value) async {
    token = "Bearer" + " " + value;

      if (kDebugMode) {
        print("URL-->" + baseUrl + endUrl + "token-->" + token);
      }

      final response = await http
          .get(Uri.parse(baseUrl + endUrl), headers: {'Content-Type': 'application/json', 'token': token});

      if (kDebugMode) {
        print("Response------->" + response.body.toString());
      }

      if (kDebugMode) {
        print("StatusCode--->> " + response.statusCode.toString());
      }

      if (response.statusCode == 200) {
        if (showLoader) {
          if (alertDialog != null && isShowing) {
            isShowing = false;
            Navigator.pop(context);
          }
        }
        networkResponse.onHTTPResponse(requestCode: requestCode, response: response.body.toString());
      }
      // else if(response.statusCode == 401){
      //   if (showLoader) {
      //     if (alertDialog != null && isShowing) {
      //       isShowing = false;
      //       Navigator.pop(context);
      //     }
      //   }
      //   Navigator.of(context).push(PageRouteBuilder(
      //       opaque: false,
      //       pageBuilder: (BuildContext context, _, __) => PopUpView(
      //         popUpTitle: "Your session expired! login again",
      //         voidCallback: () {
      //           SharedPreferencesClass.prefs.clear();
      //           Navigator.pushAndRemoveUntil(
      //               context, MaterialPageRoute(builder: (context) => const SignInPage()), (route) => false);
      //         },
      //       )));
      // }
      else {
        if (showLoader) {
          if (alertDialog != null && isShowing) {
            isShowing = false;
            Navigator.pop(context);
          }
        }
        networkResponse.onHTTPError(requestCode: requestCode, response: response.body.toString());
      }
    });
    } on SocketException catch (e) {
      Navigator.pop(context);
      switch (e.osError?.errorCode) {
        case 7:
          print('no internet connection');
          networkResponse.onNoInternetAndServerError(message: "no internet connection");
          break;
        case 111:
          print('Unable to connect to server!');

          break;
      }
      print('Socket Exception thrown -----> $e');
    } on TimeoutException catch (e) {
      Navigator.pop(context);
      //commonAlert(context, 'Please! Try Again');
      print('Please! Try Again');
      print('TimeoutException thrown --> $e');
    } catch (err) {
      print('Error While Making network call -> $err');
    }
  }

 Future<void> callPatchServiceToken(BuildContext context, bool showLoader, String id ) async {
    try {
      if (showLoader) {
        isShowing = true;
        showLoaderDialog(context);
      }
      var token = "";
    encryptedSharedPreferences.getString(ACCESS_TOKEN).then((String value) async {
    token = "Bearer" + " " + value;

      if (!kReleaseMode) print("PostURL---> ${baseUrl + endUrl + "/" + id} Token--> $token");
      if (!kReleaseMode) log("PostParams---->" + jsonBody.toString());

      final response = await http.patch(
          Uri.parse(
            baseUrl + endUrl + "/" + id,
          ),
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: jsonEncode(jsonBody));
        print(response); 
      if (!kReleaseMode) log("PostResponse --->" + response.body.toString());
      if (!kReleaseMode) print("StatusCode --->" + response.statusCode.toString());

      if (response.statusCode == 200) {
        if (showLoader) {
          if (alertDialog != null && isShowing) {
            isShowing = false;
            Navigator.pop(context);
          }
        }

        networkResponse.onHTTPResponse(requestCode: requestCode, response: response.body.toString());
      }
      else if(response.statusCode == 401){
        if (showLoader) {
          if (alertDialog != null && isShowing) {
            isShowing = false;
            Navigator.pop(context);
          }
        }
       
      }
      else {
        if (alertDialog != null && isShowing) {
          isShowing = false;
          Navigator.pop(context);
        }
        networkResponse.onHTTPError(requestCode: requestCode, response: response.body.toString());
      }
       }); 
    } on SocketException catch (e) {
      Navigator.pop(context);
      switch (e.osError?.errorCode) {
        case 7:
          //commonAlert(context, 'No Internet Connection!');
          print('no internet connection');
          networkResponse.onNoInternetAndServerError(message: "No Internet Connection!");
          break;
        case 111:
          //commonAlert(context, 'Unable to connect to server!');
          print('unable to connect to server');
          networkResponse.onNoInternetAndServerError(message: "Unable to connect to server!");
          break;
      }
      print('Socket Exception thrown --> $e');
    } on TimeoutException catch (e) {
      Navigator.pop(context);
      //commonAlert(context, 'Please! Try Again');
      print('Please tyr again ');
      print('TimeoutException thrown --> $e');
    } catch (err) {
      print('Error While Making network call -> $err');
    }
  }

  Future<void> callPostServiceToken(BuildContext context, bool showLoader) async {
    try {
      if (showLoader) {
        isShowing = true;
        showLoaderDialog(context);
      }
      var token = "";
    encryptedSharedPreferences.getString(ACCESS_TOKEN).then((String value) async {
    token = "Bearer" + " " + value;

      if (!kReleaseMode) print("PostURL---> ${baseUrl + endUrl} Token--> $token");
      if (!kReleaseMode) log("PostParams---->" + jsonBody.toString());

      final response = await http.post(
          Uri.parse(
            baseUrl + endUrl,
          ),
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: jsonEncode(jsonBody));
        print(response); 
      if (!kReleaseMode) log("PostResponse --->" + response.body.toString());
      if (!kReleaseMode) print("StatusCode --->" + response.statusCode.toString());

      if (response.statusCode == 200) {
        if (showLoader) {
          if (alertDialog != null && isShowing) {
            isShowing = false;
            Navigator.pop(context);
          }
        }

        networkResponse.onHTTPResponse(requestCode: requestCode, response: response.body.toString());
      }
      else if(response.statusCode == 401){
        if (showLoader) {
          if (alertDialog != null && isShowing) {
            isShowing = false;
            Navigator.pop(context);
          }
        }
       
      }
      else {
        if (alertDialog != null && isShowing) {
          isShowing = false;
          Navigator.pop(context);
        }
        networkResponse.onHTTPError(requestCode: requestCode, response: response.body.toString());
      }
       }); 
    } on SocketException catch (e) {
      Navigator.pop(context);
      switch (e.osError?.errorCode) {
        case 7:
          //commonAlert(context, 'No Internet Connection!');
          print('no internet connection');
          networkResponse.onNoInternetAndServerError(message: "No Internet Connection!");
          break;
        case 111:
          //commonAlert(context, 'Unable to connect to server!');
          print('unable to connect to server');
          networkResponse.onNoInternetAndServerError(message: "Unable to connect to server!");
          break;
      }
      print('Socket Exception thrown --> $e');
    } on TimeoutException catch (e) {
      Navigator.pop(context);
      //commonAlert(context, 'Please! Try Again');
      print('Please tyr again ');
      print('TimeoutException thrown --> $e');
    } catch (err) {
      print('Error While Making network call -> $err');
    }
  }

  Future<void> callMultipartPostServiceToken(BuildContext context, String myToken, bool showLoader,
      {required List<MultipartParamAndFilePath> listOfFiles}) async {
try{
  if (showLoader) {
    isShowing = true;
    showLoaderDialog(context);
  }

  log("PostURLLL--->" + baseUrl + endUrl + " Token---->" + myToken);
  log("PostParams--->" + jsonBody.toString());

  //List<MultipartParamAndFilePath> filesList = listOfFiles;
  print(listOfFiles.length);
  var request = http.MultipartRequest('POST', Uri.parse(baseUrl + endUrl));

  for (int i = 0; i < listOfFiles.length; i++) {

    request.files.add(await http.MultipartFile.fromPath(listOfFiles[i].parameter, listOfFiles[i].filePath));

    log("File parameter:--->" + listOfFiles[i].parameter);
    log("File path:--->" + listOfFiles[i].filePath);
    log("length of request files is------>${request.files.length}");
  }


  var headers = {
    'Content-Type': 'multipart/form-data',
    'Token': myToken,
    'Accept': '*/*',
    'Connection':'keep-alive'
  };
  request.headers.addAll(headers);

  request.fields.addAll(jsonBody as Map<String, String>);



  var response = await request.send();

  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  print("Requests--->" + request.toString());


  print("PostResponse----> " + responseString);
  print("StatusCodePost---->" + response.statusCode.toString());
  print("response after decode-----> ${jsonDecode(responseString)}");
  if (response.statusCode == 200) {
    if (showLoader) {
      if (alertDialog != null && isShowing) {
        isShowing = false;
        Navigator.pop(context);
      }
    }
    networkResponse.onHTTPResponse(requestCode: requestCode, response: responseString);
  }
  // else if(response.statusCode == 401){
  //   if (showLoader) {
  //     if (alertDialog != null && isShowing) {
  //       isShowing = false;
  //       Navigator.pop(context);
  //     }
  //   }
  //   Navigator.of(context).push(PageRouteBuilder(
  //       opaque: false,
  //       pageBuilder: (BuildContext context, _, __) => PopUpView(
  //         popUpTitle: "Your session expired! login again",
  //         voidCallback: () {
  //           SharedPreferencesClass.prefs.clear();
  //           Navigator.pushAndRemoveUntil(
  //               context, MaterialPageRoute(builder: (context) => const SignInPage()), (route) => false);
  //         },
  //       )));
  // }
  else {
    if (alertDialog != null && isShowing) {
      isShowing = false;
      Navigator.pop(context);
    }
    networkResponse.onHTTPError(requestCode: requestCode, response: responseString);
  }
} on SocketException catch (e) {
  Navigator.pop(context);
  switch (e.osError?.errorCode) {
    case 7:
    //commonAlert(context, 'No Internet Connection!');
      print('no internet connection');
      networkResponse.onNoInternetAndServerError(message: "No Internet Connection!");
      break;
    case 111:
    //commonAlert(context, 'Unable to connect to server!');
      print('unable to connect to server');
      networkResponse.onNoInternetAndServerError(message: "Unable to connect to server!");
      break;
  }
  print('Socket Exception thrown --> $e');
} on TimeoutException catch (e) {
  Navigator.pop(context);
  //commonAlert(context, 'Please! Try Again');
  print('Please tyr again ');
  print('TimeoutException thrown --> $e');
} catch (err) {
  print('Error While Making network call -> $err');
}
  }



  void showLoaderDialog(BuildContext context) {
    if (alertDialog != null && isShowing) {
      isShowing = false;
      Navigator.pop(context);
    }
    alertDialog = AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(themeColor)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0),
      context: context,
      builder: (BuildContext context) {
        return alertDialog!;
      },
    );
  }
}

class MultipartParamAndFilePath {
  final String parameter;
  final String filePath;

  const MultipartParamAndFilePath({required this.parameter, required this.filePath});
}