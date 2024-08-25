class PaymentMethodModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;
  final String? status;
  final String? time;

  PaymentMethodModel({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
    this.status,
    this.time,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        thumbnail: json['thumbnail'],
        status: json['status'],
        time: json['time'],
      );
}
