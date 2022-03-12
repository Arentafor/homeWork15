import Foundation

class Film {
    let image: String
    let name: String
    let description: String
    
    
    init?(data: NSDictionary) {
        guard let name = data["title"] as? String,
              let description = data["description"] as? String,
              let image = data["image"] as? String else { return nil}
        
        self.image = image
        self.description = description
        self.name = name
    }
    
    
}
