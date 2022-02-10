import Foundation
import CoreData


public class ToDoList: NSManagedObject {
    let container = NSPersistentContainer(name: "ToDoList")
}

extension ToDoList {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoList> {
        return NSFetchRequest<ToDoList>(entityName: "ToDoList")
    }
    
    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    
}

extension ToDoList : Identifiable {
    static func getAllToDoList() -> NSFetchRequest<ToDoList> {
        let request: NSFetchRequest<ToDoList> = ToDoList.fetchRequest()
        
        let sort = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sort]
        
        return request
    }
    
}

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ToDoListCoreDataFaceID")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
