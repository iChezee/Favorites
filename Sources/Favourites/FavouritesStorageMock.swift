import Foundation

public class FavouritesStorageMock: FavouritesStorage {
    public var favourited: Set<String> = Set<String>()
    
    public init() { }
    
    public func isFavourite(_ item: Favourited) -> Bool {
        favourited.contains(item.favouritableID)
    }
    
    public func isFavourite(_ id: String) -> Bool {
        favourited.contains(id)
    }
    
    public func toogleFavourite(_ item: Favourited) {
        if isFavourite(item) {
            favourited.remove(item.favouritableID)
        } else {
            favourited.insert(item.favouritableID)
        }
    }
    
    public func eraseData() {
        favourited.removeAll()
    }
}
