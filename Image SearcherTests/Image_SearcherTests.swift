//
//  Image_SearcherTests.swift
//  Image SearcherTests
//
//  Created by Хасан Давронбеков on 18/05/23.
//

import XCTest
import CoreData

@testable import Image_Searcher

final class Image_SearcherTests: XCTestCase {
    
    var managedObjectContext: NSManagedObjectContext!
    var persistentContainer: NSPersistentContainer!
    
    override func setUpWithError() throws {
        let modelURL = Bundle.main.url(forResource: "Image_Searcher", withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)!
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        try! persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    }
    
    override func tearDownWithError() throws {
        managedObjectContext = nil
        try super.tearDownWithError()
    }
    
    func testExample() throws {
        let dbHandler = DatabaseHandler()
        dbHandler.image = .appImage(.favoriteCircle)
        dbHandler.title = "test"
        dbHandler.saveImage()
        
        let fetchedImages: [Images]
        fetchedImages = dbHandler.retrieveData()
        
        XCTAssertEqual(fetchedImages.count, 1)
        XCTAssertEqual(fetchedImages[0].title, "test")
        XCTAssertNotNil(fetchedImages[0].images)
    }
}
