import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MoreInfo extends StatefulWidget {
  final double width;
  final String currentpage;
  const MoreInfo({ Key? key, required this.width, required this.currentpage}) : super(key: key);

  @override
  _MoreInfoState createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  
  @override
  void initState() {
    WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(115, 215, 255, 0.7),
      child: Row(
        children: [
          Expanded(
            child:  GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  SizedBox(width: widget.width*0.15,),
                  const Text("BACK",
                  textAlign: TextAlign.center,
                  style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontWeight: FontWeight.w300),),
                ],
              ),
            )),
            
          Expanded(
            child: Container(
              child:  WebView(
                  initialUrl: ('https://en.wikipedia.org/wiki/' + _wikipediapage(widget.currentpage)),
                  onProgress: (int progress) {
                  print('WebView is loading (progress : $progress%)');
          },
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
            ),
            )

        ],
      ),
    
    );
}

_wikipediapage(String name){
  if(name == "Mercury"){
    return "Mercury_(planet)";
  }
  else{
    return name;
  }
}
}