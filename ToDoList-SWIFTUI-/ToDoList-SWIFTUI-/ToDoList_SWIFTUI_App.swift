//
//  ToDoList_SWIFTUI_App.swift
//  ToDoList-SWIFTUI-
//
//  Created by Vladyslav Moroz on 24/01/2023.
//

import SwiftUI

@main
struct ToDoList_SWIFTUI_App: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
