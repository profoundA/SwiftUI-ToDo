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
    @State var backgroundColor = Color(#colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705254436, alpha: 1))
    
    var body: some View {
        ZStack {
            
            VStack {
                
                if listViewModel.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    
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
                    
                    NavigationLink {
                        AddView()
                    } label: {
                        AddButtonView()
                    }
                    .padding(.bottom, 40)
                }
            }
            .background(backgroundColor)
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Задачи📝")
        .environment(\.editMode, .constant(isEditing ? EditMode.inactive : EditMode.active))
        .animation(.easeIn, value: isEditing)
        
        
        .toolbar {
            Button {
                isEditing.toggle()
            } label: {
                Text(isEditing ? "Изменить" : "Готово")
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
