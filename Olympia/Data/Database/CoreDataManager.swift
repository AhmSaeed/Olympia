//
//  LocalDataSourceImpl.swift
//  Olympia
//
//  Created by Ahmed Morsy on 4/30/21.
//  Copyright © 2021 wasiladev. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Olympia")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private var entityName: String {
        return "FavouriteEntity"
    }
    
    var favourites: [NSManagedObject] {
        do {
            return try viewContext.fetch(NSFetchRequest<NSManagedObject>(entityName: entityName))
        } catch let error {
            print("Failed to retrieve favourite: \(error)")
            return []
        }
    }
    
    func addFavourite(with league: League) {
        guard let id = league.idLeague else { return }
        
        let fetchRequest: NSFetchRequest<FavouriteEntity> = FavouriteEntity.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "%K == %@", argumentArray: ["idLeague", id])
        
        do {
            if (try viewContext.fetch(fetchRequest).first) != nil { return }
            
        } catch let error {
            print("Unable to delete favourite league with id \(league.idLeague ?? ""). Error: \(error)")
        }
        
        let favouriteLeague = NSEntityDescription.insertNewObject(forEntityName: entityName, into: viewContext) as? FavouriteEntity
        
        favouriteLeague?.setValue(league.idLeague, forKey: "idLeague")
        favouriteLeague?.setValue(league.strBadge, forKey: "strBadge")
        favouriteLeague?.setValue(league.strLeague, forKey: "strLeague")
        favouriteLeague?.setValue(league.strSport, forKey: "strSport")
        favouriteLeague?.setValue(league.strYoutube, forKey: "strYoutube")
        
        saveContext()
    }
    
    func removeFavourite(with league: League) {
        guard let id = league.idLeague else { return }
        let fetchRequest: NSFetchRequest<FavouriteEntity> = FavouriteEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K == %@", argumentArray: ["idLeague", id])

        do {
            guard let favouriteLeague = try viewContext.fetch(fetchRequest).first else { return }

            viewContext.delete(favouriteLeague)
            saveContext()
        } catch let error {
            print("Unable to delete favourite league with id \(league.idLeague ?? ""). Error: \(error)")
        }
    }
    
    func removeFavourite(with league: NSManagedObject) {
        viewContext.delete(league)
        
        do {
            try viewContext.save()
        } catch let error {
            //TODO: catch and handle error
            print("Unable to delete favourite league with id \(league.value(forKey: "idLeague") ?? ""). Error: \(error)")
        }
    }
    
    func isExistInFavourites(item league: League) -> Bool {
        guard let id = league.idLeague else { return false }
        
        let fetchRequest: NSFetchRequest<FavouriteEntity> = FavouriteEntity.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "%K == %@", argumentArray: ["idLeague", id])
        
        do {
            if (try viewContext.fetch(fetchRequest).first) != nil { return true }
            
        } catch let error {
            print("Unable to delete favourite league with id \(league.idLeague ?? ""). Error: \(error)")
        }
        
        return false
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
