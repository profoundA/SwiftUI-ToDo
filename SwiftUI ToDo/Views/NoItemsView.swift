//
//  NoItemsView.swift
//  SwiftUI ToDo
//
//  Created by Andrey Lobanov on 22.03.2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate = false
    let secondColor = Color("SecondColor")
    
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Задач нет☹️")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Ты же продуктивный? Нажми на кнопку и добавь несколько!😉🤪😁")
                        .padding(.bottom, 40)
                    NavigationLink(destination: AddView()) {
                        Text("КНОПКА 🥳")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondColor : .accentColor)
                            .cornerRadius(10)
                }
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: animate ? secondColor.opacity(0.7) : .accentColor.opacity(0.7),
                            radius: animate ? 30 : 9,
                            x: 0,
                            y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1)
                    .offset(y: animate ? -12 : 0)
                }
                .frame(maxWidth: 400)
                .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
            }
            .frame(maxWidth: .infinity , maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(
                .easeInOut(duration: 2)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
        }
        .navigationTitle("")
    }
}
