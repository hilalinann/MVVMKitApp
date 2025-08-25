//
//  EmployeeListRouter.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 8.07.2025.
//

import Foundation
import UIKit


final class EmployeeListRouter: BaseRouter {
    
    static func createModule() -> UIViewController {
        let router = EmployeeListRouter()
        let viewModel = EmployeeListViewModel(router: router)
        let contentView = EmployeeListContentView(viewModel: viewModel)
        let viewController = EmployeeListViewController(contentView: contentView, viewModel: viewModel)
        
        router.viewController = viewController
        //viewModel.viewController = viewController
        return viewController
    }
    
    func routeToDetail(empData: EmployeeData?) {
            navigate(to: .employeeDetail(empData))
    }
}

/*
class EmployeeListRouter : BaseRouter {
    //weak var viewController: EmployeeViewController?
    
    static func createModule() -> UIViewController {
     
        let router = EmployeeListRouter()
        let viewModel = EmployeeListViewModel(router:router)
        let viewController = EmployeeListViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
        
    }
    
    func routeToDetail(empData: EmployeeData?) {
            navigate(to: .employeeDetail(empData))
        }
}
*/

/*
protocol EmployeeListRouterProtocol : BaseRouterProtocol {
    func routeToDetail(empData: EmployeeData?)
}

extension EmployeeListRouter : EmployeeListRouterProtocol {
    
    func routeToDetail(empData: EmployeeData?) {
        navigate(to: .employeeDetail(empData))
        //let empDetail = EmployeeDetailRouter().createModule()
        //empDetail.employeeDetailViewModel.empData = empData
        //viewController?.navigationController?.pushViewController(empDetail, animated: true)
        
    }
}

*/
