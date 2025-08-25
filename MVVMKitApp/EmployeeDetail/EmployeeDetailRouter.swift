//
//  EmployeeDetailRouter.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 8.07.2025.
//

import Foundation
import UIKit

/*
class EmployeeDetailModule {
    
    func createModule() -> EmployeeDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let empDetailVC = storyboard.instantiateViewController(withIdentifier: "EmployeeDetailViewController") as! EmployeeDetailViewController
        empDetailVC.employeeDetailViewModel.router = EmployeeDetailRouter()
        empDetailVC.employeeDetailViewModel.router?.viewController = empDetailVC
        return empDetailVC
    }
}
 */

class EmployeeDetailRouter : BaseRouter {
    //weak var viewController: EmployeeDetailViewController?
    
    func createModule() -> EmployeeDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let empDetailVC = storyboard.instantiateViewController(withIdentifier: "EmployeeDetailViewController") as! EmployeeDetailViewController
        
        let router = EmployeeDetailRouter()
        let viewModel = EmployeeDetailViewModel(router: router) //???????
        //viewModel.router = EmployeeDetailRouter()
        router.viewController = empDetailVC
        
        empDetailVC.employeeDetailViewModel = viewModel
        //empDetailVC.employeeDetailViewModel.router = EmployeeDetailRouter()
        //empDetailVC.employeeDetailViewModel.router?.viewController = empDetailVC
        return empDetailVC
    }
    
    func toNextScreen() {
        navigate(to: .nextScreen)
    }
}

/*
protocol EmployeeDetailRouterProtocol {
    func toNextScreen()
}

extension EmployeeDetailRouter : EmployeeDetailRouterProtocol {
    func toNextScreen() {
        navigate(to: .nextScreen)
    }
}
 */


