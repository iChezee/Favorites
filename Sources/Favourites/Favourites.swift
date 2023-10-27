import Foundation

@objc public protocol Favourited {
    @objc var favouritableID: String { get }
}

public protocol FavouritesStorage {
    var favourited: Set<String> { get }
    func isFavourite(_ item: Favourited) -> Bool
    func isFavourite(_ id: String) -> Bool
    func toogleFavourite(_ item: Favourited)
    func eraseData()
}
