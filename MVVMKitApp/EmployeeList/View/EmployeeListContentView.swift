//
//  EmployeeListContentView.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 19.08.2025.
//

import SwiftUI

struct EmployeeListContentView: View {
    
    @ObservedObject var viewModel: EmployeeListViewModel
    
    var body: some View {
        VStack {
            if let employees = viewModel.empData?.data {
                List(employees, id: \.id) { employee in
                    VStack(alignment: .leading) {
                        Text(employee.employee_name)
                            .font(.headline)
                        Text("ID: \(employee.id)")
                            .font(.subheadline)
                    }
                    .onTapGesture {
                        if let index = employees.firstIndex(where: { $0.id == employee.id }) {
                            viewModel.navigateToEmployeeDetailScreen(index: index)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.getEmployeeList()
        }
    }
}
