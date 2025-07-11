import Foundation
import Combine

class EmployeeListViewModel: NSObject {

    var router: EmployeeListRouter!
    private var apiService: APIService!
    var empData: Employees!
    var employeeListResponse = PassthroughSubject<Employees, Error>()
    private var cancellables = Set<AnyCancellable>()

    override init() {
        super.init()
        self.apiService = APIService()
    }

    func getEmployeeList() {
        apiService.fetchEmployeeMockData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.employeeListResponse.send(completion: .failure(error))
                }
            }, receiveValue: { [weak self] employees in
                guard let self = self else { return }
                self.empData = employees
                self.employeeListResponse.send(employees)
            })
            .store(in: &cancellables)
    }

    func navigateToEmployeeDetailScreen(index: Int) {
        if let data = self.empData.data?[index] {
            router.routeToDetail(empData: data)
        }
    }
}
