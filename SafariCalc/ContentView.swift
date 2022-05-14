//
//  ContentView.swift
//  SafariCalc
//
//  Created by Ethan Wright on 2022-04-19.
//

import SwiftUI

var startingList: Array<Person> = [Person(name: "Ethan"),
                           Person(name: "Peter"),
                           Person(name: "Kailen"),
                           Person(name: "Kyle"),
                           Person(name: "Henry")]

struct ContentView: View {
    
    @StateObject var listOfFriends = Group()
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            MoneyView()
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Money")
                }
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .environmentObject(listOfFriends)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
