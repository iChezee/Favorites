import Foundation

public class FavouritesStorageImpl: FavouritesStorage {
    @Published public var favourited = Set<String>()
    private let localStorageSaveKey = "LocalStorageSaveKey"
    
    public init() {
        if let favourites = UserDefaults.standard.object(forKey: localStorageSaveKey) as? [String] {
            favourited = Set(favourites.compactMap { $0 })
        }
    }
    
    public func isFavourite(_ item: Favourited) -> Bool {
        favourited.contains(item.favouritableID)
    }
    
    public func isFavourite(_ id: String) -> Bool {
        favourited.contains(id)
    }
    
    public func toogleFavourite(_ item: Favourited) {
        let id = item.favouritableID
        if favourited.first(where: { $0 == id }) != nil {
            favourited.remove(id)
        } else {
            favourited.insert(id)
        }
        
        saveData()
    }
    
    private func saveData() {
        let favourites = favourited.map { "\($0)" }
        UserDefaults.standard.set(favourites, forKey: localStorageSaveKey)
    }
    
    public func eraseData() {
        favourited.removeAll()
        if UserDefaults.standard.value(forKey: localStorageSaveKey) != nil {
            UserDefaults.standard.set([String](), forKey: localStorageSaveKey)
        }
    }
}
