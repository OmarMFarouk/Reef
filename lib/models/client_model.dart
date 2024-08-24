import 'package:latlong2/latlong.dart';

class ClientModel {
  ClientModel(
      {this.name,
      this.image,
      this.address,
      this.area,
      this.area2,
      this.area3,
      this.companyName,
      this.dateCreated,
      this.discount,
      this.email,
      this.phone1,
      this.phone2,
      this.latitude,
      this.longitude});
  String? name;
  String? image;
  String? companyName;
  String? email;
  String? phone1;
  String? phone2;
  String? address;
  String? area;
  String? area2;
  String? area3;
  String? dateCreated;
  int? discount;
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;

    data['image'] = image;
    data['companyName'] = companyName;
    data['email'] = email;
    data['phone1'] = phone1;
    data['phone2'] = phone2;
    data['address'] = address;
    data['area'] = area;
    data['area2'] = area2;
    data['area3'] = area3;
    data['dateCreated'] = dateCreated;
    data['discount'] = discount;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
