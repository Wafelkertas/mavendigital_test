import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class BookResponse {
  final String kind;
  final int totalItems;
  final List<BookData> items;
  BookResponse({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  BookResponse copyWith({
    String? kind,
    int? totalItems,
    List<BookData>? items,
  }) {
    return BookResponse(
      kind: kind ?? this.kind,
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kind': kind,
      'totalItems': totalItems,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory BookResponse.fromMap(Map<String, dynamic> map) {
    return BookResponse(
      kind: map['kind'] ?? '',
      totalItems: map['totalItems']?.toInt() ?? 0,
      items: List<BookData>.from(map['items']?.map((x) => BookData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookResponse.fromJson(String source) =>
      BookResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'BookResponse(kind: $kind, totalItems: $totalItems, items: $items)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookResponse &&
        other.kind == kind &&
        other.totalItems == totalItems &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode => kind.hashCode ^ totalItems.hashCode ^ items.hashCode;
}

class BookData {
  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  BookData({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
  });

  BookData copyWith({
    String? kind,
    String? id,
    String? etag,
    String? selfLink,
    VolumeInfo? volumeInfo,
  }) {
    return BookData(
      kind: kind ?? this.kind,
      id: id ?? this.id,
      etag: etag ?? this.etag,
      selfLink: selfLink ?? this.selfLink,
      volumeInfo: volumeInfo ?? this.volumeInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kind': kind,
      'id': id,
      'etag': etag,
      'selfLink': selfLink,
      'volumeInfo': volumeInfo.toMap(),
    };
  }

  factory BookData.fromMap(Map<String, dynamic> map) {
    return BookData(
      kind: map['kind'] ?? '',
      id: map['id'] ?? '',
      etag: map['etag'] ?? '',
      selfLink: map['selfLink'] ?? '',
      volumeInfo: VolumeInfo.fromMap(map['volumeInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookData.fromJson(String source) =>
      BookData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookData(kind: $kind, id: $id, etag: $etag, selfLink: $selfLink, volumeInfo: $volumeInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookData &&
        other.kind == kind &&
        other.id == id &&
        other.etag == etag &&
        other.selfLink == selfLink &&
        other.volumeInfo == volumeInfo;
  }

  @override
  int get hashCode {
    return kind.hashCode ^
        id.hashCode ^
        etag.hashCode ^
        selfLink.hashCode ^
        volumeInfo.hashCode;
  }
}

class VolumeInfo {
  final String title;
  final String publisher;
  final String publishedDate;
  final Map<String, String> imageLinks;
  final List<String> authors;
  VolumeInfo({
    required this.title,
    required this.publisher,
    required this.publishedDate,
    required this.imageLinks,
    required this.authors,
  });

  VolumeInfo copyWith({
    String? title,
    String? publisher,
    String? publishedDate,
    Map<String, String>? imageLinks,
    List<String>? authors,
  }) {
    return VolumeInfo(
      title: title ?? this.title,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      imageLinks: imageLinks ?? this.imageLinks,
      authors: authors ?? this.authors,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'imageLinks': imageLinks,
      'authors': authors,
    };
  }

  factory VolumeInfo.fromMap(Map<String, dynamic> map) {
    return VolumeInfo(
      title: map['title'] ?? '',
      publisher: map['publisher'] ?? '',
      publishedDate: map['publishedDate'] ?? '',
      imageLinks:
          Map<String, String>.from(map['imageLinks'] ?? {"kosong": "kosong"}),
      authors: List<String>.from(map['authors'] ?? [""]),
    );
  }

  String toJson() => json.encode(toMap());

  factory VolumeInfo.fromJson(String source) =>
      VolumeInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VolumeInfo(title: $title, publisher: $publisher, publishedDate: $publishedDate, imageLinks: $imageLinks, authors: $authors)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VolumeInfo &&
        other.title == title &&
        other.publisher == publisher &&
        other.publishedDate == publishedDate &&
        mapEquals(other.imageLinks, imageLinks) &&
        listEquals(other.authors, authors);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        publisher.hashCode ^
        publishedDate.hashCode ^
        imageLinks.hashCode ^
        authors.hashCode;
  }
}


// class VolumeInfo {
//   final String title;
//   final String subtitle;
//   final String publisher;
//   final String publishedDate;
//   final String description;
//   final Map<String, String> imageLinks;
//   final List<String> authors;
//   VolumeInfo({
//     required this.title,
//     required this.subtitle,
//     required this.publisher,
//     required this.publishedDate,
//     required this.description,
//     required this.imageLinks,
//     required this.authors,
//   });

//   VolumeInfo copyWith({
//     String? title,
//     String? subtitle,
//     String? publisher,
//     String? publishedDate,
//     String? description,
//     Map<String, String>? imageLinks,
//     List<String>? authors,
//   }) {
//     return VolumeInfo(
//       title: title ?? this.title,
//       subtitle: subtitle ?? this.subtitle,
//       publisher: publisher ?? this.publisher,
//       publishedDate: publishedDate ?? this.publishedDate,
//       description: description ?? this.description,
//       imageLinks: imageLinks ?? this.imageLinks,
//       authors: authors ?? this.authors,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'subtitle': subtitle,
//       'publisher': publisher,
//       'publishedDate': publishedDate,
//       'description': description,
//       'imageLinks': imageLinks,
//       'authors': authors,
//     };
//   }

//   factory VolumeInfo.fromMap(Map<String, dynamic> map) {
//     return VolumeInfo(
//       title: map['title'] ?? '',
//       subtitle: map['subtitle'] ?? '',
//       publisher: map['publisher'] ?? '',
//       publishedDate: map['publishedDate'] ?? '',
//       description: map['description'] ?? '',
//       imageLinks: Map<String, String>.from(map['imageLinks']),
//       authors: List<String>.from(map['authors'] ?? [""]),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory VolumeInfo.fromJson(String source) =>
//       VolumeInfo.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'VolumeInfo(title: $title, subtitle: $subtitle, publisher: $publisher, publishedDate: $publishedDate, description: $description, imageLinks: $imageLinks, authors: $authors)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is VolumeInfo &&
//         other.title == title &&
//         other.subtitle == subtitle &&
//         other.publisher == publisher &&
//         other.publishedDate == publishedDate &&
//         other.description == description &&
//         mapEquals(other.imageLinks, imageLinks) &&
//         listEquals(other.authors, authors);
//   }

//   @override
//   int get hashCode {
//     return title.hashCode ^
//         subtitle.hashCode ^
//         publisher.hashCode ^
//         publishedDate.hashCode ^
//         description.hashCode ^
//         imageLinks.hashCode ^
//         authors.hashCode;
//   }
// }
