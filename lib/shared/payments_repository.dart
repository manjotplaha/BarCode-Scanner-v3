import 'dart:math';

class PaymentRepository {
  static Random _random = Random();
  static String actuallyMakeTheCharge(String nonce) {
    if (_random.nextBool()) {
      return 'Your Credit Card was Declined';
    }
    return 'Success!';
  }
}
