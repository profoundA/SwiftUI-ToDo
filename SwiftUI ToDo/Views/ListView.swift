//
//  ListView.swift
//  SwiftUI ToDo
//
//  Created by Andrey Lobanov on 22.03.2022.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
    ItemModel(title: "Задача", isCompleted: true)
    ]
    
    @State var isEditting: Bool = false
    
    var body: some View {
        List {
            ForEach(items) { item in
                TaskView(item: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Задачи📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.isEditting.toggle()
                } label: {
                    Text(isEditting ? "Готово" : "Изменить")
                }

            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Добавить") {
                   AddView()
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


