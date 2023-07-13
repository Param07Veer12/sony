part of 'otp_screen.dart';

class _OtpWidget extends StatelessWidget {
   _OtpWidget({Key? key}) : super(key: key);
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpScreenBloc,OtpScreenState>(
   //   buildWhen:(previous, current) => previous.otp!=current.otp ,
      builder:(context,state){
        return PinPut(

          textStyle: const TextStyle(fontSize: 22, color: Colors.black),
          // obscureText: '●',
          fieldsCount: 6,
          mainAxisSize: MainAxisSize.min,
          focusNode: _pinPutFocusNode,
          submittedFieldDecoration: _pinPutDecoration,
          selectedFieldDecoration: _pinPutDecoration,
          followingFieldDecoration: _unSelectedDecoration,
          eachFieldMargin: const EdgeInsets.only(left: 5, right: 5),
          keyboardType: const TextInputType.numberWithOptions(signed: true),
          eachFieldHeight: 30,
          eachFieldWidth: 30,
          onChanged: (otp)=>
         context.read<OtpScreenBloc>().onOtpChange(otp),
          textInputAction: TextInputAction.done,

          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],

        );
      }
    );
  }
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(color: themeColor)

     // border: Border(left: 1.0)
    );
  }
    BoxDecoration get _unSelectedDecoration {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(color: Colors.grey)

     // border: Border(left: 1.0)
    );
  }
}


class OtpErrorWidget extends StatelessWidget {
  const OtpErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text("OTP should contain six characters",style: TextStyle(color: Colors.red),));
  }
}

