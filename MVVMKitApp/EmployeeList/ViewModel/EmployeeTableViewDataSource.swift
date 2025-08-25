//
//  EmployeeTableViewDataSource.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 8.07.2025.
//

import Foundation
import UIKit

class EmployeeTableViewDataSource<CELL : UITableViewCell, T> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = { _, _ in }
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL,T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let item = self.items[indexPath.row]
        self.configureCell(cell,item)
        return cell
    }
    
    
}

/*
 CELL ve T nedir?
 CELL: Tabloda kullanılacak hücre türü (örnek: EmployeeTableViewCell)
 T: Tabloda gösterilecek verinin modeli (örnek: EmployeeData)
 Bu sayede bu class, farklı projelerde farklı hücre ve veri türleriyle tekrar tekrar kullanılabilir.
 
 var configureCell : (CELL, T) -> () = { _, _ in }
 Bu closure, her hücreyi yapılandırmak (veriyi hücreye atamak) için çağrılır.
 Dışarıdan bu closure'ı vererek, bu class’ı her projeye uydurursun.
 
 Bu class başlatılırken 3 bilgi veririz:
 Hücre ID’si (cellIdentifier)
 Gösterilecek veri dizisi (items)
 Hücrelerin nasıl yapılandırılacağı (configureCell)
 
 
 */
