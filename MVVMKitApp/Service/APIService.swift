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

            guard let pathString = Bundle(for: type(of: self)).path(forResource: "MyData", ofType: "json") else {
                promise(.failure(.fileNotFound))
                return
            }

            do {
                let jsonString = try String(contentsOfFile: pathString, encoding: .utf8)

                guard let jsonData = jsonString.data(using: .utf8) else {
                    promise(.failure(.dataConversionFailed))
                    return
                }

                let decoder = JSONDecoder()
                let employees = try decoder.decode(Employees.self, from: jsonData)
                promise(.success(employees))
            } catch {
                promise(.failure(.jsonDecodingFailed))
            }

        }
        .eraseToAnyPublisher()
    }
}
