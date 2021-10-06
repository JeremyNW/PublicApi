//
//  EntryManager.swift
//  PublicApi
//
//  Created by Jeremy Warren on 10/5/21.
//

import Foundation

struct EntryManager {
    
    static func fetchAllCategories(completion: @escaping ([String]) -> Void) {
        guard let url = URL(string: "https://api.publicapis.org/categories") else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                completion([])
                return
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let categories = try decoder.decode([String].self, from: data)
                completion(categories)
                
            } catch {
                print (error)
                completion([])
            }
            
            
        }.resume()
    }
    
    
    static func fetchEntries(for category: String, completion: @escaping ([Entry]) -> Void) {
        guard let baseUrl = URL(string: "https://api.publicapis.org/entries") else {
            completion([])
            return
        }
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
        let categoryQueryItem = URLQueryItem(name: "category", value: category)
        components?.queryItems = [categoryQueryItem]
        
        guard let finalURL = components?.url else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error = error {
                print (error)
                completion([])
                return
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(EntryResponse.self, from: data)
                completion(response.entries)
            } catch  {
                print(error)
                completion([])
            }
            
        }.resume()
    }
}
