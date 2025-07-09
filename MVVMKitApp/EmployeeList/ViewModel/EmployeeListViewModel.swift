//
//  EmployeeListViewModel.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 8.07.2025.
//

import Foundation
import Combine


class EmployeeListViewModel : NSObject {
    
    var router : EmployeeListRouter!
    private var apiService : APIService!
    private(set) var empData : Employees!
    
    lazy var employeeListResponse = PassthroughSubject<Employees, Error>()
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService
            .apiToGetEmployeeMockData{ result in
                switch result {
                case .success(let employees):
                    print("Çekilen veri: \(employees)")
                    self.empData = employees
                    self.employeeListResponse.send(employees)
                case .failure(let error):
                    print("Veri yükleme hatası: \(error)")
                    self.employeeListResponse.send(completion: .failure(error))
                }
            }
    }
    
    func navigateToEmployeeDetailScreen(index: Int) {
        if let data = self.empData.data?[index] {
            router
                .routeToDetail(empData: data)
        }
    }
    
}
