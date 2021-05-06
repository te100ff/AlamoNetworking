//
//  Character.swift
//  AlamoNetworking
//
//  Created by Stanislav Testov on 06.05.2021.
//

struct Character: Decodable {
        let fullName: String?
        let title: String?
        let family: String?
        let imageUrl: String?
    
    init(characterData: [String: Any]) {
        fullName = characterData["fullName"] as? String
        title = characterData["title"] as? String
        family = characterData["family"] as? String
        imageUrl = characterData["imageUrl"] as? String
    }
    
    static func getCharacters(from value: Any) -> [Character] {
        guard let charactersData = value as? [[String: Any]] else { return [] }
        
        var characters: [Character] = []
        
        for characterData in charactersData {
            let charachter = Character(characterData: characterData)
            characters.append(charachter)
        }
        
        return characters
    }
    
    var description: String {
        """
        Name: \(fullName ?? "unknown")
        
        Title: \(title ?? "unknown")
        
        Family: \(family ?? "unknown")
        """
    }
}
