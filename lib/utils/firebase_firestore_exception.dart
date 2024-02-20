class FirestoreExceptionHelper {
  static String handleException(dynamic e) {
    String errorMessage;
    switch (e.code) {
      case 'aborted':
        errorMessage =
            'İşlem iptal edildi, genellikle işlem iptalleri gibi bir eş zamanlılık sorunu nedeniyle.';
        break;
      case 'already-exists':
        errorMessage = 'Oluşturmaya çalıştığımız bazı belgeler zaten mevcut.';
        break;
      case 'cancelled':
        errorMessage = 'İşlem iptal edildi (genellikle çağıran tarafından).';
        break;
      case 'data-loss':
        errorMessage = 'Kurtarılamaz veri kaybı veya bozulma.';
        break;
      case 'deadline-exceeded':
        errorMessage = 'İşlem tamamlanmadan önce son kullanma tarihi doldu.';
        break;
      case 'failed-precondition':
        errorMessage =
            'İşlem, işlemin yürütülmesi için gereken durumda olmadığı için reddedildi.';
        break;
      case 'internal':
        errorMessage = 'İç hatalar.';
        break;
      case 'invalid-argument':
        errorMessage = 'Müşteri tarafından geçersiz bir argüman belirtildi.';
        break;
      case 'not-found':
        errorMessage = 'İstenen bazı belgeler bulunamadı.';
        break;
      case 'ok':
        errorMessage = 'İşlem başarıyla tamamlandı.';
        break;
      case 'out-of-range':
        errorMessage = 'İşlem, geçerli aralığın ötesinde denendi.';
        break;
      case 'permission-denied':
        errorMessage =
            'Çağrılanın belirtilen işlemi gerçekleştirmek için izni yok.';
        break;
      case 'resource-exhausted':
        errorMessage =
            'Bazı kaynaklar tükenmiş durumda, belki kullanıcı başına bir kota veya belki de tüm dosya sistemi yer kaplayacak kadar dolu.';
        break;
      case 'unauthenticated':
        errorMessage =
            'İstek, işlemi gerçekleştirmek için geçerli kimlik doğrulama kimlik bilgilerine sahip değil.';
        break;
      case 'unavailable':
        errorMessage = 'Hizmet şu anda kullanılamıyor.';
        break;
      case 'unimplemented':
        errorMessage = 'İşlem uygulanmadı veya desteklenmiyor.';
        break;
      case 'unknown':
        errorMessage = 'Bilinmeyen hata veya farklı bir hata alanından hata.';
        break;
      default:
        errorMessage = 'Beklenmeyen bir hata oluştu.';
        break;
    }
    return errorMessage;
  }
}
