//
//  History1View.swift
//  Madumongso
//
//  Created by Zidan Ramadhan on 02/04/23.
//

import SwiftUI
import AVKit

struct History1View: View {
    
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
                Image("History-1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 888, height: 333, alignment: .center)
                    .padding()
                Spacer()
                    .frame(height: 1)
                Text("Madumongso is a traditional snack from East Java,\nIndonesia. It made of black sticky rice tape, sugar, brown\nsugar, coconut milk, salt, and pandan leaf.")
                    .descriptionText()
                    .multilineTextAlignment(.center)
                    .frame(height: 119)
                    .padding()
                HStack {
                    Spacer()
                    
                    //Navigation Link Pop To Root
                    NavigationLink(
                        destination: History2View(rootIsActive: self.$rootIsActive)
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

struct History1View_Previews: PreviewProvider {
    static var previews: some View {
        History1View(rootIsActive: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
