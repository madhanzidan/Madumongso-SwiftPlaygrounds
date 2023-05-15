//
//  Extensions.swift
//  Madumongso
//
//  Created by Zidan Ramadhan on 02/04/23.
//

import Foundation
import SwiftUI

extension Image {
    func homeTitle() -> some View {
        self.resizable()
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .scaledToFill()
        
    }
    func mainImage() -> some View {
        self.resizable()
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .scaledToFill()
    }
    func iconImage() -> some View {
        self.resizable()
            .scaledToFit()
            .frame(width: 200, height: 200, alignment: .center)
    }
    
    func winStarIcon() -> some View {
        self.resizable()
            .scaledToFit()
            .foregroundColor(Color("Gold"))
            .font(.system(size: 100).weight(.heavy))
            .frame(width: 70, height: 70)
    }
    
    func loseStarIcon() -> some View {
        self.resizable()
            .scaledToFit()
            .foregroundColor(Color("Grey"))
            .font(.system(size: 100).weight(.heavy))
            .frame(width: 70, height: 70)
    }
}


