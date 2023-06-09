//
//  ContentView.swift
//  ProfileApp
//
//  Created by Kaplan2 on 02/06/23.
//

import SwiftUI

struct ContentView: View {
    var imagesArray = ["heart.fill","globe","message.badge.filled.fill","iphone.gen3.slash.circle"]
    var keyvalues = ["Applications":"1775","Followers":"800","Following":"231"]
    
    var body: some View {
        ZStack {
            bgView
            ScrollView {
                VStack {
                    topView
                    VStack (spacing: 30) {
                        followButton
                        HStack(spacing: 40) {
                            ForEach(keyvalues.sorted(by: { $0.key < $1.key }), id: \.key) {
                                key , value in
                                VStack(spacing:5) {
                                    Text(value).fontWeight(.bold)
                                    Text(key).font(.footnote)
                                }.fontDesign(.monospaced)
                            }
                        }.frame(maxWidth: .infinity)
                            .padding()
                        Text("About You")
                            .font(.title)
                            .fontWeight(.medium)
                        Text("I'm a iOS Frontend Developer. Welcome to the series of OS-15 projects. Let's dive deeper and create some more exciting projects.")
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .fontDesign(.monospaced)
                            .padding()
                            .truncationMode(.middle)
                    }
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var bgView: some View {
        Rectangle()
            .ignoresSafeArea(.all)
            .foregroundColor(Color.clear)
            .background(
                Gradient(colors: [Color.orange,Color.white])
            )
    }
    
    var topView: some View {
        VStack(spacing:10) {
            Image("profile").resizable()
                .frame(width: 180,height: 180)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .shadow(color: .red, radius: 5,x: 5)
            Text("Jagan Mohana Reddy")
                .fontWeight(.black)
                .fontDesign(.monospaced)
                .font(.title)
            Text("iOS Application Developer")
                .fontDesign(.monospaced)
                .underline(pattern: .dashDotDot)
            HStack(spacing: 50) {
                ForEach(imagesArray, id: \.self) { image in
                    Button {
                        print(image)
                    } label: {
                        Image(systemName: image)
                            .resizable()
                            .frame(width: 30,height: 30)
                            .shadow(color: .teal, radius: 2,x: 2,y: 2)
                    }.tint(Color.black)
                    
                }
            }.frame(maxWidth: .infinity)
                .padding()
            
        }.padding()
    }
    
    var followButton: some View {
        RoundedRectangle(cornerRadius: 22.5)
            .frame(width: 180,height: 55)
            .foregroundColor(.white)
            .shadow(color: .pink, radius: 5,x: 2,y: 2)
            .overlay(
                Button(action: {
             
                }, label: {
                    Text("Follow")
                        .foregroundColor(.pink)
                        .font(.title3)
                        .fontWeight(.medium)
                        .fontDesign(.monospaced)
                })
            )
    }
}
