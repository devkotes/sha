class FormTransferModel {
  final String? amount;
  final String? pin;
  final String? sendTo;

  FormTransferModel({
    this.amount,
    this.pin,
    this.sendTo,
  });

  FormTransferModel copyWith({
    String? amount,
    String? pin,
    String? sendTo,
  }) =>
      FormTransferModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        sendTo: sendTo ?? this.sendTo,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'send_to': sendTo,
      };
}
