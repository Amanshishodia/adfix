import 'dart:convert';

ServiceResponseModel serviceResponseModelFromJson(String str) =>
    ServiceResponseModel.fromJson(json.decode(str));

String serviceResponseModelToJson(ServiceResponseModel data) =>
    json.encode(data.toJson());

class ServiceResponseModel {
  bool success;
  List<Services> services;

  ServiceResponseModel({
    required this.success,
    required this.services,
  });

  factory ServiceResponseModel.fromJson(Map<String, dynamic> json) =>
      ServiceResponseModel(
        success: json["success"],
        services: List<Services>.from(
            json["services"].map((x) => Services.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class Services {
  ImageInfo image;
  String id;
  String category;
  String serviceName;
  String serviceDescription;
  String serviceCharge;
  String rating;
  String reviews;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Services({
    required this.image,
    required this.id,
    required this.category,
    required this.serviceName,
    required this.serviceDescription,
    required this.serviceCharge,
    required this.rating,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        image: ImageInfo.fromJson(json["image"]),
        id: json["_id"],
        category: json["Category"],
        serviceName: json["ServiceName"],
        serviceDescription: json["ServiceDescription"],
        serviceCharge: json["ServiceCharge"],
        rating: json["Rating"],
        reviews: json["Reviews"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "image": image.toJson(),
        "_id": id,
        "Category": category,
        "ServiceName": serviceName,
        "ServiceDescription": serviceDescription,
        "ServiceCharge": serviceCharge,
        "Rating": rating,
        "Reviews": reviews,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class ImageInfo {
  String publicId;
  String url;

  ImageInfo({
    required this.publicId,
    required this.url,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) => ImageInfo(
        publicId: json["public_id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "url": url,
      };
}
