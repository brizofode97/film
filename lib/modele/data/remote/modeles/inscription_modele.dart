class InscriptionModele {
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? role;

  InscriptionModele({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'role': role,
    };
  }

  InscriptionModele.fromMap(Map<String, dynamic> map) {
    firstName = map['firstName'];
    lastName = map['lastName'];
    username = map['username'];
    email = map['email'];
    role = map['role'];
  }
}

class ResponseInscriptionModele {
  int? httpStatusCode;
  String? httpStatus;
  String? reason;
  String? message;

  ResponseInscriptionModele(
      {this.httpStatusCode, this.httpStatus, this.reason, this.message});

  Map<String, dynamic> toMap() {
    return {
      "httpStatusCode": httpStatusCode,
      "httpStatus": httpStatus,
      "reason": reason,
      "message": message,
    };
  }

  ResponseInscriptionModele.fromMap(Map<String, dynamic> map) {
    httpStatusCode = map['httpStatusCode'];
    httpStatus = map['httpStatus'];
    reason = map['reason'];
    message = map['message'];
  }
}
