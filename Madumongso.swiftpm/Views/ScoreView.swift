//
//  ScoreView.swift
//  Madumongso
//
//  Created by Zidan Ramadhan on 06/04/23.
//

import SwiftUI
import AVKit

struct ScoreView: View {
    @AppStorage("SCORE_COUNT") var score: Int = 0
    @AppStorage("HIGH_SCORE") var highScore: Int = 0
    @State var audioPlayer: AVAudioPlayer!
    @State var showAlertHighScore = false
    @Binding var shouldPopToRootView: Bool
    
    
    var body: some View {
        ZStack {
            Image("Paper Background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Congratulations!\nYou have successfully made Madumongso!")
                    .secondaryTitle()
                    .frame(width: 1067, height: 120)
                Image("Icon Madumongso")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300, alignment: .center)
                HStack {
                    if score > 60 {
                        Image(systemName: "star.fill")
                            .winStarIcon()
                        Image(systemName: "star.fill")
                            .winStarIcon()
                        Image(systemName: "star.fill")
                            .winStarIcon()
                    } else if score > 50 {
                        Image(systemName: "star.fill")
                            .winStarIcon()
                        Image(systemName: "star.fill")
                            .winStarIcon()
                        Image(systemName: "star.leadinghalf.filled")
                            .winStarIcon()
                    } else if score > 40{
                        Image(systemName: "star.fill")
                            .winStarIcon()
                        Image(systemName: "star.fill")
                            .winStarIcon()
                        Image(systemName: "star.slash")
                            .loseStarIcon()
                    } else if score > 30{
                        Image(systemName: "star.fill")
                            .winStarIcon()
                        Image(systemName: "star.leadinghalf.filled")
                            .winStarIcon()
                        Image(systemName: "star.slash")
                            .loseStarIcon()
                    } else if score > 20{
                        Image(systemName: "star.fill")
                            .winStarIcon()
                        Image(systemName: "star.slash")
                            .loseStarIcon()
                        Image(systemName: "star.slash")
                            .loseStarIcon()
                    } else if score > 10{
                        Image(systemName: "star.leadinghalf.filled")
                            .winStarIcon()
                        Image(systemName: "star.slash")
                            .loseStarIcon()
                        Image(systemName: "star.slash")
                            .loseStarIcon()
                    } else {
                        Image(systemName: "star.slash")
                            .loseStarIcon()
                        Image(systemName: "star.slash")
                            .loseStarIcon()
                        Image(systemName: "star.slash")
                            .loseStarIcon()
                    }
                }
               
                HStack {
                    Image(systemName: "medal.fill")
                    Text("YOUR SCORE: \(score)")
                }
                .font(.system(size: 40).weight(.heavy))
                .frame(width: 578, height: 70)
                .background(Color("Orange"))
                .foregroundColor(Color("Red"))
                .cornerRadius(20)
                .padding()
                
                Spacer()
                    .frame(height: 1)
                
                Text("HIGH SCORE: \(highScore)")
                    .font(.system(size: 30))
                    .fontWeight(.black)
                    .foregroundColor(Color("Red"))
                    .multilineTextAlignment(.center)
                    .frame(width: 320, height: 45)
                    .background(Color("Orange"))
                    .foregroundColor(Color("Red"))
                    .cornerRadius(20)
                    .alert(isPresented: $showAlertHighScore) {
                        Alert(title: Text("WELL DONE! YOU GET HIGH SCORE!"))
                    }
                
                Button (action: { self.shouldPopToRootView = false } ){
                    HStack {
                        Image(systemName: "house.fill")
                        Text("BACK TO HOME")
                    }
                    .font(.system(size: 30).weight(.heavy))
                    .frame(width: 370, height: 70)
                    .background(Color("Red"))
                    .foregroundColor(Color("White"))
                    .cornerRadius(20)
                    .shadow(color: Color("Shadow").opacity(0.7), radius: 8, y: 10)
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            let sound = Bundle.main.path(forResource: "Mountain Audio - Winning Trumpet", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.volume = 1.0
            self.audioPlayer.play()
            
            if score > highScore {
                showAlertHighScore = true
                highScore = score
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(shouldPopToRootView: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
