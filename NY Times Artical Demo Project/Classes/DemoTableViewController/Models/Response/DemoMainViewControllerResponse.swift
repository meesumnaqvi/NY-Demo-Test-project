//
//  DemoMainViewControllerResponse.swift
//
//  Created by Faiizziii on 02.02.2024.
//  Copyright © 2024 Faiizziii. All rights reserved.
//

import Foundation
import RealmSwift

struct DemoMainViewControllerResponse: Codable {
    var status: String?
    var copyright: String?
    var numResults: Int?
    var results: [Article]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case numResults = "num_results"
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        numResults = try container.decodeIfPresent(Int.self, forKey: .numResults)
        results = try container.decodeIfPresent([Article].self, forKey: .results)
    }
    
    init(from: RealmDemoMainViewControllerResponse) {
        status = from.status
        copyright = from.copyright
        numResults = from.numResults
        results = from.results.map { $0.toCodable() }
    }
    
    init(
            status: String?,
            copyright: String?,
            numResults: Int?,
            results: [Article]?
        ) {
            self.status = status ?? ""
            self.copyright = copyright ?? ""
            self.numResults = numResults ?? 0
            self.results = results ?? []
        }
}

struct Article: Codable {
    var uri: String?
    var url: String?
    var id: Int?
    var assetId: Int?
    var source: String?
    var publishedDate: String?
    var updated: String?
    var section: String?
    var subsection: String?
    var nytdSection: String?
    var adxKeywords: String?
    var column: String?
    var byline: String?
    var type: String?
    var title: String?
    var abstract: String?
    var desFacet: [String]?
    var orgFacet: [String]?
    var perFacet: [String]?
    var geoFacet: [String]?
    var media: [Media]?
    var etaId: Int?
    
    enum CodingKeys: String, CodingKey {
        case uri, url, id, assetId, source, section, subsection, adxKeywords, column, byline, type, title, abstract, media
        case publishedDate = "published_date"
        case updated, nytdSection = "nytdsection"
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case etaId = "eta_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uri = try container.decodeIfPresent(String.self, forKey: .uri)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        assetId = try container.decodeIfPresent(Int.self, forKey: .assetId)
        source = try container.decodeIfPresent(String.self, forKey: .source)
        publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate)
        updated = try container.decodeIfPresent(String.self, forKey: .updated)
        section = try container.decodeIfPresent(String.self, forKey: .section)
        subsection = try container.decodeIfPresent(String.self, forKey: .subsection)
        nytdSection = try container.decodeIfPresent(String.self, forKey: .nytdSection)
        adxKeywords = try container.decodeIfPresent(String.self, forKey: .adxKeywords)
        column = try container.decodeIfPresent(String.self, forKey: .column)
        byline = try container.decodeIfPresent(String.self, forKey: .byline)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        abstract = try container.decodeIfPresent(String.self, forKey: .abstract)
        desFacet = try container.decodeIfPresent([String].self, forKey: .desFacet)
        orgFacet = try container.decodeIfPresent([String].self, forKey: .orgFacet)
        perFacet = try container.decodeIfPresent([String].self, forKey: .perFacet)
        geoFacet = try container.decodeIfPresent([String].self, forKey: .geoFacet)
        media = try container.decodeIfPresent([Media].self, forKey: .media)
        etaId = try container.decodeIfPresent(Int.self, forKey: .etaId)
    }
    
    
    init(
        uri: String?,
        url: String?,
        id: Int?,
        assetId: Int?,
        source: String?,
        publishedDate: String?,
        updated: String?,
        section: String?,
        subsection: String?,
        nytdSection: String?,
        adxKeywords: String?,
        column: String?,
        byline: String?,
        type: String?,
        title: String?,
        abstract: String?,
        desFacet: [String]?,
        orgFacet: [String]?,
        perFacet: [String]?,
        geoFacet: [String]?,
        media: [Media]?,
        etaId: Int?
    ) {
        self.uri = uri ?? ""
        self.url = url ?? ""
        self.id = id ?? 0
        self.assetId = assetId ?? 0
        self.source = source ?? ""
        self.publishedDate = publishedDate ?? ""
        self.updated = updated ?? ""
        self.section = section ?? ""
        self.subsection = subsection ?? ""
        self.nytdSection = nytdSection ?? ""
        self.adxKeywords = adxKeywords ?? ""
        self.column = column ?? ""
        self.byline = byline ?? ""
        self.type = type ?? ""
        self.title = title ?? ""
        self.abstract = abstract ?? ""
        self.desFacet = desFacet ?? []
        self.orgFacet = orgFacet ?? []
        self.perFacet = perFacet ?? []
        self.geoFacet = geoFacet ?? []
        self.media = media ?? []
        self.etaId = etaId ?? 0
    }
}

