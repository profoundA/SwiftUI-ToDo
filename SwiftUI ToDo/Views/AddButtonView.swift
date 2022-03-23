//
//  AddButtonView.swift
//  SwiftUI ToDo
//
//  Created by Andrey Lobanov on 23.03.2022.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        ZStack {
        Image(systemName: "plus.circle.fill")
            .font(.system(size: 70))
            .background(
            Circle()
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
            )
        }
        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 0)
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        AddButtonView()
        }
        .previewLayout(.sizeThatFits)
    }
}
