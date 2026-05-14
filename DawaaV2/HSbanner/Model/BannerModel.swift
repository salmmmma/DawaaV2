//
//  BannerData.swift
//  DawaaV2
//
//  Created by Mohammed Hassanien on 14/05/2026.
//

import Foundation

struct BannerResponse: Codable
{
    let components:[BannerComponentWrapper]
}

struct BannerComponentWrapper:Codable{
    let component: BannerComponent?
    let errors:[String]?
    let status:String?
}

struct BannerComponent:Codable
{
    let uid: String?
    let uuid: String?
    let typeCode: String?
    let modifiedtime: String?
    let name: String?
    let bannerType: String?
    let media: BannerMedia?
    let urlLink: String?
    let container: String?
    let mobilelLinkUrl: String?
}
struct BannerMedia: Codable {
    let mobile: BannerImage?
    let widescreen: BannerImage?
}
struct BannerImage: Codable {
    let code: String?
    let catalogId: String?
    let mime: String?
    let altText: String?
    let description: String?
    let url: String?
    let downloadUrl: String?
}
