import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patico_dev/src/model/patico_user.dart';

class PaticoUserCubit extends Cubit<PaticoUser> {
  PaticoUserCubit() : super(PaticoUser());

  void changeUser(PaticoUser paticoUser) {
    emit(paticoUser);
  }

}
