

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PlatformAdmin{

  //int iAndroid_Platform = 0;
  //int iIOS_Platform = 1;
  //int iWeb_Platform = 2;
  double dScreen_Width = 0;
  double dScreen_Height = 0;
  late BuildContext context;

  PlatformAdmin();

  void initDisplayData(BuildContext context) {
    this.context=context;
    dScreen_Height=MediaQuery.of(context).size.width;
    dScreen_Width=MediaQuery.of(context).size.height;
  }


  bool isAndroidPlatform() {
    return defaultTargetPlatform == TargetPlatform.android;
  }
  bool isIOSPlatform() {
    return defaultTargetPlatform == TargetPlatform.iOS;
  }
  bool isWebPlatform() {
    return defaultTargetPlatform != TargetPlatform.android
    && defaultTargetPlatform != TargetPlatform.iOS;
  }

}