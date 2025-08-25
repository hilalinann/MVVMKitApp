import Foundation
import Combine


final class EmployeeListViewModel: BaseHostingViewModel<EmployeeListRouter>, EmployeeListViewModelProtocol {
    
    @Published var empData: Employees?
    //var employeeListResponse = PassthroughSubject<Employees, Error>()
    
    //weak var viewController : EmployeeListViewControllerProtocol?
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //getEmployeeList()
//    }
    
//    func fetch(){
//        viewController?.reloadData()
//    }

    func getEmployeeList() {
        APIService().fetchEmployeeMockData()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Veri çekme hatası: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] employees in
                guard let self = self else { return }
                self.empData = employees
            })
            .store(in: &cancellables)
    }
    
    func navigateToEmployeeDetailScreen(index: Int) {
        if let data = empData?.data?[index] {
            router.routeToDetail(empData: data)
        }
    }
}

protocol EmployeeListViewModelProtocol {
    func getEmployeeList()
    func navigateToEmployeeDetailScreen(index: Int)
    var empData: Employees? { get set }
    //var employeeListResponse: PassthroughSubject<Employees, Error> { get }
}



/*
class EmployeeListViewModel: BaseViewModel<EmployeeListRouter>, EmployeeListViewModelProtocol {
    
    var empData: Employees!
    var employeeListResponse = PassthroughSubject<Employees, Error>()

    override func viewDidLoad() {
        super.viewDidLoad()
        getEmployeeList()
    }
    
    func getEmployeeList() {
        APIService().fetchEmployeeMockData()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
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
        if let data = empData.data?[index] {
            router.routeToDetail(empData: data)
        }
    }
     
}

protocol EmployeeListViewModelProtocol {
    func getEmployeeList()
    func navigateToEmployeeDetailScreen(index: Int)
    var empData: Employees! { get set }
    var employeeListResponse: PassthroughSubject<Employees, Error> { get }
}
*/

/*
class EmployeeListViewModel {

    var router: EmployeeListRouterProtocol
    private var apiService: APIService!
    var empData: Employees!
    var employeeListResponse = PassthroughSubject<Employees, Error>()
    private var cancellables = Set<AnyCancellable>()

    init(router:EmployeeListRouterProtocol) {
        self.apiService = APIService()
        self.router = router
    }

    /*
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
     
     */
}

protocol EmployeeListViewModelProtocol {
    func getEmployeeList()
    func navigateToEmployeeDetailScreen(index: Int)
    var empData: Employees! { get set }
    var employeeListResponse: PassthroughSubject<Employees, Error> { get }
}

extension EmployeeListViewModel: EmployeeListViewModelProtocol {
    
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

/*
 var employeeListResponse = PassthroughSubject<Employees, Error>():
 Combine'dan gelen bir Publisher’dır.
 ViewModel bir veri aldığında, bu subject aracılığıyla veriyi ViewController’a "yayınlar".
 
 private var cancellables = Set<AnyCancellable>()
 Combine abonelikleri burada tutulur.
 Bu sayede memory leak (hafıza sızıntısı) engellenir.
 
 */
*/
