import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:dating_app/app/modules/partner/api_service.dart';

class PartnerController extends GetxController with StateMixin<List<dynamic>> {
  var _text = "".obs;
  final AuthController _googleSignInController = Get.put(AuthController());
  List filteredList = RxList(); // Rx List
  List userList = []; // get User List from API
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  get getText => _text.value;
  void setText(String query) {
    _text.value = query;
  }

  void filterList() {
    // filter the List (by name or lastName)
    final filtered = userList
        .where((item) =>
            (item.name.toLowerCase().contains(_text.value.toLowerCase())) ||
            (item.lastName.toLowerCase().contains(_text.value.toLowerCase())))
        .toList();

    filteredList.assignAll(filtered); // Filtered List
    change(filteredList, status: RxStatus.success()); // update List
  }

  @override
  void onInit() {
    super.onInit();

    refreshData();

    ever(_text, (_) => filterList()); // listen Search box and filtering
  }

  void refreshData() {
    // change([], status: RxStatus.loading()); // Mengubah status menjadi loading
    ApiServices().getUser().then((value) {
      userList = value;
      for (var item in userList) {
        print('Name: ${item.name}');
        print('Last Name: ${item.lastName}');
        print('Email: ${item.email}');
        print('Email: ${item.age}');
        print('----------------------');
        // Menyimpan data pengguna ke Firestore
      }
      filterList(); // Memanggil fungsi filterList untuk memperbarui daftar yang difilter
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void likePartner() async {
    final currentUser = _googleSignInController.currentUser.value;
    final CollectionReference users = _firestore
        .collection('users'); // Misalnya, 'users' adalah koleksi yang digunakan
    final DocumentReference documentReference = users.doc(currentUser!.uid);
    await documentReference.set({
      'name': currentUser.displayName,
      'email': currentUser.email,
    });
    final nestedCollection = documentReference.collection("partner");
    for (var item in userList) {
      // Menyimpan data pengguna ke Firestore
      await nestedCollection.add({
        'name': item.name,
        'gender': item.gender,
        'email': item.email,
        'age': item.age,
        'imgUrl': item.imgUrl,
      });
    }
  }
}
