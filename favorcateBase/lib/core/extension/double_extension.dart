import 'package:favorcate/core/extension/size_fit.dart';

extension DoubleFit on double{

  double get px {
    return ZSHSizeFit.setPx(this);
  }

  double get rpx {
    return ZSHSizeFit.setRpx(this);
  }


}


