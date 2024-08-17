//
//  ContentView.swift
//  MyTimerTest2
//
//  Created by MsMacM on 2024/08/17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Button("Start"){
                viewModel.startCounting()
            }
            .disabled(viewModel.isTimerRunning)
            
            Button("Stop"){
                viewModel.stopCounting()
            }
            .disabled(!viewModel.isTimerRunning)
            .padding()
            
            Button("reset"){
                viewModel.stopCounting()
                viewModel.resetCount()
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}
