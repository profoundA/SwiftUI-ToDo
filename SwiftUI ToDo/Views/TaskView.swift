//
//  TaskView.swift
//  SwiftUI ToDo
//
//  Created by Andrey Lobanov on 22.03.2022.
//

import SwiftUI

struct TaskView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .font(.title2)
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.body)
        .padding(.vertical, 9)
    }
}

struct TaskView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "Item", isCompleted: true)
    static var item2 = ItemModel(title: "Item2", isCompleted: false)
    
    static var previews: some View {
        Group {
            TaskView(item: item1)
            TaskView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
