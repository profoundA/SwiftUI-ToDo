//
//  SwiftUI_ToDoApp.swift
//  SwiftUI ToDo
//
//  Created by Andrey Lobanov on 22.03.2022.
//

import SwiftUI

@main
struct SwiftUI_ToDoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
