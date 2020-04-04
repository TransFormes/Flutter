class User{
  String userName;
  String passWord;
  User({this.userName, this.passWord});
  factory User.formJson(Map<String, dynamic> json){
    return User(
      userName: json['userName'],
      passWord: json['passWord'],
    );
  }
  User.map(dynamic obj){
    this.userName = obj['userName'];
    this.passWord = obj['passWord'];
  }
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["userName"] = userName;
    map["passWord"] = passWord;
  }
}