struct Media: Codable {
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadata]?
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
    
    init(
            type: String?,
            subtype: String?,
            caption: String?,
            copyright: String?,
            approvedForSyndication: Int?,
            mediaMetadata: [MediaMetadata]?
        ) {
            self.type = type
            self.subtype = subtype
            self.caption = caption
            self.copyright = copyright
            self.approvedForSyndication = approvedForSyndication
            self.mediaMetadata = mediaMetadata
        }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            type = try container.decodeIfPresent(String.self, forKey: .type)
            subtype = try container.decodeIfPresent(String.self, forKey: .subtype)
            caption = try container.decodeIfPresent(String.self, forKey: .caption)
            copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
            approvedForSyndication = try container.decodeIfPresent(Int.self, forKey: .approvedForSyndication)
            mediaMetadata = try container.decodeIfPresent([MediaMetadata].self, forKey: .mediaMetadata)
        }
}

struct MediaMetadata: Codable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
    
    enum CodingKeys: String, CodingKey {
          case url, format, height, width
      }
    
    init(
            url: String?,
            format: String?,
            height: Int?,
            width: Int?
        ) {
            self.url = url ?? ""
            self.format = format ?? ""
            self.height = height ?? 0
            self.width = width ?? 0
        }

      init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          url = try container.decodeIfPresent(String.self, forKey: .url)
          format = try container.decodeIfPresent(String.self, forKey: .format)
          height = try container.decodeIfPresent(Int.self, forKey: .height)
          width = try container.decodeIfPresent(Int.self, forKey: .width)
      }
}


class RealmMediaMetadata: Object {
    @objc dynamic var url: String?
    @objc dynamic var format: String?
    @objc dynamic var height: Int = 0
    @objc dynamic var width: Int = 0
    
    convenience init(from mediaMetadata: MediaMetadata) {
        self.init()
        if let mediaUrl = mediaMetadata.url {
            url = mediaUrl
        } else {
            // Handle the case when 'url' is nil (provide a default value or handle it accordingly)
            // Example: url = "default_url"
            print("Let's see if any case gets failed")
        }
        format = mediaMetadata.format
        height = mediaMetadata.height ?? 0
        width = mediaMetadata.width ?? 0
    }
    
    func toCodable() -> MediaMetadata {
        return MediaMetadata(
            url: url,
            format: format,
            height: height,
            width: width
        )
    }
}

class RealmMedia: Object {
    @objc dynamic var type: String = ""
    @objc dynamic var subtype: String = ""
    @objc dynamic var caption: String = ""
    @objc dynamic var copyright: String = ""
    @objc dynamic var approvedForSyndication: Int = 0
    var mediaMetadata = List<RealmMediaMetadata>()

//    @objc dynamic var mediaMetadata: [RealmMediaMetadata] = [].ignoredprop
    convenience init(from media: Media) {
        self.init()
        type = media.type ?? ""
        subtype = media.subtype ?? ""
        caption = media.caption ?? ""
        copyright = media.copyright ?? ""
        approvedForSyndication = media.approvedForSyndication ?? 0
        
//        if let mediaMetadataList = media.mediaMetadata {
//            mediaMetadata.append(objectsIn: mediaMetadataList.map { RealmMediaMetadata(value: $0) })
//        }
        if let mediaMetadataList = media.mediaMetadata {
                    // Change from List to Array
                    mediaMetadata.append(objectsIn: mediaMetadataList.map { RealmMediaMetadata(value: $0) })
                }
    }
    
