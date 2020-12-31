import 'dart:ui';


class ZSHSizeFit{

  static double physicalWidth;
  static double physicalHeight;
  static double screenWidth;
  static double screenHeight;
  static double dpr;
  static double statusHeight;
  static double saveArearHeight;
  static double rpx;//物理像素
  static double px;//像素

  static void initialize({double standardSize = 750}){

    //1。手机的物理像素
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2.获取dpr
    dpr = window.devicePixelRatio;

    // 3.逻辑宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    statusHeight = window.padding.top / dpr;

    saveArearHeight = window.padding.bottom / dpr;


    // 5.计算rpx大小
    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize *2;





    // statusHeight = MediaQuery.of(context).padding.top / dpr;
    // saveArearHeight = MediaQuery.of(context).padding.bottom / dpr;

  }


  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}