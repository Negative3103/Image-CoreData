//
//  Images+CoreDataProperties.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//
//

import Foundation
import CoreData


extension Images {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Images> {
        return NSFetchRequest<Images>(entityName: "Images")
    }

    @NSManaged public var images: Data?
    @NSManaged public var title: String?
    
}
