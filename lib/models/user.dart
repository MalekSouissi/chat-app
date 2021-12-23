
class User {
  var id;
  String username;
  String email;
  String password;

  User(
      {this.id,
        required this.username,
        required this.email,
        required this.password,
      });
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "username": username,
      "email": email,
      "password": password,
    };
  }

  factory User.fromJson(Map<String, dynamic> item) {
    return User(
      id: item['_id'],
      username: item['username'],
      email: item['email'],
      password: item['password'],
    );
  }
}
