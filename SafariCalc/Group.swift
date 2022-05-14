//
//  Group.swift
//  SafariCalc
//
//  Created by Ethan Wright on 2022-05-13.
//

import Foundation

// Keeps a list of people, so all "Views" can access the people
class Group: ObservableObject {
    
    @Published var friends: Array<Person>
    @Published var total: Double
    
    init(){
        self.friends = startingList
        self.total = 0.00
    }
    
    func calculateOwing(total: Double){
        for person in friends{
            person.setDebt(total: total, size: friends.count)
        }
    }
}
