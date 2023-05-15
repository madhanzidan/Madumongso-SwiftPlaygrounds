//
//  Extensions+Text.swift
//  Madumongso
//
//  Created by Zidan Ramadhan on 02/04/23.
//

import Foundation
import SwiftUI

extension Text {
    func mainTitle() -> some View {
        self.font(.system(size: 50))
            .fontWeight(.black)
            .foregroundColor(Color("Grey"))
            .multilineTextAlignment(.center)
    }
    func secondaryTitle() -> some View {
        self.font(.system(size: 40))
            .fontWeight(.black)
            .foregroundColor(Color("Grey"))
            .multilineTextAlignment(.center)
    }
    func descriptionText() -> some View {
        self.font(.system(size: 30))
            .fontWeight(.bold)
            .foregroundColor(Color("Grey"))
    }
    func instructionText() -> some View {
        self.font(.system(size: 40))
            .fontWeight(.bold)
            .foregroundColor(Color("Red"))
            .multilineTextAlignment(.center)
    }
}
