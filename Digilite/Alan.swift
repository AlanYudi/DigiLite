//
//  Alan.swift
//  Digilite
//
//  Created by found on 05/12/25.
//

import SwiftUI
import Charts

struct TempoUso: Identifiable {
    let id = UUID()
    let app: String
    let horas: Double
}

let dadosTempoUso = [
    TempoUso(app: "Instagram", horas: 3.2),
    TempoUso(app: "TikTok", horas: 2.7),
    TempoUso(app: "Youtube", horas: 4.1),
    TempoUso(app: "Mobile Legends", horas: 3.5)
]
struct GraficoTempoUso: View {
    var body: some View {
        Chart(dadosTempoUso) { item in
            BarMark(
                x: .value("App", item.app),
                y: .value("Horas de Uso", item.horas)
            )
            .foregroundStyle(.blue.opacity(0.8))
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .frame(height: 300)
        .padding()
    }
}
        
    


#Preview {
    GraficoTempoUso()
}
