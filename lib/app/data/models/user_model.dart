class UserModel {
  String? uid;
  String? name;
  String? email;
  String? noHp;
  String? lastSignIn;
  String? photoUrl;
  String? noKtp;
  String? almtKtp;
  String? kabKtp;
  String? kecKtp;
  String? kotaKtp;
  String? rtKtp;
  String? rwKtp;
  String? kPosKtp;
  String? almtRmh;
  String? noTlpRmh;
  String? kabRmh;
  String? kecRmh;
  String? kotaRmh;
  String? rtRmh;
  String? rwRmh;
  String? kPosRmh;
  String? almtKtr;
  String? kabKtr;
  String? kecKtr;
  String? kotaKtr;
  String? rtKtr;
  String? rwKtr;
  String? kPosKtr;
  String? noTlpKtr;
  String? noCif;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.noHp,
    this.lastSignIn,
    this.photoUrl,
    this.noKtp,
    this.almtKtp,
    this.kabKtp,
    this.kecKtp,
    this.kotaKtp,
    this.rtKtp,
    this.rwKtp,
    this.kPosKtp,
    this.almtRmh,
    this.noTlpRmh,
    this.kabRmh,
    this.kecRmh,
    this.kotaRmh,
    this.rtRmh,
    this.rwRmh,
    this.kPosRmh,
    this.almtKtr,
    this.kabKtr,
    this.kecKtr,
    this.kotaKtr,
    this.rtKtr,
    this.rwKtr,
    this.kPosKtr,
    this.noTlpKtr,
    this.noCif,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    noHp = json['noHp'];
    lastSignIn = json['lastSignIn'];
    photoUrl = json['photoUrl'];
    noKtp = json['no_ktp'];
    almtKtp = json['almtKtp'];
    kabKtp = json['kabKtp'];
    kecKtp = json['kecKtp'];
    kotaKtp = json['kotaKtp'];
    rtKtp = json['rtKtp'];
    rwKtp = json['rwKtp'];
    kPosKtp = json['kPosKtp'];
    almtRmh = json['almtRmh'];
    noTlpRmh = json['noTlpRmh'];
    kabRmh = json['kabRmh'];
    kecRmh = json['kecRmh'];
    kotaRmh = json['kotaRmh'];
    rtRmh = json['rtRmh'];
    rwRmh = json['rwRmh'];
    kPosRmh = json['kPosRmh'];
    almtKtr = json['almtKtr'];
    kabKtr = json['kabKtr'];
    kecKtr = json['kecKtr'];
    kotaKtr = json['kotaKtr'];
    rtKtr = json['rtKtr'];
    rwKtr = json['rwKtr'];
    kPosKtr = json['kPosKtr'];
    noTlpKtr = json['noTlpKtr'];
    noCif = json['noCif'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['noHp'] = noHp;
    data['lastSignIn'] = lastSignIn;
    data['photoUrl'] = photoUrl;
    data['no_ktp'] = noKtp;
    data['almtKtp'] = almtKtp;
    data['kabKtp'] = kabKtp;
    data['kecKtp'] = kecKtp;
    data['kotaKtp'] = kotaKtp;
    data['rtKtp'] = rtKtp;
    data['rwKtp'] = rwKtp;
    data['kPosKtp'] = kPosKtp;
    data['almtRmh'] = almtRmh;
    data['noTlpRmh'] = noTlpRmh;
    data['kabRmh'] = kabRmh;
    data['kecRmh'] = kecRmh;
    data['kotaRmh'] = kotaRmh;
    data['rtRmh'] = rtRmh;
    data['rwRmh'] = rwRmh;
    data['kPosRmh'] = kPosRmh;
    data['almtKtr'] = almtKtr;
    data['kabKtr'] = kabKtr;
    data['kecKtr'] = kecKtr;
    data['kotaKtr'] = kotaKtr;
    data['rtKtr'] = rtKtr;
    data['rwKtr'] = rwKtr;
    data['kPosKtr'] = kPosKtr;
    data['noTlpKtr'] = noTlpKtr;
    data['noCif'] = noCif;
    return data;
  }
}
