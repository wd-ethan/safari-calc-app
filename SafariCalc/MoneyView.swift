//
//  MoneyView.swift
//  SafariCalc
//
//  Created by Ethan Wright on 2022-04-19.
//

import Foundation
import SwiftUI

struct personTextField: View {
    
    var person: Person
    @State var input: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "person")
            Text(person.name)
                .frame(width: 69)
            TextField("Enter amount spent", text: $input)
                .keyboardType(.numberPad)
                .padding()
                .textFieldStyle(.roundedBorder)
                .frame(width: 200, height: 70, alignment: .center)
                .onSubmit {
                    person.setSpent(spent: Double(input) ?? 0)
                    print(person.spent)
                }
        }
    }
}

struct MoneyView: View {
    
    @EnvironmentObject var listOfFriends: Group
    @State var total = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    
                    TextField("Enter total bill", text: $total).onSubmit {
                        listOfFriends.total = Double(total) ?? 0
                    }
                    
                    List (listOfFriends.friends) { person in
                        personTextField(person: person)
                    }
                    
                    NavigationLink {
                        CalcPage()
                    } label: {
                        HStack{
                            Image(systemName: "dollarsign.circle")
                            Text("Calculate")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 2))
                    }.simultaneousGesture(TapGesture().onEnded({
                        listOfFriends.calculateOwing(total: Double(total) ?? 0)
                    }))

                }
                .navigationTitle("Money")
            }
            
        }
    }
}
