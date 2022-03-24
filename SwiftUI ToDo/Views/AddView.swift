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
    
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    TextField("Напиши что-нибудь...", text: $textFieldText)
                        .frame(height: 55)
                        .padding(.horizontal)
                        .background(Color("Item"))
                        .cornerRadius(14)
                    
                    Button {
                        saveButtonPressed()
                    } label: {
                        Text(LocalizedStringKey("Добавить"))
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
        .background(Color("Background"))
        .environment(\.locale, .current)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert  {
        return Alert(title: Text("alertMessage"))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
    }
}
