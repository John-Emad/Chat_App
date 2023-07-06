// import 'package:chat_app/model/my_user.dart';
//
// class DataBaseUtils{
//
//   static CollectionReference<MyUser> getUserCollection(){
//     var db = FirebaseFirestore.instance;
//     return db.collection(MyUser.users).withConverter<MyUser>
//       (fromFirestore: ((snapshot, options) => MyUser.fromJson(snapshot.data()!)),
//         toFirestore: (user, options) => user.toJson());
//   }
//
//   // Set(Register) Data(User) to cloud fireStore
//   static Future<void> registerUser(MyUser user)async
//   {
//     getUserCollection().doc(user.id).set(user);
//   }
//
//   // Get Data(USER) from cloud fireStore
//   static Future<MyUser?> getUser(String userId)
//   async {
//     var documentSnapshot = await getUserCollection().doc(userId).get();
//     return documentSnapshot.data();
//   }
// }