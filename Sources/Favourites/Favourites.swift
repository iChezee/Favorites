public protocol Favourited {
    var id: String { get }
}

public protocol FavouritesStorage {
    func isFavourite(_ item: Favourited) -> Bool
    func toogleFavourite(_ item: Favourited)
    func eraseData()
}
