//
//  SwiftUIView.swift
//  
//
//  Created by Zidan Ramadhan on 08/04/23.
//

import SwiftUI

struct SecondaryButton: View {
    var text: String
    var image: String
    var body: some View {
        HStack {
            Image(systemName: image)
            Spacer()
                .frame(width: 20)
            Text(text)
        }
        .font(.system(size: 40).weight(.heavy))
        .frame(width: 222, height: 71)
        .background(Color("Red"))
        .foregroundColor(Color("White"))
        .cornerRadius(20)
        .padding()
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(text: "NEXT", image: "arrow.right")
    }
}
