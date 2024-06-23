//
//  ContentView.swift
//  SwiftUIDay4
//
//  Created by DY S on 6/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showLoginAlert = false
    @State private var showSignInAlert = false
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            VStack {
                Spacer().frame(height: 160)
                
                createLabelWithSpacer(text: "YOUR\nART\nMUSEUM", font: .system(size: 32, weight: .bold))
                
                Spacer().frame(height: 17)
                
                createLabelWithSpacer(text: "151 3rd St\nSan Francisco, CA 94103", font: .system(size: 16))
                    .padding(.bottom, 20)
                
                EmailInputView()
                
                Spacer().frame(height: 30)
                
                GeometryReader { geometry in
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                self.showLoginAlert = true
                            }, label: {
                                Text("Log In")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                    .padding()
                                    .frame(width: geometry.size.width - 120)
                                    .background(.red)
                            })
                            .padding(.bottom, 20)
                            .alert(isPresented: $showLoginAlert, content: {
                                Alert(title: Text("로그인"), message: Text("로그인을 진행합니다."))
                            })
                            
                            Spacer()
                        }
                        
                        HStack {
                            Spacer().frame(width: 60)
                            // 회원가입 문구 버튼
                            Button(action: {
                                self.showSignInAlert = true
                            }, label: {
                                Text("Don’t have an account?")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                    .multilineTextAlignment(.leading)
                            })
                            .alert(isPresented: $showSignInAlert, content: {
                                Alert(title: Text("회원가입"), message: Text("회원가입 화면으로 이동합니다."))
                            })
                            Spacer()
                        }
                        
                        Spacer()
                    }
                }
            }
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    ContentView()
}

@ViewBuilder
private func createLabelWithSpacer(text: String, font: Font?) -> some View {
    HStack {
        Spacer().frame(width: 60)
        
        Text(text)
            .font(font)
            .foregroundStyle(.white)
            .multilineTextAlignment(.leading)
        
        Spacer()
    }
}

