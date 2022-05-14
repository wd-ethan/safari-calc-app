//
//  CalcPage.swift
//  SafariCalc
//
//  Created by Ethan Wright on 2022-04-19.
//

import Foundation
import SwiftUI

struct debtView: View {
    
    @EnvironmentObject var listOfFriends: Group
    var person: Person
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person")
                Text(person.name + ": $" + String(person.debt))
            }
            HStack{
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200*person.barSize(total: listOfFriends.total), height: 20)
            }
        }
    }
}

struct CalcPage: View {
    
    @EnvironmentObject var listOfFriends: Group
    
    var body: some View {
        ZStack {
            Color.red
            VStack {
                List (listOfFriends.friends) { person in
                    debtView(person: person)
                }
            }
        }
  
    }
}
