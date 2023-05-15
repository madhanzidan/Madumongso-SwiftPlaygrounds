//
//  StirView.swift
//  Madumongso
//
//  Created by Zidan Ramadhan on 05/04/23.
//

import SwiftUI
import AVKit


struct StirView: View {

    @AppStorage("SCORE_COUNT") private var count: Int = 0
    @State var endRunning: Bool = false
    @Binding var rootIsActive : Bool
    @State var audioPlayer: AVAudioPlayer!
    @State var start = false
    @State var to: CGFloat = 1
    @State var maxTime = 20
    
    let totalTime: Int = 20
    
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
        .eraseToAnyPublisher()

    var body: some View {
        ZStack {
            Image("Paper Background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("STIR AS MUCH AS YOU CAN!")
                    .mainTitle()
                Spacer()
                    .frame(height: 60)
                HStack {
                    
                    //Timer
                    VStack {
                        VStack {
                            ZStack{
                                Circle()
                                    .trim(from: 0, to: 1)
                                    .stroke(Color("LightGrey"), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                                    .frame(width: 270, height: 270)
                                
                                Circle()
                                    .trim(from: 0, to: self.to)
                                    .stroke(Color("Orange"), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                                    .frame(width: 270, height: 270)
                                    .rotationEffect(.init(degrees: -90))
                                
                                
                                VStack {
                                    Text("TIME LEFT*")
                                        .font(.system(size: 30))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("Red"))
                                        .multilineTextAlignment(.center)
                                    Text("\(self.maxTime)s")
                                        .font(.system(size: 80))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("Orange"))
                                }
                            }
                            .onAppear() {
                                self.start.toggle()
                            }
                            .onReceive(self.timer) { (_) in
                                if self.start {
                                    if self.maxTime > 0 {
                                        self.maxTime -= 1
                                        withAnimation(.default) {
                                            self.to = CGFloat(self.maxTime) / CGFloat(totalTime)
                                        }
                                    } else {
                                        endRunning = true
                                    }
                                }
                            }
                        }
                        Spacer()
                            .frame(height: 25)
                        Text("*The actual time is 1 hour")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Red"))
                            .multilineTextAlignment(.center)
                    }

                    
                    Spacer()
                        .frame(width: 100)
                    
                    if !endRunning {
                        VStack {
                            Text("SWIPE RIGHT\nTHE PAN TO STIR")
                                .instructionText()
                                .frame(height: 98)
                              
                            Spacer()
                                .frame(height: 0)
                            Image("SwipePan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 510, height: 350 , alignment: .center)
                                .gesture (
                                    DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                        .onEnded { value in
                                            if value.translation.width > 0 && abs(value.translation.height) < abs(value.translation.width) {
                                                self.count += 1
                                            }
                                        }
                                )
                            
                            .allowsHitTesting(true)
                        }
                            
                    } else {
                        
                        //Navigation Link Pop To Root
                        NavigationLink(
                            destination: ScoreView(shouldPopToRootView: self.$rootIsActive)
                                .onAppear {
                                    let sound = Bundle.main.path(forResource: "Paper-Scroll-6", ofType: "mp3")
                                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                                    self.audioPlayer.volume = 1.0
                                    self.audioPlayer.play()
                                }
                        ) {
                            PrimaryButton(text: "FINISH", image: "flag.checkered.2.crossed")
                                .shadow(color: Color("Shadow").opacity(0.7), radius: 8, y: 10)
                            
                        }
                        .isDetailLink(false)
                        

                        
                    }

                }

                Spacer()
                    .frame(height: 70)
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color("Orange"))
                        .frame(width: 500, height: 80)
                    Text("SCORE: \(count)")
                        .font(.system(size: 50))
                        .fontWeight(.black)
                        .foregroundColor(Color("Red"))
                        .multilineTextAlignment(.center)
                }

            }
        }
        .navigationBarHidden(true)
        .onAppear {
            count = 0
        }
    }
}

struct StirView_Previews: PreviewProvider {
    static var previews: some View {
        StirView(rootIsActive: .constant(true)).previewInterfaceOrientation(.landscapeLeft)
    }
}
