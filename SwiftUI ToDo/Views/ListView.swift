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
        ZStack {
            VStack {
                if listViewModel.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.8)))
                } else {
                    List {
                        ForEach(listViewModel.items) { item in
                            TaskView(item: item)
                                .onTapGesture {
                                    withAnimation(.easeIn(duration: 0.05)) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                        .listRowBackground(Color("Item"))
                    }

                    NavigationLink {
                        AddView()
                    } label: {
                        AddButtonView()
                    }
                    .padding(.bottom, 40)
                }
            }
            .background(Color("Background"))
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Задачи📝")
        .environment(\.editMode, .constant(isEditing ? EditMode.inactive : EditMode.active))
        .animation(.easeIn, value: isEditing)
        .onAppear {
            UITableView.appearance().backgroundColor = UIColor(named: "Background")
        }
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
        .previewInterfaceOrientation(.portrait)
    }
}