    func toCodable() -> Media {
            return Media(
                type: type,
                subtype: subtype,
                caption: caption,
                copyright: copyright,
                approvedForSyndication: approvedForSyndication,
                mediaMetadata: mediaMetadata.map { $0.toCodable() }
            )
        }
}

class RealmDemoMainViewControllerResponse: Object {
    @objc dynamic var status: String = ""
    @objc dynamic var copyright: String = ""
    @objc dynamic var numResults: Int = 0
//    var results = List<RealmArticle>()

    var results: [RealmArticle] = []
    
    convenience init(from response: DemoMainViewControllerResponse) {
        self.init()
        status = response.status ?? ""
        copyright = response.copyright ?? ""
        numResults = response.numResults ?? 0

//        if let articles = response.results {
//            results.append(objectsIn: articles.map { RealmArticle(from: $0) })
//        }
        
        if let articles = response.results {
                    // Change from List to Array
                    results.append(contentsOf: articles.map { RealmArticle(from: $0) })
                }
    }
    
    func toCodable() -> DemoMainViewControllerResponse {
            return DemoMainViewControllerResponse(
                status: status,
                copyright: copyright ,
                numResults: numResults,
                results: results.map { $0.toCodable() }
            )
        }

}

class RealmArticle: Object {
    @objc dynamic var uri: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var assetId: Int = 0
    @objc dynamic var source: String = ""
    @objc dynamic var publishedDate: String = ""
    @objc dynamic var updated: String = ""
    @objc dynamic var section: String = ""
    @objc dynamic var subsection: String = ""
    @objc dynamic var nytdSection: String = ""
    @objc dynamic var adxKeywords: String = ""
    @objc dynamic var column: String = ""
    @objc dynamic var byline: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var abstract: String = ""
    var desFacet = List<String>()
    var orgFacet = List<String>()
    var perFacet = List<String>()
    var geoFacet = List<String>()
   // var media = List<RealmMedia>()
    var media: [RealmMedia] = []
    @objc dynamic var etaId: Int = 0
    
    convenience init(from article: Article) {
        self.init()
        uri = article.uri ?? ""
        url = article.url ?? ""
        id = article.id ?? 0
        assetId = article.assetId ?? 0
        source = article.source ?? ""
        publishedDate = article.publishedDate ?? ""
        updated = article.updated ?? ""
        section = article.section ?? ""
        subsection = article.subsection ?? ""
        nytdSection = article.nytdSection ?? ""
        adxKeywords = article.adxKeywords ?? ""
        column = article.column ?? ""
        byline = article.byline ?? ""
        type = article.type ?? ""
        title = article.title ?? ""
        abstract = article.abstract ?? ""
        
        if let desFacetList = article.desFacet {
            desFacet.append(objectsIn: desFacetList)
        }
        
        if let orgFacetList = article.orgFacet {
            orgFacet.append(objectsIn: orgFacetList)
        }
        
        if let perFacetList = article.perFacet {
            perFacet.append(objectsIn: perFacetList)
        }
        
        if let geoFacetList = article.geoFacet {
            geoFacet.append(objectsIn: geoFacetList)
        }
        
        //        if let mediaList = article.media {
        //            if mediaList.count > 0 {
        //                media.append(objectsIn: mediaList.map { RealmMedia(from: $0) })
        //            }
        //        }
        if let mediaList = article.media {
            if mediaList.count > 0 {
                media.append(contentsOf: mediaList.map { RealmMedia(from: $0) })
            }
        }
        
        
        etaId = article.etaId ?? 0
    }
    
    func toCodable() -> Article {
        return Article(
            uri: uri,
            url: url,
            id: id,
            assetId: assetId,
            source: source,
            publishedDate: publishedDate,
            updated: updated,
            section: section,
            subsection: subsection,
            nytdSection: nytdSection,
            adxKeywords: adxKeywords,
            column: column,
            byline: byline,
            type: type,
            title: title,
            abstract: abstract,
            desFacet: desFacet.toArray(),
            orgFacet: orgFacet.toArray(),
            perFacet: perFacet.toArray(),
            geoFacet: geoFacet.toArray(),
            media: media.map { $0.toCodable() },
            etaId: etaId
        )
    }
}

extension List {
    func toArray() -> [Element] {
        return compactMap { $0 }
    }
}

