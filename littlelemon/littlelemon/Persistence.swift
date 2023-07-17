import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ExampleDatabase")
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores(completionHandler: {_,_ in })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func clear() {
        // Delete all dishes from the store
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dish")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let _ = try? container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
    }
}

struct CoreDataStack {
        static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
        static var persistentContainer: NSPersistentContainer = {
                let container = NSPersistentContainer(name: "ExampleDatabase")
                container.loadPersistentStores { (description, error) in
                        if let error = error {
                print(error)
            }
        }
        return container
    }()
}
