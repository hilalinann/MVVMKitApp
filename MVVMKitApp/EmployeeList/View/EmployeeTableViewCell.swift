//
//  EmployeeTableViewCell.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 9.07.2025.
//

import Foundation
import UIKit

class EmployeeTableViewCell : UITableViewCell {
    
    
    @IBOutlet weak var employeesIdLabel: UILabel!
    
    @IBOutlet weak var employessNameLabel: UILabel!
    
    var employee : EmployeeData? {
        didSet {
            employeesIdLabel.text = String.init(format: "%d", employee?.id ?? 0)
            employessNameLabel.text = employee?.employee_name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
