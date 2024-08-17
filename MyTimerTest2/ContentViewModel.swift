//
//  ContentViewModel.swift
//  MyTimerTest2
//
//  Created by MsMacM on 2024/08/17.
//  https://developer.apple.com/documentation/foundation/timer/3329589-publish

import Foundation
import Combine

final class ContentViewModel: ObservableObject{
    @Published var count = 0
    @Published var isTimerRunning = false
    
    private var cancellable: AnyCancellable?
    
    func startCounting() {
        isTimerRunning = true
        cancellable = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
            .sink{_ in
                self.count += 1
            }
    }
    func stopCounting() {
        isTimerRunning = false
        cancellable?.cancel()
    }
    func resetCount() {
        count = 0
    }
}
