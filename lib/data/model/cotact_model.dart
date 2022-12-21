class ContactModel{
  late int id;
  late String name;
  late String phone;
  late String mail;

ContactModel({required this.id,required this.name,required this.phone,required this.mail});

  ContactModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    mail = json['mail'];

  }
}