//
//  EmployeeListRouter.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 8.07.2025.
//

import Foundation
import UIKit


class EmployeeListModule {
    
    func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let empVC = storyboard.instantiateViewController(withIdentifier: "EmployeeViewController") as! EmployeeViewController
        empVC.employeeViewModel.router = EmployeeListRouter()
        empVC.employeeViewModel.router?.viewController = empVC
        return empVC
    }
    
}

class EmployeeListRouter {
    var viewController: UIViewController?
}

protocol EmployeeListRouterProtocol {
    func routeToDetail(empData: EmployeeData?)
}

extension EmployeeListRouter : EmployeeListRouterProtocol {
    
    func routeToDetail(empData: EmployeeData?) {
        let empDetail = EmployeeDetailModule().createModule()
        empDetail.employeeDetailViewModel.empData = empData
        viewController?.navigationController?.pushViewController(empDetail, animated: true)
        
    }
}

