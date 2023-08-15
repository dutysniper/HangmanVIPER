//
//  NetworkManager.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 15.08.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getRandomWord(fileName: String, completion: @escaping (WordModel?) -> Void) {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: [String: String]]
                
                if let words = json?.keys, let randomWord = words.randomElement() {
                    if let wordData = json?[randomWord], let definition = wordData["definition"] {
                        let wordModel = WordModel(word: randomWord, entry: Word(definition: definition))
                        completion(wordModel)
                    }
                } else {
                    completion(nil)
                }
            } catch {
                print("Error reading JSON file: \(error)")
                completion(nil)
            }
        } else {
            completion(nil)
        }
    }
}
