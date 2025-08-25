//
//  BaseRouter.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 12.08.2025.
//

import Foundation
import UIKit

protocol BaseRouterProtocol {
    var viewController: UIViewController? { get set }
    func navigate(to route: Route)
}

class BaseRouter: BaseRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func navigate(to route: Route) {
        switch route {
        case .employeeDetail(let data):
            let empDetail = EmployeeDetailRouter().createModule()
            empDetail.employeeDetailViewModel.empData = data
            viewController?.navigationController?.pushViewController(empDetail, animated: true)
          
        case .nextScreen: break
            //let vc = UIViewController()
            //viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
