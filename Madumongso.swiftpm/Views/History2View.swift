//
//  History2View.swift
//  Madumongso
//
//  Created by Zidan Ramadhan on 08/04/23.
//

import SwiftUI
import AVKit

struct History2View: View {
    
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
                HStack {
                    Image("History-2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 413, height: 520, alignment: .center)
                    Spacer()
                        .frame(width: 20)
                    Text("It was originally invented by people from Ponorogo, East Java who went on hajj pilgrimage.\n\nDuring their pilgrimage, they often consumed dates, but back then it was hard to find them back in Indonesia. ")
                        .descriptionText()
                        .multilineTextAlignment(.leading)
                        .frame(width: 550)
                        .padding()
                }
                
                HStack {
                    Spacer()
                    
                    //Navigation Link Pop To Root
                    NavigationLink(
                        destination: History3View(rootIsActive: self.$rootIsActive)
                            .onAppear {
                                let sound = Bundle.main.path(forResource: "Paper-Scroll-6", ofType: "mp3")
                                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                                self.audioPlayer.volume = 1.0
                                self.audioPlayer.play()
                            }
                    ) {
                        
                        SecondaryButton(text: "NEXT", image: "arrow.right")
                            .shadow(color: Color("Shadow").opacity(0.7), radius: 8, y: 10)
                            .offset(y: -20)
                    }
                    .isDetailLink(false)
                }
            }
        }
    }
}

struct History2View_Previews: PreviewProvider {
    static var previews: some View {
        History2View(rootIsActive: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
