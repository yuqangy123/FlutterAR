import 'package:flutter/material.dart';

class userRegisterView extends StatefulWidget {
    const userRegisterView({ Key key }) : super(key: key);

    @override
    _userRegitserViewerState createState() => _userRegitserViewerState();
}

class _userRegitserViewerState extends State<userRegisterView> {

  Widget phoneEdit()
  {
    return Container(
      height: 70,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("手机号", style:TextStyle(color: Colors.white, fontSize: 16)),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                helperStyle: TextStyle(fontSize: 40),
                //border: InputBorder.none,
                labelStyle: TextStyle( fontSize: 40, color: Colors.white,),
              ),
            )
          ]
      ),
    );
  }

  Widget authCodeEdit()
  {
    return Container(
      height: 70,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("验证码", style:TextStyle(color: Colors.white, fontSize: 16)),
            Stack(//组合widget,堆叠起来
              alignment : AlignmentDirectional(0.98, 0.0),
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    helperStyle: TextStyle(fontSize: 40),
                    labelStyle: TextStyle( fontSize: 40, color: Colors.white,),
                  ),
                ),
                SizedBox(
                  width: 82.0,
                  height: 34,
                  child: RaisedButton(
                    color: Colors.deepPurpleAccent,
                    textColor: Colors.amber,
                    child: Text('获取验证码', style:TextStyle(fontSize: 10)),
                    onPressed: (){},
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final screenSize = MediaQuery.of(context).size;
    final containerSize = Size(300.0, 500.0);
    return Offstage(offstage:true,//offstage控制child是否无效
      child:
      Stack(
        alignment: const Alignment(0.0, 0.6),
        children: <Widget>[
          Opacity(//底层屏蔽层
              opacity: 0.5,
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                decoration: BoxDecoration(color: Colors.black38 ),
              )
          ),
          Center(//中层背景块
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
          Center(//上次区域
            child: Container(
              padding: const EdgeInsets.only(top:15.0),
              alignment: Alignment.topLeft,//子控件靠左上角
              width: containerSize.width-50,
              height: containerSize.height-320,//布局控件的整块大小

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  phoneEdit(),
                  authCodeEdit(),
                ],
              ),
            )
          ),
        ],
      )
    );
  }


}