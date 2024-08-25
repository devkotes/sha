class FormDataPlanModel {
  final String? dataPlanId;
  final String? phoneNumber;
  final String? pin;

  FormDataPlanModel({
    this.dataPlanId,
    this.phoneNumber,
    this.pin,
  });

  FormDataPlanModel copyWith({
    String? dataPlanId,
    String? phoneNumber,
    String? pin,
  }) =>
      FormDataPlanModel(
        dataPlanId: dataPlanId ?? this.dataPlanId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        pin: pin ?? this.pin,
      );

  Map<String, dynamic> toJson() => {
        'data_plan_id': dataPlanId,
        'phone_number': phoneNumber,
        'pin': pin,
      };
}
