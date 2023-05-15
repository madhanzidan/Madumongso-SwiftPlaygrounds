//
//  IngredientsView.swift
//  Madumongso
//
//  Created by Zidan Ramadhan on 03/04/23.
//

import SwiftUI
import AVKit
struct IngredientsView: View {
    @GestureState var locationState1 = CGPoint(x: 180, y: 220)
    @GestureState var locationState2 = CGPoint(x: 105, y: 220)
    @GestureState var locationState3 = CGPoint(x: 180, y: 160)
    @GestureState var locationState4 = CGPoint(x: 105, y: 160)
    @GestureState var locationState5 = CGPoint(x: 180, y: 100)
    @GestureState var locationState6 = CGPoint(x: 105, y: 100)
    @State var location = CGPoint(x: 100, y: 100)
    
    @State private var isHidden1 = false
    @State private var isHidden2 = false
    @State private var isHidden3 = false
    @State private var isHidden4 = false
    @State private var isHidden5 = false
    @State private var isHidden6 = false
    
    @Binding var rootIsActive : Bool
    
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        ZStack {
            Image("Paper Background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                HStack {
                    VStack {
                        //MARK: - Ingredients Element
                        HStack {
                            if !isHidden1 {
                                Image("CoconutMilk")
                                    .iconImage()
                                    .padding(.leading)
                                    .position(locationState1)
                                    .gesture(
                                        DragGesture(
                                            coordinateSpace: .local
                                        )
                                        .onChanged({ value in
                                            self.location = value.location
                                        })
                                        .onEnded({ value in
                                            if value.location.x > 450 && value.location.y > 450 {
                                                withAnimation {
                                                    self.isHidden1 = true
                                                }
                                            } else {
                                                withAnimation {
                                                    self.location = CGPoint(x: 100, y: 100)
                                                }
                                            }
                                        })
                                        .updating(
                                            self.$locationState1
                                        ) { currentState, pastLocation, transaction  in
                                            pastLocation = currentState.location
                                            transaction.animation = .easeInOut
                                        }
                                    )
                            }
                            if !isHidden2 {
                                Image("BrownSugar")
                                    .iconImage()
                                    .padding(.leading)
                                    .position(locationState2)
                                    .gesture(
                                        DragGesture(
                                            coordinateSpace: .local
                                        )
                                        .onChanged({ value in
                                            self.location = value.location
                                        })
                                        .onEnded({ value in
                                            if value.location.x > 450 && value.location.y > 450 {
                                                withAnimation {
                                                    self.isHidden2 = true
                                                }
                                            } else {
                                                withAnimation {
                                                    self.location = CGPoint(x: 100, y: 100)
                                                }
                                            }
                                        })
                                        .updating(
                                            self.$locationState2
                                        ) { currentState, pastLocation, transaction  in
                                            pastLocation = currentState.location
                                            transaction.animation = .easeInOut
                                        }
                                    )
                            }
                        }
                        HStack {
                            if !isHidden3 {
                                Image("Sugar")
                                    .iconImage()
                                    .padding(.leading)
                                    .position(locationState3)
                                    .gesture(
                                        DragGesture(
                                            coordinateSpace: .local
                                        )
                                        .onChanged({ value in
                                            self.location = value.location
                                        })
                                        .onEnded({ value in
                                            if value.location.x > 450 && value.location.y > 450 {
                                                withAnimation {
                                                    self.isHidden3 = true
                                                }
                                            } else {
                                                withAnimation {
                                                    self.location = CGPoint(x: 100, y: 100)
                                                }
                                            }
                                        })
                                        .updating(
                                            self.$locationState3
                                        ) { currentState, pastLocation, transaction  in
                                            pastLocation = currentState.location
                                            transaction.animation = .easeInOut
                                        }
                                    )
                            }
                            if !isHidden4 {
                                Image("Tape")
                                    .iconImage()
                                    .padding(.leading)
                                    .position(locationState4)
                                    .gesture(
                                        DragGesture(
                                            coordinateSpace: .local
                                        )
                                        .onChanged({ value in
                                            self.location = value.location
                                        })
                                        .onEnded({ value in
                                            if value.location.x > 450 && value.location.y > 450 {
                                                withAnimation {
                                                    self.isHidden4 = true
                                                }
                                            } else {
                                                withAnimation {
                                                    self.location = CGPoint(x: 100, y: 100)
                                                }
                                            }
                                        })
                                        .updating(
                                            self.$locationState4
                                        ) { currentState, pastLocation, transaction  in
                                            pastLocation = currentState.location
                                            transaction.animation = .easeInOut
                                        }
                                    )
                            }
                        }
                        HStack {
                            if !isHidden5 {
                                Image("Salt")
                                    .iconImage()
                                    .padding(.leading)
                                    .position(locationState5)
                                    .gesture(
                                        DragGesture(
                                            coordinateSpace: .local
                                        )
                                        .onChanged({ value in
                                            self.location = value.location
                                        })
                                        .onEnded({ value in
                                            if value.location.x > 450 && value.location.y > 450 {
                                                withAnimation {
                                                    self.isHidden5 = true
                                                }
                                            } else {
                                                withAnimation {
                                                    self.location = CGPoint(x: 100, y: 100)
                                                }
                                            }
                                        })
                                        .updating(
                                            self.$locationState5
                                        ) { currentState, pastLocation, transaction  in
                                            pastLocation = currentState.location
                                            transaction.animation = .easeInOut
                                        }
                                    )
                            }
                            if !isHidden6 {
                                Image("Pandan")
                                    .iconImage()
                                    .padding(.leading)
                                    .position(locationState6)
                                    .gesture(
                                        DragGesture(
                                            coordinateSpace: .local
                                        )
                                        .onChanged({ value in
                                            self.location = value.location
                                        })
                                        .onEnded({ value in
                                            if value.location.x > 450 && value.location.y > 450 {
                                                withAnimation {
                                                    self.isHidden6 = true
                                                }
                                            } else {
                                                withAnimation {
                                                    self.location = CGPoint(x: 100, y: 100)
                                                }
                                            }
                                        })
                                        .updating(
                                            self.$locationState6
                                        ) { currentState, pastLocation, transaction  in
                                            pastLocation = currentState.location
                                            transaction.animation = .easeInOut
                                        }
                                    )
                            }
                        }
                    }
                    Spacer()
                        .frame(width: 20)
                    
                    //MARK: - Wok Poperties
                    VStack {
                        if isHidden1 == true && isHidden2 == true && isHidden3 == true && isHidden4 == true && isHidden5 == true && isHidden6 == true {
                            Text("LET'S STIR!")
                                .instructionText()
                                .frame(height: 48)
                                .padding()
                            Image("PanFilled")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 558, height: 186, alignment: .center)
                                .padding()
                                
                        } else {
                            Text("DRAG & DROP\nTHE INGREDIENTS\nTO THE PAN\n(BY ORDER)")
                                .instructionText()
                                .frame(height: 192)
                                .padding()
                            Image("ArrowDown")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 98, height: 141, alignment: .center)
                                .padding()
                            Image("Pan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 558, height: 186, alignment: .center)
                                .padding()
                        }
                        
                        
            
                    }

                }
                
                if isHidden1 == true && isHidden2 == true && isHidden3 == true && isHidden4 == true && isHidden5 == true && isHidden6 == true {
                    
                    //Navigation Link Pop To Root
                    NavigationLink(
                        destination: StirView(rootIsActive: self.$rootIsActive)
                            .onAppear {
                                let sound = Bundle.main.path(forResource: "Paper-Scroll-6", ofType: "mp3")
                                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                                self.audioPlayer.volume = 1.0
                                self.audioPlayer.play()
                            }
                    ) {
                        PrimaryButton(text: "STIR", image: "flame.fill")
                            .shadow(color: Color("Shadow").opacity(0.7), radius: 8, y: 10)
                    }
                    .isDetailLink(false)
                    .offset(y: -25)
                    
                }
            }
        }
        .navigationBarHidden(true)
    }
}


struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(rootIsActive: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
