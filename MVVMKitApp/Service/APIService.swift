//
//  APIService.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 8.07.2025.
//

import Foundation

enum DataLoadingError : Error, LocalizedError {
    case fileNotFound
    case dataConversionFailed
    case jsonDecodingFailed
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "Error: File could not be found in the bundle."
        case .dataConversionFailed:
            return "Error: Unable to convert file to a String."
        case .jsonDecodingFailed:
            return "Error: Unable to decode JSON from file. Check your data model."
        case .unknown:
            return "Unknown Error"
        }
    }
}

class APIService : NSObject {
    
    func apiToGetEmployeeMockData(completion: @escaping (Result<Employees, DataLoadingError>) -> ()) {
    
        
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "MyData", ofType: "json") else {
            completion( .failure(.fileNotFound))
            return
        }
        print("JSON dosyası bulundu: \(pathString)")
        
        do {
            let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8)
            print("JSON string: \(jsonString)")
            
            guard let jsonData = jsonString?.data(using: .utf8) else {
                completion(.failure(.dataConversionFailed))
                return
            }
            
            let decoder = JSONDecoder()
            let employeesResponse = try decoder.decode(Employees.self, from: jsonData)
            
            completion(.success(employeesResponse))
        } catch {
            completion(.failure(.unknown))
        }
        
        
    }
        
}
