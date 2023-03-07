//
//  LocalData.swift
//  movie-app
//
//  Created by Duy Nguyễn on 07/03/2023.
//

import Foundation
import Then
import CoreData

struct LocalData {
    
    static let shared = LocalData()
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "movie_app")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func addMovieToFavorites(_ movie: Movie, completion: @escaping (Error?) -> Void) {
        let managedContext = persistentContainer.viewContext
        guard let  entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: managedContext) else {
            return
        }
        
        let movieEntity = NSManagedObject(entity: entity, insertInto: managedContext)
        
        movieEntity.setValue(movie.id, forKey: "id")
        movieEntity.setValue(movie.title, forKey: "title")
        movieEntity.setValue(movie.poster, forKey: "poster")
        movieEntity.setValue(movie.backDropPath, forKey: "backDropPath")
        movieEntity.setValue(movie.releaseDate, forKey: "releaseDate")
        movieEntity.setValue(movie.overview, forKey: "overview")
        movieEntity.setValue(movie.runtime, forKey: "runtime")
        movieEntity.setValue(movie.voteAverage, forKey: "voteAverage")
        
        do {
            try managedContext.save()
        } catch let error {
            completion(error)
        }
    }
    
    func removeMovieFromFavorites(_ movie: Movie) {
        
    }
    
    func fetchFavoriteMovies(completion: @escaping ([Movie], Error?) -> (Void)) {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieEntity")
        fetchRequest.includesPropertyValues = false
        do {
            let items = try managedContext.fetch(fetchRequest)
            completion(items.map { $0.convertNSMamagedToMovie() }, nil)
        } catch let error as NSError {
            completion([], error)
        }
    }
}

extension NSManagedObject {
    func convertNSMamagedToMovie() -> Movie {
        return Movie().with {
            $0.id = self.value(forKey: "id") as? Int
            $0.title = self.value(forKey: "title") as? String
            $0.poster = self.value(forKey: "poster") as? String
            $0.backDropPath = self.value(forKey: "backDropPath") as? String
            $0.releaseDate = self.value(forKey: "releaseDate") as? String
            $0.overview = self.value(forKey: "overview") as? String
            $0.runtime = self.value(forKey: "runtime") as? Int
            $0.voteAverage = self.value(forKey: "voteAverage") as? Double
        }
    }
}
