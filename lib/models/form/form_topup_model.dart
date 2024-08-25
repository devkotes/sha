class FormTopupModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  FormTopupModel({
    this.amount,
    this.pin,
    this.paymentMethodCode,
  });

  FormTopupModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) =>
      FormTopupModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'payment_method_code': paymentMethodCode,
      };
}
