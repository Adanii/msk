import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mskapp/app/data/models/user_model.dart';

import 'package:mskapp/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var userModels = UserModel().obs;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  @override
  void onInit() async {
    CollectionReference users = firestore.collection("user_profile");
    final crrntUser = await users.doc(auth.currentUser!.email).get();
    final crrntUserData = crrntUser.data() as Map<String, dynamic>;

    userModels(
      UserModel(
        uid: crrntUserData["uid"],
        name: crrntUserData["displayName"],
        email: crrntUserData["email"],
        noHp: crrntUserData["noHp"],
        lastSignIn: crrntUserData["lastSignIn"],

        //alamat ktp
        noKtp: crrntUserData["no_ktp"],
        almtKtp: crrntUserData["alamat_ktp"],
        kabKtp: crrntUserData["kabupaten_ktp"],
        kecKtp: crrntUserData["kecamatan_ktp"],
        kotaKtp: crrntUserData["kota_ktp"],
        rtKtp: crrntUserData["rt_ktp"],
        rwKtp: crrntUserData["rw_ktp"],
        kPosKtp: crrntUserData["kode_pos_ktp"],
        //alamat rumah
        almtRmh: crrntUserData["alamat_ktp"],
        noTlpRmh: crrntUserData["no_telp_rumah"],
        kabRmh: crrntUserData["kabupaten_rumah"],
        kecRmh: crrntUserData["kecamatan_rumah"],
        kotaRmh: crrntUserData["kota_rumah"],
        rtRmh: crrntUserData["rt_rumah"],
        rwRmh: crrntUserData["rw_rumah"],
        kPosRmh: crrntUserData["kode_pos_rumah"],
        //alamat kantor
        almtKtr: crrntUserData["alamat_kantor"],
        kabKtr: crrntUserData["kabupaten_kantor"],
        kecKtr: crrntUserData["kecamatan_kantor"],
        kotaKtr: crrntUserData["kota_kantor"],
        rtKtr: crrntUserData["rt_kantor"],
        rwKtr: crrntUserData["rw_kantor"],
        kPosKtr: crrntUserData["kode_pos_kantor"],
        noTlpKtr: crrntUserData["no_telp_kantor"],
        noCif: crrntUserData["no_cif"],
      ),
    );

    super.onInit();
  }

  void updateUser(
    String name,
    String noHp,
    String noKtp,
    String almtKtp,
    String kabKtp,
    String kecKtp,
    String kotaKtp,
    String rtKtp,
    String rwKtp,
    String kPosKtp,
    String almtRmh,
    String noTlpRmh,
    String kabRmh,
    String kecRmh,
    String kotaRmh,
    String rtRmh,
    String rwRmh,
    String kPosRmh,
    String almtKtr,
    String kabKtr,
    String kecKtr,
    String kotaKtr,
    String rtKtr,
    String rwKtr,
    String kPosKtr,
    String noTlpKtr,
    String noCif,
  ) async {
    CollectionReference users = firestore.collection("user_profile");

    users.doc(auth.currentUser!.email).update({
      "displayName": name,
      "noHp": noHp,
      "no_ktp": noKtp,
      "alamat_ktp": almtKtp,
      "kabupaten_ktp": kabKtp,
      "kecamatan_ktp": kecKtp,
      "kota_ktp": kotaKtp,
      "rt_ktp": rtKtp,
      "rw_ktp": rwKtp,
      "kode_pos_ktp": kPosKtp,
      "alamat_rumah": almtRmh,
      "no_telp_rumah": noTlpRmh,
      "kabupaten_rumah": kabRmh,
      "kecamatan_rumah": kecRmh,
      "kota_rumah": kotaRmh,
      "rt_rumah": rtRmh,
      "rw_rumah": rwRmh,
      "kode_pos_rumah": kPosRmh,
      "alamat_kantor": almtKtr,
      "kabupaten_kantor": kabKtr,
      "kecamatan_kantor": kecKtr,
      "kota_kantor": kotaKtr,
      "rt_kantor": rtKtr,
      "rw_kantor": rwKtr,
      "kode_pos_kantor": kPosKtr,
      "no_telp_kantor": noTlpKtr,
      "no_cif": noCif,
    });
    // Update model
    userModels(UserModel(
      name: name,
      email: auth.currentUser!.email,
      noHp: noHp,
      lastSignIn: auth.currentUser!.metadata.lastSignInTime!.toIso8601String(),

      //alamat ktp
      noKtp: noKtp,
      almtKtp: almtKtp,
      kabKtp: kabKtp,
      kecKtp: kecKtp,
      kotaKtp: kotaKtp,
      rtKtp: rtKtp,
      rwKtp: rwKtp,
      kPosKtp: kPosKtp,
      //alamat rumah
      almtRmh: almtRmh,
      noTlpRmh: noTlpRmh,
      kabRmh: kabRmh,
      kecRmh: kecRmh,
      kotaRmh: kotaRmh,
      rtRmh: rtRmh,
      rwRmh: rwRmh,
      kPosRmh: kPosRmh,
      //alamat kantor
      almtKtr: almtKtr,
      kabKtr: kabKtr,
      kecKtr: kecKtr,
      kotaKtr: kotaKtr,
      rtKtr: rtKtr,
      rwKtr: rwKtr,
      kPosKtr: kPosKtr,
      noTlpKtr: noTlpKtr,
      noCif: noCif,
    ));
    userModels.refresh();
  }

  void signUp(String email, String password, String confirmPass) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.sendEmailVerification();
      Get.defaultDialog(
          title: "Verification Email sent",
          middleText: "Check Your Email Box",
          textConfirm: "Ok",
          onConfirm: () {
            Get.back(); //dialog Close
            Get.back(); //go to login
          });

      CollectionReference users = firestore.collection('user_profile');

      final checkuser = await users.doc(auth.currentUser!.email).get();

      if (checkuser.data() == null) {
        users.doc(auth.currentUser!.email).set({
          "uid": auth.currentUser!.uid,
          "email": auth.currentUser!.email,
          "displayName": auth.currentUser!.displayName,
          "lastSignIn":
              auth.currentUser!.metadata.lastSignInTime!.toIso8601String(),
          "photoUrl": auth.currentUser!.photoURL,
        });
      } else {
        users.doc(auth.currentUser!.email).update({
          "lastSignIn":
              auth.currentUser!.metadata.lastSignInTime!.toIso8601String(),
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("The Password provided too weak");
        Get.defaultDialog(
          title: "Weak Passowrd",
          middleText: "The Password provided too weak",
          textCancel: "Ok",
        );
      } else if (e.code == "email-already-in-use") {
        print("The Account Already Exist for that Email");
        Get.defaultDialog(
            title: "Email Exist",
            middleText: "The Account Already Exist for that Email",
            textCancel: "Ok",
            onCancel: () {
              Get.back();
            });
      }
    }
  }

  void login(String email, String password) async {
    CollectionReference users = firestore.collection('user_profile');

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Email Not Verified",
          middleText:
              "Verified your Email, Resend the Email Verification Link?",
          onConfirm: () async {
            await userCredential.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: 'yes',
        );
      }
      final checkuser = await users.doc(auth.currentUser!.email).get();
      if (checkuser.data() == null) {
        users.doc(auth.currentUser!.email).set({
          "uid": auth.currentUser!.uid,
          "email": auth.currentUser!.email,
          "displayName": auth.currentUser!.displayName,
          "lastSignIn":
              auth.currentUser!.metadata.lastSignInTime!.toIso8601String(),
          "noHp": "",
          "no_ktp": "",
          "alamat_ktp": "",
          "kabupaten_ktp": "",
          "kecamatan_ktp": "",
          "kota_ktp": "",
          "rt_ktp": "",
          "rw_ktp": "",
          "kode_pos_ktp": "",
          "alamat_rumah": "",
          "no_telp_rumah": "",
          "kabupaten_rumah": "",
          "kecamatan_rumah": "",
          "kota_rumah": "",
          "rt_rumah": "",
          "rw_rumah": "",
          "kode_pos_rumah": "",
          "alamat_kantor": "",
          "kabupaten_kantor": "",
          "kecamatan_kantor": "",
          "kota_kantor": "",
          "rt_kantor": "",
          "rw_kantor": "",
          "kode_pos_kantor": "",
          "no_telp_kantor": "",
          "no_cif": "",
        });
      } else {
        users.doc(auth.currentUser!.email).update({
          "lastSignIn":
              auth.currentUser!.metadata.lastSignInTime!.toIso8601String(),
        });
      }
      final crrntUser = await users.doc(auth.currentUser!.email).get();
      final crrntUserData = crrntUser.data() as Map<String, dynamic>;

      userModels(
        UserModel(
          uid: crrntUserData["uid"],
          name: crrntUserData["displayName"],
          email: crrntUserData["email"],
          noHp: crrntUserData["noHp"],
          lastSignIn: crrntUserData["lastSignIn"],
          photoUrl: crrntUserData["photoUrl"],
          //alamat ktp
          noKtp: crrntUserData["no_ktp"],
          almtKtp: crrntUserData["alamat_ktp"],
          kabKtp: crrntUserData["kabupaten_ktp"],
          kecKtp: crrntUserData["kecamatan_ktp"],
          kotaKtp: crrntUserData["kota_ktp"],
          rtKtp: crrntUserData["rt_ktp"],
          rwKtp: crrntUserData["rw_ktp"],
          kPosKtp: crrntUserData["kode_pos_ktp"],
          //alamat rumah
          almtRmh: crrntUserData["alamat_ktp"],
          noTlpRmh: crrntUserData["no_telp_rumah"],
          kabRmh: crrntUserData["kaupaten_rumah"],
          kecRmh: crrntUserData["kecamatan_rumah"],
          kotaRmh: crrntUserData["kota_rumah"],
          rtRmh: crrntUserData["rt_rumah"],
          rwRmh: crrntUserData["rw_rumah"],
          kPosRmh: crrntUserData["kode_pos_rumah"],
          //alamat kantor
          almtKtr: crrntUserData["alamat_kantor"],
          kabKtr: crrntUserData["kabupaten_kantor"],
          kecKtr: crrntUserData["kecamatan_kantor"],
          kotaKtr: crrntUserData["kota_kantor"],
          rtKtr: crrntUserData["rt_kantor"],
          rwKtr: crrntUserData["rw_kantor"],
          kPosKtr: crrntUserData["kode_pos_kantor"],
          noTlpKtr: crrntUserData["no_telp_kantor"],
          noCif: crrntUserData["no_cif"],
        ),
      );
      userModels.refresh();
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print(e);
        Get.defaultDialog(
            title: "User Not Found",
            middleText: "No User Found For That Email",
            textConfirm: "Ok",
            onConfirm: () {
              Get.back();
            });
      } else if (e.code == "wrong-password") {
        print("Wrong Password for that email");
        Get.defaultDialog(
          title: "Password Incorrect",
          middleText: "Please enter the Correct Passowrd",
          textCancel: "Ok",
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<void> addUser(
    String email,
    String displayName,
    String noHp,
    String almtKtp,
    String kabKTP,
    String kecKtp,
    String kotaKtp,
    String rtKtp,
    String rwKtp,
    String kPosKtp,
    String almtRmh,
    String noTlpRmh,
    String kabRmh,
    String kecRmh,
    String kotaRmh,
    String rtRmh,
    String rwRmh,
    String kPosRmh,
    String almtKtr,
    String kabKtr,
    String kecKtr,
    String kotaKtr,
    String rtKtr,
    String rwKtr,
    String kPosKtr,
    String noTlpKtr,
  ) async {
    CollectionReference users = firestore.collection("user_profile");
    users.doc(auth.currentUser!.email).set({
      "LastSignIn":
          auth.currentUser!.metadata.lastSignInTime!.toIso8601String(),
      "uid": auth.currentUser!.uid,
      "email": auth.currentUser!.email,
      "displayName": auth.currentUser!.displayName,
      "noHp": noHp,
      "alamat_ktp": almtKtp,
      "kabupaten_ktp": kabKTP,
      "kecamatan_ktp": kecKtp,
      "kota_ktp": kotaKtp,
      "rt_ktp": rtKtp,
      "rw_ktp": rwKtp,
      "kode_pos_ktp": kPosKtp,
      "alamat_rumah": almtRmh,
      "no_telp_rumah": noTlpRmh,
      "kabupaten_rumah": kabRmh,
      "kecamatan_rumah": kecRmh,
      "kota_rumah": kotaRmh,
      "rt_rumah": rtRmh,
      "rw_rumah": rwRmh,
      "kode_pos_rumah": kPosRmh,
      "alamat_kantor": almtKtr,
      "kabupaten_kantor": kabKtr,
      "kecamatan_kantor": kecKtr,
      "kota_kantor": kotaKtr,
      "rt_kantor": rtKtr,
      "rw_kantor": rwKtr,
      "kode_pos_kantor": kPosKtr,
      "no_telp_kantor": noTlpKtr,
    });
  }

  void forgot(String email) async {
    await auth.sendPasswordResetEmail(email: email);
    Get.offAllNamed(Routes.RESET_PASSWORD);
    Get.defaultDialog(
        title: "Reset Password",
        middleText: "Email Has Sent",
        textCancel: "Ok",
        onCancel: () {
          Get.offAllNamed(Routes.LOGIN);
        });
  }
}
