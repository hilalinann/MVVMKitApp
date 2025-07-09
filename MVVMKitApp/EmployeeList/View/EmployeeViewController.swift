//
//  EmployeeViewController.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 8.07.2025.
//

import UIKit
import Combine

class EmployeeViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var employeeViewModel = EmployeeListViewModel()
    
    lazy var employeeListSubscriber = Set<AnyCancellable>()
    
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell, EmployeeData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        callToViewModelForUpdate()
    }
    
    func callToViewModelForUpdate() {
        self.employeeViewModel
            .employeeListResponse
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] response in
                guard let weakSelf = self else { return }
                weakSelf.employeeViewModel.empData = response

                weakSelf.updateDataSource()
                //weakSelf.updateDataSource()
            }).store(in: &employeeListSubscriber)

    }
    
        func updateDataSource() {
            
            self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeeViewModel.empData.data!, configureCell: { (cell,emd) in
                cell.employeesIdLabel.text = String(emd.id)
                cell.employessNameLabel.text = String(emd.employee_name)
            })
            
            DispatchQueue.main.async {
                self.tableView.dataSource = self.dataSource
                self.tableView.reloadData()
            }
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            employeeViewModel.navigateToEmployeeDetailScreen(index: indexPath.row)
        }
        
    }



