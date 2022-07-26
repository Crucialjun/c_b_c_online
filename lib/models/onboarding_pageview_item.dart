import 'dart:convert';

class OnboardingPageViewItem {
  String title;
  String description;
  String imageUrl;
  OnboardingPageViewItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  OnboardingPageViewItem copyWith({
    String? title,
    String? description,
    String? imageUrl,
  }) {
    return OnboardingPageViewItem(
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory OnboardingPageViewItem.fromMap(Map<String, dynamic> map) {
    return OnboardingPageViewItem(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingPageViewItem.fromJson(String source) =>
      OnboardingPageViewItem.fromMap(json.decode(source));

  @override
  String toString() =>
      'OnboardingPageViewItem(title: $title, description: $description, imageUrl: $imageUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OnboardingPageViewItem &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ imageUrl.hashCode;
}
