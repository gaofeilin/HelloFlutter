
import 'package:favorcate/core/extension/size_fit.dart';

extension IntFit on int {
  double get px {
    return ZSHSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return ZSHSizeFit.setRpx(this.toDouble());
  }
}
