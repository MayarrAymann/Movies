import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/movie_model.dart';

class FirestoreUtils {
  static CollectionReference<MovieModel> getCollection() {
    return FirebaseFirestore.instance
        .collection('wishlist')
        .withConverter<MovieModel>(
          fromFirestore: (snapshot, _) =>
              MovieModel.fromFirestore(snapshot.data()!),
          toFirestore: (movie, _) => movie.toFirestore(),
        );
  }

  static Future<void> addDataToFirestore(MovieModel movie) {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc();
    movie.firestoreId = docRef.id;
    return docRef.set(movie);
  }

  static Stream<QuerySnapshot<MovieModel>> getRealTimeDataFromFirestore() {
    var snapshot = getCollection().snapshots();
    return snapshot;
  }
}
