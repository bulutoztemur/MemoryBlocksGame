//
//  TimeCounterView.swift
//  MemoryBlocks
//
//  Created by bulut.oztemur on 13.09.24.
//

import SwiftUI

struct TimeCounterView: View {
    @State private var timeElapsed: Int = 0
    @Binding private var timerActive: Bool
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(timerActive: Binding<Bool>) {
        self._timerActive = timerActive
    }

    var body: some View {
        VStack {
            Text("\(secondsToHoursMinutesSeconds(timeElapsed))")
                .font(.largeTitle)
        }
        .onReceive(timer) { _ in
            if timerActive {
                timeElapsed += 1
            }
        }
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 3600) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
}

struct TimeCounterView_Previews: PreviewProvider {
    static var previews: some View {
        TimeCounterView(timerActive: .constant(true))
    }
}
