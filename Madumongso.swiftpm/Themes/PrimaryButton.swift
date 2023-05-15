//
//  PrimaryButton.swift
//  Madumongso
//
//  Created by Zidan Ramadhan on 02/04/23.
//

import Foundation
import SwiftUI

struct PrimaryButton: View {
    var text: String
    var image: String
    var body: some View {
        HStack {
            Image(systemName: image)
            Spacer()
                .frame(width: 20)
            Text(text)
        }
        .font(.system(size: 60).weight(.heavy))
        .frame(width: 500, height: 120)
        .background(Color("Red"))
        .foregroundColor(Color("White"))
        .cornerRadius(20)
        .padding()
            
        
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Test", image: "play.fill")
    }
}
