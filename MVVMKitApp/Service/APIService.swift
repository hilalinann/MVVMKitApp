import Foundation
import Combine

enum DataLoadingError: Error, LocalizedError {
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
            return "Error: Unable to decode JSON from file."
        case .unknown:
            return "Unknown Error"
        }
    }
}

class APIService: NSObject {
    func fetchEmployeeMockData() -> AnyPublisher<Employees, DataLoadingError> {
        Future<Employees, DataLoadingError> { promise in
            guard let url = Bundle.main.url(forResource: "MyData", withExtension: "json") else {
                promise(.failure(.fileNotFound))
                return
            }
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                // decoder.keyDecodingStrategy = .convertFromSnakeCase // gerekiyorsa açın
                let employees = try decoder.decode(Employees.self, from: data)
                promise(.success(employees))
            } catch {
                print("JSON decode error:", error) // Teşhis için
                promise(.failure(.jsonDecodingFailed))
            }
        }
        .eraseToAnyPublisher()
    }
}
