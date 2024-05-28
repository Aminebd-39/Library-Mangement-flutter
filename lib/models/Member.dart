class Member {
  String name;
  String email;
  String phone;
  String address;
  String imageUrl; // Add the image URL field

  Member({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.imageUrl = "", // Optional default value for image URL
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'imageUrl': imageUrl,
    };
  }


}