//
//  NetworkManager.swift
//  HangmanVIPER
//
//  Created by Константин Натаров on 15.08.2023.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    enum NetworkError: Error {
        case invalidURL
        case noData
        case decodingError
    }
    
    func fetchRandomWord(fileName: String, completion: @escaping (Result<WordModel, NetworkError>) -> Void) {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "json") else {
            completion(.failure(.invalidURL))
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            let json = try JSONSerialization.jsonObject(with: data) as? [String: [String: String]]
            
            if let randomWord = json?.keys.randomElement(),
               let wordData = json?[randomWord],
               let definition = wordData["definition"] {
                let wordModel = WordModel(word: randomWord, entry: Word(definition: definition))
                completion(.success(wordModel))
            } else {
                completion(.failure(.decodingError))
            }
        } catch {
            completion(.failure(.invalidURL))
        }
    }
}
