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
    var empData : Employees!
    
    //lazy var employeeListResponse = PassthroughSubject<Employees, Error>()
    var employeeListResponse = CurrentValueSubject<Employees?, Never>(nil)

    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetEmployeeMockData { result in
            switch result {
            case .success(let employees):
                print("Çekilen veri: \(employees)")
                self.empData = employees
                self.employeeListResponse.send(employees)
            case .failure(let error):
                print("Veri yükleme hatası: \(error.localizedDescription)")
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
