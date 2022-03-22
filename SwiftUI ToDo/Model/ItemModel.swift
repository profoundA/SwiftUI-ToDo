//
//  ItemModel.swift
//  SwiftUI ToDo
//
//  Created by Andrey Lobanov on 22.03.2022.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletions() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
