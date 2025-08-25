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
        didSet { //didSet: Bu değişkene yeni bir değer atandığında otomatik çalışır.
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

/*
 bu ID’yi %d formatıyla bir String’e çevirir

 awakeFromNib():
 Storyboard’dan hücre ilk yüklendiğinde çalışır.
 Genellikle hücrenin stilini, görünümünü özelleştirmek için kullanılır.
 Şu an boş ama buraya kod yazabilirsin (örneğin köşe yuvarlatma, arka plan rengi vs.).
 
 setSelected: UITableViewCell seçildiğinde (tıklanıp highlight olduğunda) otomatik olarak çağrılır. Şu anda override edilmiş ama özelleştirilmemiş.
 
 
 */
