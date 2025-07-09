//
//  EmployeeDetailRouter.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 8.07.2025.
//

import Foundation
import UIKit

class EmployeeDetailModule {
    
    func createModule() -> EmployeeDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let empDetailVC = storyboard.instantiateViewController(withIdentifier: "EmployeeDetailViewController") as! EmployeeDetailViewController
        empDetailVC.employeeDetailViewModel.router = EmployeeDetailRouter()
        empDetailVC.employeeDetailViewModel.router?.viewController = empDetailVC
        return empDetailVC
    }
}

class EmployeeDetailRouter {
    var viewController: UIViewController?
}

protocol EmployeeDetailRouterProtocol {
    func toNextScreen()
}

extension EmployeeDetailRouter : EmployeeDetailRouterProtocol {
    func toNextScreen() {}
}
