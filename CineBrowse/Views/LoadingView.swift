//
//  LoadingView.swift
//  CineBrowse
//
//  Created by Sajan Lawrence on 19/10/25.
//

import SwiftUI
import Combine

struct LoadingView: View {
    let loadingText: [String] = "Loading all the data...".map({ String($0) })
    @State private var animate: Bool = false
    @State private var count: Int = 0
    @State private var loop: Int = 0
    @Binding var showLoadingView: Bool
    @State private var cancellable: AnyCancellable? = nil
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                HStack(spacing: 0){
                    ForEach(0..<loadingText.count) { index in
                        Text(loadingText[index])
                            .foregroundStyle(.white)
                            .bold()
                            .font(.subheadline)
                            .italic()
                            .offset(y: count == index ? -10 : 0)
                    }
                    
                }
            }
        }
        .onAppear(perform: startTimer)
    }
    
    func startTimer(){
        cancellable = Timer.publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { _ in
                animationLogic()
            })
    }
    
    func animationLogic(){
        withAnimation(.spring) {
            if count == loadingText.count - 1{
                count = 0
                loop += 1
                if loop == 3{
                    showLoadingView.toggle()
                    cancellable?.cancel()
                }
            }else{
                count += 1
            }
        }
    }
}

#Preview {
    LoadingView(showLoadingView: .constant(true))
}
