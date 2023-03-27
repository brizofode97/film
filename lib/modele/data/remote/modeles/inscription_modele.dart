class InscriptionModele{

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

  Map<String, dynamic> toMap(){
    return {
      'firstName' : firstName,
      'lastName' : lastName,
      'username' : username,
      'email' : email,
      'role' : role,
    };
  }  

  InscriptionModele.fromMap(Map<String, dynamic> map){
    firstName = map['firstName'];
    lastName = map['lastName'];
    username = map['username'];
    email = map['email'];
    role = map['role'];
  }








}