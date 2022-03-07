import 'package:fehm/model/genre.dart';
import 'package:fehm/widgets/playlist_item.dart';

enum UserRole {
  SuperAdmin,
  Admin,
  User,
  Narrator,
}

extension UserRoleExt on UserRole {
  get role {
    switch (this) {
      case UserRole.SuperAdmin:
        return 1;
      case UserRole.Admin:
        return 2;
      case UserRole.Narrator:
        return 8;
      default:
        return 4;
    }
  }
}

enum MemberShip {
  Standard,
  Prime,
}

extension MemberShipExt on MemberShip {
  get role {
    switch (this) {
      case MemberShip.Standard:
        return 1;
      case MemberShip.Prime:
        return 2;
      default:
        return 4;
    }
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? contact;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? status;
  List<Genre>? genre;
  String? profileUrl;
  UserRole? role;
  MemberShip? membershipStatus;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.contact,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.status,
    this.profileUrl,
    this.role,
    this.membershipStatus,
  });

  factory User.fromJson(Map<String, dynamic>? parsedJson) {
    return User(
      id: parsedJson!['id'],
      firstName: parsedJson['first_name'],
      lastName: parsedJson['last_name'],
      contact: parsedJson['contact_number'],
      email: parsedJson['email'],
      createdAt: parsedJson['created_at'],
      updatedAt: parsedJson['updated_at'],
      deletedAt: parsedJson['deleted_at'],
      status: parsedJson['status'],
      // List<Genre>? genre;
      profileUrl: parsedJson['profile_url'],
      // UserRole? role,
      // MemberShip? membershipStatus;
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "contact_number": contact,
      "email": email,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "deleted_at": deletedAt,
      "status": status,
      "membership_status": membershipStatus,
      "genre": genre,
      "profile_url": profileUrl
    };
  }
}
