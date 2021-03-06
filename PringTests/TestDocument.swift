 //
//  TestDocument.swift
//  Pring2Tests
//
//  Created by 1amageek on 2017/10/06.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import FirebaseFirestore
import UIKit
import Pring

@objcMembers
class TestDocument: Object {

    @objc enum CustomType: Int {
        case custom
        case update
    }

    dynamic var type: CustomType = .custom
    dynamic var array: [String]                     = ["array"]
    dynamic var set: Set<String>                    = ["set"]
    dynamic var bool: Bool                          = true
    dynamic var binary: Data                        = "data".data(using: .utf8)!
    dynamic var url: URL                            = URL(string: "https://firebase.google.com/")!
    dynamic var int: Int                            = Int.max
    dynamic var float: Double                       = Double.infinity
    dynamic var date: Date                          = Date(timeIntervalSince1970: 100)
    dynamic var geoPoint: GeoPoint                  = GeoPoint(latitude: 0, longitude: 0)
    dynamic var dictionary: [AnyHashable: Any]      = ["key": "value"]
    dynamic var string: String                      = "string"
    dynamic var file: File                          = File(data: UIImagePNGRepresentation(TestDocument.image0())!, mimeType: .png)

    let referenceCollection: ReferenceCollection<TestDocument>  = []
    let nextedCollection: NestedCollection<NestedItem>          = []

    override func encode(_ key: String, value: Any?) -> Any? {
        if key == "type" {
            return (value as! CustomType).rawValue
        }
        return nil
    }

    override func decode(_ key: String, value: Any?) -> Bool {
        if key == "type" {
            self.type = CustomType(rawValue: value as! Int)!
            return true
        }
        return false
    }


    static func image0() -> UIImage {
        let frame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        UIGraphicsBeginImageContext(frame.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.green.cgColor)
        context.fill(frame)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

    static func image1() -> UIImage {
        let frame: CGRect = CGRect(x: 0, y: 0, width: 50, height: 50)
        UIGraphicsBeginImageContext(frame.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.green.cgColor)
        context.fill(frame)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
