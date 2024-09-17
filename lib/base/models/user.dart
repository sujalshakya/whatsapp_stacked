class User {
  User({
    this.name,
    this.email,
    this.uid,
  });
  String? name;
  String? email;
  String? uid;

  toJson() {
    return {
      "name": name,
      "email": email,
      "Uid": uid,
    };
  }
}
