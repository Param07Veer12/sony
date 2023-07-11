import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
on push :
Navigator.of(context)
                .push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) => PopUpView(popUpTitle: "alert msg",)));
 */

class PopUpView extends StatefulWidget {
  final popUpTitle;
  final VoidCallback voidCallback;
  const PopUpView({Key? key, this.popUpTitle,required this.voidCallback}) : super(key: key);

  @override
  _PopUpViewState createState() => _PopUpViewState();
}

class _PopUpViewState extends State<PopUpView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() async =>false,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(.7),
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Center(
                child: Container(
                  height: 250,
                  width: 340,
                  color: Colors.transparent,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/images/Popup.png"),
                      Positioned(
                        top: 85,
                          left: 0,
                          child: Container(
                            width: 340,

                              color: Colors.transparent,
                              child: Center(child: Text(widget.popUpTitle, textAlign: TextAlign.center, style: GoogleFonts.lato(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600)))
                          )
                      ),
                      Positioned(
                          bottom: 45,
                          left: (340/2)-60,
                          child: GestureDetector(
                            onTap:widget.voidCallback ,
                            child: Container(
                                width: 120,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(23),
                                  color: Colors.green,
                                ),
                                child: Center(child: Text("Ok", style: GoogleFonts.lato(color: Colors.white, fontSize: 18),))
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





class PopUpAlert extends StatefulWidget {
  final popUpTitle;
  final VoidCallback onTapYes;
  final VoidCallback onTapNo;
  const PopUpAlert({Key? key, this.popUpTitle,required this.onTapYes,required this.onTapNo}) : super(key: key);

  @override
  _PopUpAlertState createState() => _PopUpAlertState();
}

class _PopUpAlertState extends State<PopUpAlert> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() async =>false,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(.7),
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Center(
                child: Container(
                  height: 250,
                  width: 340,
                  color: Colors.transparent,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/pop_up/Popup.png"),
                      Positioned(
                          top: 85,
                          left: 0,
                          child: Container(
                              width: 340,
                              height: 50,
                              color: Colors.transparent,
                              child: Center(child: Text(widget.popUpTitle, textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis, style: GoogleFonts.lato(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600)))
                          )
                      ),
                     Positioned(
                         bottom: 45,
                         left: 20,
                         child: GestureDetector(
                           onTap:widget.onTapNo ,
                           child: Container(
                               width: 120,
                               height: 45,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(23),
                                 color: Colors.red,
                               ),
                               child: Center(child: Text("NO", style: GoogleFonts.lato(color: Colors.white, fontSize: 18),))
                           ),
                         )
                     ),
                     Positioned(
                         bottom: 45,
                         right: 20,
                         child: GestureDetector(
                           onTap:widget.onTapYes ,
                           child: Container(
                               width: 120,
                               height: 45,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(23),
                                 color: Colors.green,
                               ),
                               child: Center(child: Text("YES", style: GoogleFonts.lato(color: Colors.white, fontSize: 18),))
                           ),
                         )
                     )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}