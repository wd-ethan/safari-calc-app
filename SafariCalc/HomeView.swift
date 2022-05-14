//
//  HomeView.swift
//  SafariCalc
//
//  Created by Ethan Wright on 2022-04-19.
//

import Foundation
import SwiftUI

struct PersonRow: View {
    var person: Person
    
    var body: some View{
        HStack{
            Image(systemName: "person")
            NavigationLink {
                // some kinda summary of a person
                Text("boo " + person.name + "!")
            } label: {
                Text(person.name)
            }
        }
    }
}

struct addPerson: View {
    
    @State var name = ""
    @EnvironmentObject var listOfFriends: Group
    
    var body: some View {
        TextField("Enter new member's name", text: $name)
            .onSubmit {
                listOfFriends.friends.append(Person(name: name))
                name = ""
            }
    }
}

struct HomeView: View {

    @EnvironmentObject var listOfFriends: Group
    
    var body: some View {
        NavigationView{
            ZStack{
                
                List (listOfFriends.friends) { person in
                    PersonRow(person: person)
                }
                
                NavigationLink{
                    addPerson()
                } label: {
                    Text("Add member")
                }
            
            .navigationTitle("Safari home")
            }
        }
    }
}
