class PutUpdateAvatarBody {
  PutUpdateAvatarBody({
      this.avatar,});

  PutUpdateAvatarBody.fromJson(dynamic json) {
    avatar = json['avatar'];
  }
  String? avatar;
PutUpdateAvatarBody copyWith({  String? avatar,
}) => PutUpdateAvatarBody(  avatar: avatar ?? this.avatar,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avatar'] = avatar;
    return map;
  }

}