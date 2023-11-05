//
//  ContentView.swift
//  PulseAnimation
//
//  Created by Manoj Aher on 05/11/23.
//

import SwiftUI

struct ContentView: View {
	private let pulseCount: Int = 4
	private let animationInterval: TimeInterval = 5
	private let primaryColor: Color = .primary
	@State private var animating: Bool = false

	var body: some View {
		ZStack {
			ForEach(0..<pulseCount, id: \.self) { index in
				Circle()
					.stroke(
						primaryColor.opacity(animating ? 0.0 : 1.0),
						style: StrokeStyle(lineWidth: animating ? 0.0 : 10.0))
					.scaleEffect(animating ? 1.0 : 0.0)
					.animation(.easeOut(duration: animationInterval)
						.repeatForever(autoreverses: false)
						.delay(Double(index) * animationInterval / Double(pulseCount)),
							   value: animating)
			}
		}
		.padding()
		.onAppear {
			animating.toggle()
		}
	}
}

#Preview {
	ContentView()
}
