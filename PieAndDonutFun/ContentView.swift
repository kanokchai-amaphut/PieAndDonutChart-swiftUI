//
//  ContentView.swift
//  PieAndDonutFun
//
//  Created by Kanokchai Amaphut on 10/5/2567 BE.
//

import SwiftUI
import Charts

struct ChartData: Identifiable, Plottable {
    init?(primitivePlottable: Int) {
        self.primitivePlottable = primitivePlottable
        self.color = .blue
    }
    
    init?(primitivePlottable: Int, color: Color) {
        self.primitivePlottable = primitivePlottable
        self.color = color
    }
    
    var id = UUID()
    var primitivePlottable: Int
    let color: Color
}

let data: [ChartData] = [
    .init(primitivePlottable: 12, color: .red),
    .init(primitivePlottable: 6, color: .blue),
    .init(primitivePlottable: 32, color: .orange),
    .init(primitivePlottable: 11, color: .green),
    .init(primitivePlottable: 38, color: .purple),
    .init(primitivePlottable: 18, color: .pink),
    .init(primitivePlottable: 7, color: .yellow)
].compactMap({ $0 })

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Chart(data) { item in
                    SectorMark(angle: .value("Label", item),
                               innerRadius: .ratio(0.5),
                               angularInset: 5)
                        .foregroundStyle(item.color)
                }
            }
            .navigationTitle("Pie Charts")
        }
    }
}

#Preview {
    ContentView()
}
