//
//  ListView.swift
//  SwiftUI ToDo
//
//  Created by Andrey Lobanov on 22.03.2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var isEditing = true
    
    var body: some View {
        
        List {
            ForEach(listViewModel.items) { item in
                TaskView(item: item)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.2)) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(.plain)
        .navigationTitle("Задачи📝")
        .environment(\.editMode, .constant(isEditing ? EditMode.inactive : EditMode.active))
        .animation(.easeIn, value: isEditing)
        
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    isEditing.toggle()
                } label: {
                    Text(isEditing ? "Изменить" : "Готово")
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
        .environmentObject(ListViewModel())
    }
}
