
class User {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? username;
  String? profilepic;
  String? status;
  String? role;
  String? password;

  User({
    this.id,
    this.firstname,
    this.profilepic,
    this.lastname,
    this.username,
    this.email,
    this.status,
    this.role,
    this.password
  });

  get fullname {
    return '${this.firstname} ${this.lastname}';
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname' : lastname,
      'username' : username,
      'email' : email,
      'password' : password
    };
  }

  Map<String, dynamic> loginJson() {
    return {
      'email': email,
      'password': password,
    };
  }

   User.fromJson(Map<String, dynamic> json) {
      id = json["id"];
      firstname = json['firstname'];
      lastname = json['lastname'];
      username = json['username'];
      email = json['email'];
      status = json['status'];
      role = json['role'];
      password = json['password'];
  }
}