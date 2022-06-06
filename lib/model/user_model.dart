class UserModel{
  late String fullName;
  late String email;
  late String password;
  late String phone;

  UserModel(this.password, this.phone, this.email, this.fullName);

  UserModel.fromJson(dynamic data){
    if(data == null) return;

    fullName = data['name'];
    password = data['password'];
    email = data['email'];
    phone = data['phone'];
  }
}