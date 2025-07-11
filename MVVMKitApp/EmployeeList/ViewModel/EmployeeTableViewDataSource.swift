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
