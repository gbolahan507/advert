// class PostServiceModel {
//   bool success;
//   Service service;

//   PostServiceModel({this.success, this.service});

//   PostServiceModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     service =
//         json['service'] != null ? new Service.fromJson(json['service']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.service != null) {
//       data['service'] = this.service.toJson();
//     }
//     return data;
//   }
// }

// class Service {
//   String title;
//   String description;
//   String address;
//   List<Null> likers;
//   int rating;
//   String phone;
//   String email;
//   String lng;
//   String lat;
//   String distance;
//   bool businessRegistration;
//   bool liked;
//   List<String> images;
//   String sId;
//   String category;
//   String user;
//   String createdAt;
//   String updatedAt;
//   int iV;
//   int likes;
//   String id;

//   Service(
//       {this.title,
//       this.description,
//       this.address,
//       this.likers,
//       this.rating,
//       this.phone,
//       this.email,
//       this.lng,
//       this.lat,
//       this.distance,
//       this.businessRegistration,
//       this.liked,
//       this.images,
//       this.sId,
//       this.category,
//       this.user,
//       this.createdAt,
//       this.updatedAt,
//       this.iV,
//       this.likes,
//       this.id});

//   Service.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     description = json['description'];
//     address = json['address'];
//     if (json['likers'] != null) {
//       likers = new List<Null>();
//       json['likers'].forEach((v) {
//         likers.add(new Null.fromJson(v));
//       });
//     }
//     rating = json['rating'];
//     phone = json['phone'];
//     email = json['email'];
//     lng = json['lng'];
//     lat = json['lat'];
//     distance = json['distance'];
//     businessRegistration = json['businessRegistration'];
//     liked = json['liked'];
//     images = json['images'].cast<String>();
//     sId = json['_id'];
//     category = json['category'];
//     user = json['user'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//     likes = json['likes'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['address'] = this.address;
//     if (this.likers != null) {
//       data['likers'] = this.likers.map((v) => v.toJson()).toList();
//     }
//     data['rating'] = this.rating;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['lng'] = this.lng;
//     data['lat'] = this.lat;
//     data['distance'] = this.distance;
//     data['businessRegistration'] = this.businessRegistration;
//     data['liked'] = this.liked;
//     data['images'] = this.images;
//     data['_id'] = this.sId;
//     data['category'] = this.category;
//     data['user'] = this.user;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     data['likes'] = this.likes;
//     data['id'] = this.id;
//     return data;
//   }
// }
