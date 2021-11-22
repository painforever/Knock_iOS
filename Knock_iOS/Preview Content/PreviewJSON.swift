//
//  PreviewJSON.swift
//  Knock_iOS
//
//  Created by yusong on 11/22/21.
//

import Foundation
class PreviewJSON {
    static func loadList<T: Codable>(name: String) -> [T] {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let results = try JSONDecoder().decode([T].self, from: data)
                return results
            }
            catch {
                return []
            }
        }
        return []
    }
    
    static func loadObject<T: Codable>(name: String) -> T? {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let object = try JSONDecoder().decode(T.self, from: data)
                return object
            }
            catch {
                return nil
            }
        }
        return nil
    }
}
