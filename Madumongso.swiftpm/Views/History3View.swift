//
//  History3View.swift
//  Madumongso
//
//  Created by Zidan Ramadhan on 08/04/23.
//

import SwiftUI
import AVKit

struct History3View: View {
    
    @State var audioPlayer: AVAudioPlayer!
    @Binding var rootIsActive: Bool
    
    var body: some View {
        ZStack {
            Image("Paper Background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("HISTORY OF MADUMONGSO")
                    .mainTitle()
                Spacer()
                    .frame(height: 70)
                Image("History-3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 888, height: 333, alignment: .center)
                    .padding()
                Spacer()
                    .frame(height: 1)
                Text("Therefore, they created Madumongso as a\nsubstitute for dates.")
                    .descriptionText()
                    .multilineTextAlignment(.center)
                    .frame(height: 119)
                    .padding()
                
                //Navigation Link Pop To Root
                NavigationLink(
                    destination: IngredientsView(rootIsActive: self.$rootIsActive)
                        .onAppear {
                            let sound = Bundle.main.path(forResource: "Positive-click-button-17", ofType: "mp3")
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                            self.audioPlayer.volume = 1.0
                            self.audioPlayer.play()
                        }
                ) {
                    
                    PrimaryButton(text: "LET'S COOK", image: "fork.knife")
                        .shadow(color: Color("Shadow").opacity(0.7), radius: 8, y: 10)
                        .offset(y: -35)
                    
                }
                .isDetailLink(false)
                
            }
        }
    }
}

struct History3View_Previews: PreviewProvider {
    static var previews: some View {
        History3View(rootIsActive: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
