class Contact {
  int id;
  String firstName;
  String lastName;
  int phoneNumber;
  String email;

  Contact(this.id, this.firstName, this.lastName, this.phoneNumber, this.email);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': firstName,
      'lastname': lastName,
      'phonenumber': phoneNumber,
      'email': email,
    };
  }

  factory Contact.toContact(Map<String, dynamic> mapobject) {
    return Contact(mapobject['id'], mapobject['firstname'],
        mapobject['lastname'], mapobject['phonenumber'], mapobject['email']);
  }
}
