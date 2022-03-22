//
//  AddView.swift
//  SwiftUI ToDo
//
//  Created by Andrey Lobanov on 22.03.2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var itemColor = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Напиши что-нибудь...", text: $textFieldText)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(itemColor)
                    .cornerRadius(14)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Добавить")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 60)
                        .frame(maxWidth: 200)
                        .background(Color.accentColor)
                        .cornerRadius(14)
                }
                
            }
            .padding(14)
        }
        .navigationTitle("Добавить Задачу")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Твоя задача должна содержать хотя бы 3 буквы 🙄"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert  {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
