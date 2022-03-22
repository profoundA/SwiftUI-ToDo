//
//  AddView.swift
//  SwiftUI ToDo
//
//  Created by Andrey Lobanov on 22.03.2022.
//

import SwiftUI

struct AddView: View {
    
    @State var itemColor = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Напиши что-нибудь...", text: $textFieldText)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(itemColor)
                    .cornerRadius(14)
                
                Button {
                    
                } label: {
                    Text("Добавить")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: 170)
                        .background(Color.accentColor)
                        .cornerRadius(14)
                }

            }
            .padding(14)
        }
        .navigationTitle("Добавить Задачу")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
