// ignore_for_file: avoid_print

import 'package:flutter_application_1/logic/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/logic/repositories/user_repository.dart';
import 'package:flutter_application_1/models/user_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserInitialState()) {
    on<UserUpdateEvent>(_onUserUpdateEvent);
    on<UserFetchEvent>(_onUserFetchEvent);
    on<UserDeleteEvent>(_onUserDeleteEvent);
  }

  // Bu fonksiyon, bir UserFetchEvent alır ve kullanıcıyı yükler.
  // Kullanıcı yüklenirken, UserFetchLoadingState durumunu yayınlar.
  // Kullanıcı başarıyla yüklendiğinde, UserFetchedState durumunu yayınlar ve yüklenen kullanıcıyı içerir.
  // Kullanıcı yüklenemediğinde, UserFetchErrorState durumunu yayınlar ve hata mesajını içerir.
  void _onUserFetchEvent(UserFetchEvent event, Emitter<UserState> emit) async {
    emit(UserFetchLoadingState()); // Kullanıcı yükleniyor durumunu yayınla
    final fetchedUser =
        await _userRepository.fetchUser(event.userId); // Kullanıcıyı yükle
    if (fetchedUser is UserProfile) {
      // Eğer kullanıcı başarıyla yüklendiyse
      emit(
          UserFetchedState(fetchedUser)); // Kullanıcı yüklendi durumunu yayınla
    } else {
      // Eğer kullanıcı yüklenemediyse
      emit(UserFetchErrorState(
          errorMessage: fetchedUser.toString())); // Hata durumunu yayınla
    }
  }

  // Bu fonksiyon, bir UserUpdateEvent alır ve kullanıcıyı günceller.
  // Kullanıcı güncellenirken, UserFetchLoadingState durumunu yayınlar.
  // Kullanıcı başarıyla güncellendiğinde, UserInitialState durumunu yayınlar.
  // Kullanıcı güncellenemediğinde, UserUpdateErrorState durumunu yayınlar ve hata mesajını içerir.
  void _onUserUpdateEvent(
      UserUpdateEvent event, Emitter<UserState> emit) async {
    print("girdi"); // İşlem başladı
    emit(UserFetchLoadingState()); // Kullanıcı güncelleniyor durumunu yayınla
    print("loading state emit edildi"); // Yükleme durumu yayınlandı
    try {
      print("try içi"); // Try bloğuna girildi
      await _userRepository.updateUser(
          event.userProfile, event.userId); // Kullanıcıyı güncelle
      print("updateUser çağrıldı"); // Kullanıcı güncelleme fonksiyonu çağrıldı
      emit(UserInitialState()); // Kullanıcı başlangıç durumunu yayınla
      print("UserInitialState emit edildi"); // Başlangıç durumu yayınlandı
    } catch (e) {
      // Hata oluştuğunda
      print(e); // Hatayı yazdır
      emit(UserUpdateErrorState(
          updateErrorMessage: e.toString())); // Hata durumunu yayınla
      print("UserUpdateErrorState emit edildi"); // Hata durumu yayınlandı
    }
  }

  void _onUserDeleteEvent(UserDeleteEvent event, Emitter<UserState> emit) {
    emit(UserInitialState());
  }
}
