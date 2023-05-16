//
//  DatabaseHandler.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import CoreData
import UIKit

class DatabaseHandler {
    
    var image: UIImage? = nil
    
    func saveImage() {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let imageObject = NSEntityDescription.insertNewObject(forEntityName: "Images", into: context) as! Images
        imageObject.images = image?.jpegData(compressionQuality: 1) as Data?
        
        do {
            try context.save()
            print("SUCCESFULLY!")
        } catch {
            print("ERROR: \(error)")
        }
    }
    
    func retrieveData() -> [Images] {
        var images = [Images]()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            images = try context.fetch(Images.fetchRequest())
            print("SUCCESSFULLY!")
        } catch {
            print("ERROR: \(error)")
        }
        return images
    }
    
    func deleteImage(image: Images) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(image)
        
        do {
            try context.save()
            print("SUCCESSFULLY!")
        } catch {
            print("ERROR: \(error)")
        }
    }
}
