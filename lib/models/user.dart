class User {
  String? email;
  String? number;
  String? username;

  User({this.email, this.number, this.username});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    number = json['number'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['number'] = this.number;
    data['username'] = this.username;
    return data;
  }
}