//
//  Person.swift
//  SafariCalc
//
//  Created by Ethan Wright on 2022-05-13.
//

import Foundation

// Represents a person with a name, and other information for calculations
class Person: Identifiable, ObservableObject {
    
    let id = UUID()
    @Published var name: String
    @Published var spent: Double
    @Published var debt: Double
    
    init(name: String) {
        self.name = name
        self.spent = 0.00
        self.debt = 0.00
    }
    
    func setDebt(total: Double, size: Int) {
        self.debt = (total - self.spent)/Double(size) + self.spent
    }
    
    func setSpent(spent: Double) {
        self.spent = spent
    }
    
    func barSize(total: Double) -> Double{
        return Double(debt/total)
    }
}
