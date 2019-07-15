import 'package:flutter/material.dart';

class userRegisterView extends StatefulWidget {
    const userRegisterView({ Key key }) : super(key: key);

    @override
    _userRegitserViewerState createState() => _userRegitserViewerState();
}

class _userRegitserViewerState extends State<userRegisterView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final screenSize = MediaQuery.of(context).size;
    final containerSize = Size(260.0, 500.0);
    return Offstage(offstage:false,//offstage控制child是否无效
      child:
      Stack(
        alignment: const Alignment(0.0, 0.6),
        children: <Widget>[
          Opacity(
              opacity: 0.5,
              child: Container(
                width: screenSize.width/1.0,
                height: screenSize.height/1.0,
                decoration: BoxDecoration(color: Colors.black38 ),
              )
          ),
          Center(
            child: Opacity(
              opacity: 0.5,
              child:Card(
                elevation: 20,
                child: Container(
                  color: Colors.indigo,
                  width: containerSize.width,
                  height: containerSize.height,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(top:15.0, left: 15),
              alignment: Alignment.topLeft,//子控件靠左上角
              width: containerSize.width,
              height: containerSize.height,

              child: Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("手机号", style:TextStyle(color: Colors.white, fontSize: 16)),
                      new TextField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )
                  ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("验证码", style:TextStyle(color: Colors.white, fontSize: 16)),
                        new TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ])
                ],
              ),
            )
          ),
        ],
      )
    );
  }


}