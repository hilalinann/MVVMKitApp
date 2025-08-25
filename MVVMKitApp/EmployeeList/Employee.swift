//
//  Employee.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 8.07.2025.
//

import Foundation

struct Employees: Decodable {
    let status: String
    let data: [EmployeeData]?
}

struct EmployeeData: Decodable {
    let id: Int
    let employee_name: String
    let employee_salary: Int
    let employee_age: Int
}
