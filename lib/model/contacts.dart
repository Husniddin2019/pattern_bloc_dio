
class Contacts {
  String ?id;
  String ?fullname;
  String? phone;


  Contacts({this.id, this.fullname, this.phone});

  Contacts.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullname = json['fullname'],
        phone = json['phone'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'fullname': fullname,
    'phone': phone,
  };


}