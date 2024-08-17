//
//  ContentViewModel.swift
//  MyTimerTest2
//
//  Created by MsMacM on 2024/08/17.
//  https://developer.apple.com/documentation/foundation/timer/3329589-publish

import Foundation
import Combine

final class ContentViewModel: ObservableObject{
    @Published var count :Int
    @Published var isTimerRunning = false
    init(count: Int, isTimerRunning: Bool = false, cancellable: AnyCancellable? = nil) {
        self.count = count
        self.isTimerRunning = isTimerRunning
        self.cancellable = cancellable
    }
    private var cancellable: AnyCancellable?
    
    func startCounting() {
        isTimerRunning = true
        cancellable = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
            .sink{_ in
                if (self.count > 0){
                    self.count -= 1
                } else {
                    self.isTimerRunning = false
                    self.cancellable?.cancel()
                }
            }
    }
    func stopCounting() {
        isTimerRunning = false
        cancellable?.cancel()
    }
    func resetCount() {
        count = 5
    }
}
