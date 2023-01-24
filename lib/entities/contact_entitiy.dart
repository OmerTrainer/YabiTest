class Contact {
  final String id;
  final String name;
  final String email;
  final String phone;

  const Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
