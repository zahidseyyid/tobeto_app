class SocialMedia {
  String platform;
  String username;

  SocialMedia({
    required this.platform,
    required this.username,
  });

  factory SocialMedia.fromFirestore(Map<String, dynamic> json) {
    return SocialMedia(
      platform: json['platform'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'platform': platform,
      'username': username,
    };
  }
}
