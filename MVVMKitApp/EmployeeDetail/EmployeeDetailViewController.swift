//
//  EmployeeDetailViewController.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 8.07.2025.
//

import Foundation
import UIKit

class EmployeeDetailViewController: BaseViewController<EmployeeDetailViewModel> {
    
    @IBOutlet weak var employeeIdLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeSalaryLabel: UILabel!
    @IBOutlet weak var employeeAgeLabel: UILabel!
    
    
    var employeeDetailViewModel: EmployeeDetailViewModel!
     
    /*
    init(employeeDetailViewModel: EmployeeDetailViewModel) {
        self.employeeDetailViewModel = employeeDetailViewModel
        super.init(viewModel: employeeDetailViewModel)
    }
        
        
    @MainActor required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        let router = EmployeeDetailRouter()
        let viewModel = EmployeeDetailViewModel(router: router)
        self.employeeDetailViewModel = viewModel
        self.viewModel = viewModel
        router.viewController = self
    }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEmployeeData()
    }

    func setupEmployeeData() {
        
        if let employeeName = employeeDetailViewModel.empData?.employee_name {
            navigationItem.title = "\(employeeName) Detayları"
        } else {
            navigationItem.title = "Çalışan Detayı"
        }
        
        if let empID = employeeDetailViewModel.empData?.id {
            employeeIdLabel.text = String.init(format: "Employee ID: %d", empID)
        }
        employeeNameLabel.text = "Employee Name: \(employeeDetailViewModel.empData?.employee_name ?? "")"
        if let empAge = employeeDetailViewModel.empData?.employee_age {
            employeeAgeLabel.text = String.init(format: "Employee Age: %d", empAge)
        }
        if let empSalary = employeeDetailViewModel.empData?.employee_salary {
            employeeSalaryLabel.text = String.init(format: "Employee Salary: %d", empSalary)
        }
    }
}


/*
class EmployeeDetailViewController : UIViewController {
    
    @IBOutlet weak var employeeIdLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeeSalaryLabel: UILabel!
    @IBOutlet weak var employeeAgeLabel: UILabel!
    
    var employeeDetailViewModel = EmployeeDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEmployeeData()
    }
    
    func setupEmployeeData() {
        
        if let employeeName = employeeDetailViewModel.empData?.employee_name {
            navigationItem.title = "\(employeeName) Detayları"
        } else {
            navigationItem.title = "Çalışan Detayı" 
        }
        
        if let empID = employeeDetailViewModel.empData?.id {
            employeeIdLabel.text = String.init(format: "Employee ID: %d", empID)
        }
        employeeNameLabel.text = "Employee Name: \(employeeDetailViewModel.empData?.employee_name ?? "")"
        if let empAge = employeeDetailViewModel.empData?.employee_age {
            employeeAgeLabel.text = String.init(format: "Employee Age: %d", empAge)
        }
        if let empSalary = employeeDetailViewModel.empData?.employee_salary {
            employeeSalaryLabel.text = String.init(format: "Employee Salary: %d", empSalary)
        }
    }
}
*/
