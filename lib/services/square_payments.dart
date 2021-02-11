// import 'package:barcode_scanner_v3/shared/payments_repository.dart';
// import 'package:square_in_app_payments/in_app_payments.dart';
// import 'package:square_in_app_payments/models.dart';

// void payment() async {
//   await InAppPayments.setSquareApplicationId(
//       'sandbox-sq0idb-yDXf7ELT4m4n-SWfQLaYkw');
//   await InAppPayments.startCardEntryFlow(
//       onCardNonceRequestSuccess: (CardDetails result) async {
//         try {
//           print('success');
//           // take payment with the card nonce details
//           // you can take a charge
//           // await chargeCard(result);

//           // payment finished successfully
//           // you must call this method to close card entry
//           var chargeResults =
//               PaymentRepository.actuallyMakeTheCharge(result.nonce);
//           if (chargeResults != 'Success!') throw new StateError(chargeResults);
//           InAppPayments.completeCardEntry(
//               onCardEntryComplete: () => print('yay'));
//         } catch (ex) {
//           // print('problems');
//           // payment failed to complete due to error
//           // notify card entry to show processing error
//           InAppPayments.showCardNonceProcessingError(ex.toString());
//         }
//       },
//       onCardEntryCancel: () {});
// }
