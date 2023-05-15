import SwiftUI
import AVKit

struct HomeView: View {
    
    @State var audioPlayer1: AVAudioPlayer!
    @State var audioPlayer2: AVAudioPlayer!
    
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Paper Background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Image("Journey of Madumongso Title")
                        .homeTitle()
                        .frame(width: 150 ,height: 180 ,alignment: .center)
                    Spacer()
                    
                    Image("Icon Madumongso")
                        .mainImage()
                        .frame(width: 400 ,height: 400 ,alignment: .center)
                    Spacer()

                    //Navigation with pop to root
                    NavigationLink(
                        destination: History1View(rootIsActive: self.$isActive)
                            .onAppear {
                                let sound = Bundle.main.path(forResource: "Positive-click-button-17", ofType: "mp3")
                                self.audioPlayer2 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                                self.audioPlayer2.volume = 1.0
                                self.audioPlayer2.play()
                            }
                        ,isActive: self.$isActive
                    ) {
                        PrimaryButton(text: "START", image: "play.fill")
                            .shadow(color: Color("Shadow").opacity(0.7), radius: 8, y: 10)
                    }
                    .isDetailLink(false)
                    
                }
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "Cooking", ofType: "mp3")
            self.audioPlayer1 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer1.numberOfLoops = -1
            self.audioPlayer1.volume = 0.7
            self.audioPlayer1.play()
        }
        .navigationViewStyle(.stack)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
