class User {
  // User ID
  final String id;
  //first name user
  final String firstname;
  //lastname user
  final String lastname;
  // Date and time when the profile was created
  final DateTime createdAt;
   User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.createdAt,
  });


  User.fromMap(Map<String, dynamic> map): 
        id = map['id'],
        firstname = map['username'],
        lastname = map['username'],
        createdAt = DateTime.parse(map['created_at']);
}