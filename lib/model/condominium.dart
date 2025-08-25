class Condominium {
  final String uuid;
  final String description;
  final String address;
  final String city;
  final String createdOn;
  final String updatedOn;

  Condominium(
      {required this.address,
      required this.city,
      required this.createdOn,
      required this.updatedOn,
      required this.uuid,
      required this.description});

  factory Condominium.fromJson(Map<String, dynamic> json) {
    return Condominium(
      uuid: json['uuid'] as String,
      description: json['description'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      createdOn: json['createdOn'] as String,
      updatedOn: json['updatedOn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'description': description,
    };
  }
}
