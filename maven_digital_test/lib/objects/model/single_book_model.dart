import 'dart:convert';

class SingleBookResponse {
  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;

  SingleBookResponse({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
  });

  SingleBookResponse copyWith({
    String? kind,
    String? id,
    String? etag,
    String? selfLink,
    VolumeInfo? volumeInfo,
    SaleInfo? saleInfo,
  }) {
    return SingleBookResponse(
      kind: kind ?? this.kind,
      id: id ?? this.id,
      etag: etag ?? this.etag,
      selfLink: selfLink ?? this.selfLink,
      volumeInfo: volumeInfo ?? this.volumeInfo,
      saleInfo: saleInfo ?? this.saleInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kind': kind,
      'id': id,
      'etag': etag,
      'selfLink': selfLink,
      'volumeInfo': volumeInfo.toMap(),
      'saleInfo': saleInfo.toMap(),
    };
  }

  factory SingleBookResponse.fromMap(Map<String, dynamic> map) {
    return SingleBookResponse(
      kind: map['kind'] ?? '',
      id: map['id'] ?? '',
      etag: map['etag'] ?? '',
      selfLink: map['selfLink'] ?? '',
      volumeInfo: VolumeInfo.fromMap(map['volumeInfo']),
      saleInfo: SaleInfo.fromMap(map['saleInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleBookResponse.fromJson(String source) =>
      SingleBookResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SingleBookResponse(kind: $kind, id: $id, etag: $etag, selfLink: $selfLink, volumeInfo: $volumeInfo, saleInfo: $saleInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SingleBookResponse &&
        other.kind == kind &&
        other.id == id &&
        other.etag == etag &&
        other.selfLink == selfLink &&
        other.volumeInfo == volumeInfo &&
        other.saleInfo == saleInfo;
  }

  @override
  int get hashCode {
    return kind.hashCode ^
        id.hashCode ^
        etag.hashCode ^
        selfLink.hashCode ^
        volumeInfo.hashCode ^
        saleInfo.hashCode;
  }
}

class VolumeInfo {
  final String title;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final List<IndustryIdentifier> industryIdentifiers;
  final ReadingModes readingModes;
  final int pageCount;
  final int printedPageCount;
  final String printType;
  final List<String> categories;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;
  VolumeInfo({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printedPageCount,
    required this.printType,
    required this.categories,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  VolumeInfo copyWith({
    String? title,
    List<String>? authors,
    String? publisher,
    String? publishedDate,
    String? description,
    List<IndustryIdentifier>? industryIdentifiers,
    ReadingModes? readingModes,
    int? pageCount,
    int? printedPageCount,
    String? printType,
    List<String>? categories,
    String? maturityRating,
    bool? allowAnonLogging,
    String? contentVersion,
    ImageLinks? imageLinks,
    String? language,
    String? previewLink,
    String? infoLink,
    String? canonicalVolumeLink,
  }) {
    return VolumeInfo(
      title: title ?? this.title,
      authors: authors ?? this.authors,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      description: description ?? this.description,
      industryIdentifiers: industryIdentifiers ?? this.industryIdentifiers,
      readingModes: readingModes ?? this.readingModes,
      pageCount: pageCount ?? this.pageCount,
      printedPageCount: printedPageCount ?? this.printedPageCount,
      printType: printType ?? this.printType,
      categories: categories ?? this.categories,
      maturityRating: maturityRating ?? this.maturityRating,
      allowAnonLogging: allowAnonLogging ?? this.allowAnonLogging,
      contentVersion: contentVersion ?? this.contentVersion,
      imageLinks: imageLinks ?? this.imageLinks,
      language: language ?? this.language,
      previewLink: previewLink ?? this.previewLink,
      infoLink: infoLink ?? this.infoLink,
      canonicalVolumeLink: canonicalVolumeLink ?? this.canonicalVolumeLink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'authors': authors,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'description': description,
      'industryIdentifiers': industryIdentifiers.map((x) => x.toMap()).toList(),
      'readingModes': readingModes.toMap(),
      'pageCount': pageCount,
      'printedPageCount': printedPageCount,
      'printType': printType,
      'categories': categories,
      'maturityRating': maturityRating,
      'allowAnonLogging': allowAnonLogging,
      'contentVersion': contentVersion,
      'imageLinks': imageLinks.toMap(),
      'language': language,
      'previewLink': previewLink,
      'infoLink': infoLink,
      'canonicalVolumeLink': canonicalVolumeLink,
    };
  }

  factory VolumeInfo.fromMap(Map<String, dynamic> map) {
    return VolumeInfo(
      title: map['title'] ?? '',
      authors: List<String>.from(map['authors']),
      publisher: map['publisher'] ?? '',
      publishedDate: map['publishedDate'] ?? '',
      description: map['description'] ?? '',
      industryIdentifiers: List<IndustryIdentifier>.from(
          map['industryIdentifiers']
              ?.map((x) => IndustryIdentifier.fromMap(x))),
      readingModes: ReadingModes.fromMap(map['readingModes']),
      pageCount: map['pageCount']?.toInt() ?? 0,
      printedPageCount: map['printedPageCount']?.toInt() ?? 0,
      printType: map['printType'] ?? '',
      categories: List<String>.from(map['categories']),
      maturityRating: map['maturityRating'] ?? '',
      allowAnonLogging: map['allowAnonLogging'] ?? false,
      contentVersion: map['contentVersion'] ?? '',
      imageLinks: ImageLinks.fromMap(map['imageLinks']),
      language: map['language'] ?? '',
      previewLink: map['previewLink'] ?? '',
      infoLink: map['infoLink'] ?? '',
      canonicalVolumeLink: map['canonicalVolumeLink'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VolumeInfo.fromJson(String source) =>
      VolumeInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VolumeInfo(title: $title, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, industryIdentifiers: $industryIdentifiers, readingModes: $readingModes, pageCount: $pageCount, printedPageCount: $printedPageCount, printType: $printType, categories: $categories, maturityRating: $maturityRating, allowAnonLogging: $allowAnonLogging, contentVersion: $contentVersion, imageLinks: $imageLinks, language: $language, previewLink: $previewLink, infoLink: $infoLink, canonicalVolumeLink: $canonicalVolumeLink)';
  }

  @override
  int get hashCode {
    return title.hashCode ^
        authors.hashCode ^
        publisher.hashCode ^
        publishedDate.hashCode ^
        description.hashCode ^
        industryIdentifiers.hashCode ^
        readingModes.hashCode ^
        pageCount.hashCode ^
        printedPageCount.hashCode ^
        printType.hashCode ^
        categories.hashCode ^
        maturityRating.hashCode ^
        allowAnonLogging.hashCode ^
        contentVersion.hashCode ^
        imageLinks.hashCode ^
        language.hashCode ^
        previewLink.hashCode ^
        infoLink.hashCode ^
        canonicalVolumeLink.hashCode;
  }
}

class IndustryIdentifier {
  final String type;
  final String identifier;
  IndustryIdentifier({
    required this.type,
    required this.identifier,
  });

  IndustryIdentifier copyWith({
    String? type,
    String? identifier,
  }) {
    return IndustryIdentifier(
      type: type ?? this.type,
      identifier: identifier ?? this.identifier,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'identifier': identifier,
    };
  }

  factory IndustryIdentifier.fromMap(Map<String, dynamic> map) {
    return IndustryIdentifier(
      type: map['type'] ?? '',
      identifier: map['identifier'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory IndustryIdentifier.fromJson(String source) =>
      IndustryIdentifier.fromMap(json.decode(source));

  @override
  String toString() =>
      'IndustryIdentifier(type: $type, identifier: $identifier)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IndustryIdentifier &&
        other.type == type &&
        other.identifier == identifier;
  }

  @override
  int get hashCode => type.hashCode ^ identifier.hashCode;
}

class ReadingModes {
  final bool text;
  final bool image;
  ReadingModes({
    required this.text,
    required this.image,
  });

  ReadingModes copyWith({
    bool? text,
    bool? image,
  }) {
    return ReadingModes(
      text: text ?? this.text,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'image': image,
    };
  }

  factory ReadingModes.fromMap(Map<String, dynamic> map) {
    return ReadingModes(
      text: map['text'] ?? false,
      image: map['image'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReadingModes.fromJson(String source) =>
      ReadingModes.fromMap(json.decode(source));

  @override
  String toString() => 'ReadingModes(text: $text, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReadingModes && other.text == text && other.image == image;
  }

  @override
  int get hashCode => text.hashCode ^ image.hashCode;
}

class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;
  final String small;
  final String medium;
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
    required this.small,
    required this.medium,
  });

  Map<String, dynamic> toMap() {
    return {
      'smallThumbnail': smallThumbnail,
      'thumbnail': thumbnail,
      'small': small,
      'medium': medium,
    };
  }

  factory ImageLinks.fromMap(Map<String, dynamic> map) {
    return ImageLinks(
      smallThumbnail: map['smallThumbnail'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      small: map['small'] ?? '',
      medium: map['medium'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageLinks.fromJson(String source) =>
      ImageLinks.fromMap(json.decode(source));
}

class SaleInfo {
  final String country;
  final String saleability;
  final bool isEbook;
  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
  });

  SaleInfo copyWith({
    String? country,
    String? saleability,
    bool? isEbook,
  }) {
    return SaleInfo(
      country: country ?? this.country,
      saleability: saleability ?? this.saleability,
      isEbook: isEbook ?? this.isEbook,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'saleability': saleability,
      'isEbook': isEbook,
    };
  }

  factory SaleInfo.fromMap(Map<String, dynamic> map) {
    return SaleInfo(
      country: map['country'] ?? '',
      saleability: map['saleability'] ?? '',
      isEbook: map['isEbook'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleInfo.fromJson(String source) =>
      SaleInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'SaleInfo(country: $country, saleability: $saleability, isEbook: $isEbook)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SaleInfo &&
        other.country == country &&
        other.saleability == saleability &&
        other.isEbook == isEbook;
  }

  @override
  int get hashCode =>
      country.hashCode ^ saleability.hashCode ^ isEbook.hashCode;
}
