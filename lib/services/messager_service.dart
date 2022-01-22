// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:workplacer/models/company/company.dart';
// import 'package:workplacer/utils/collections_names.dart';

class MessagerService {
  // CollectionReference get _companiesCollectionPath =>
  //     FirebaseFirestore.instance.collection(companiesCollectionName);

  Future<void> sendMessage(String message) async {
    // final DocumentReference companyRef = _companiesCollectionPath.doc();
    // final DateTime now = DateTime.now();
    //
    // final String companyId = companyRef.id;
    //
    // final Company company = Company(
    //   id: companyId,
    //   name: name,
    //   creationDate: now,
    //   active: true,
    // );
    //
    // await Future.wait([
    //   companyRef.set(company.toJson()),
    //   // _housesKeysService.addHouseKeys([landlordKey], houseId),
    //   // _usersService.updateUser(newUserModel), // TODO add user info updating
    // ]);
  }
}
