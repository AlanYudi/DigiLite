//
//  Alan.swift
//  Digilite
//
//  Created by found on 05/12/25.
//

import SwiftUI
import SwiftUIExtras
import SwiftData
//import Charts
//
//struct TempoUso: Identifiable {
//    let id = UUID()
//    let app: String
//    let horas: Double
//}
//
//let dadosTempoUso = [
//    TempoUso(app: "Instagram", horas: 3.2),
//    TempoUso(app: "TikTok", horas: 2.7),
//    TempoUso(app: "Youtube", horas: 4.1),
//    TempoUso(app: "Mobile Legends", horas: 3.5)
//]
//struct GraficoTempoUso: View {
//    var body: some View {
//        Chart(dadosTempoUso) { item in
//            BarMark(
//                x: .value("App", item.app),
//                y: .value("Horas de Uso", item.horas)
//            )
//            .foregroundStyle(.blue.opacity(0.8))
//        }
//        .chartYAxis {
//            AxisMarks(position: .leading)
//        }
//        .frame(height: 300)
//        .padding()
//    }
//}
//        
//    
//
//
//#Preview {
//    GraficoTempoUso()
//}
struct apps: Identifiable {
    let id = UUID()
    let nome: String
    let descricao: String
    let imagem: String
//    @State
//    var appsData: [apps] = ["Instagram", "TikTok", "Youtube", "Mobile Legends"]
}



struct AppList: View {
    
    let appslist: [apps] = [
            apps(nome: "Instagram", descricao: "Rede social para fotos e vídeos", imagem: "camera"),
            apps(nome: "TikTok", descricao: "Vídeos curtos e divertidos", imagem: "play.rectangle"),
            apps(nome: "YouTube", descricao: "Plataforma de vídeos", imagem: "tv"),
            apps(nome: "Mobile Legends", descricao: "Jogo de estratégia MOBA", imagem: "gamecontroller")
        ]
    var body: some View {

        List(appslist) { app in
            NavigationLink(destination: Text("Detalhe do App: \(app.nome)")){
    
                HStack {
                    Image(systemName: app.imagem)
                        .resizable()
                        .frame(width: 44, height: 44)
                        .foregroundColor(.white)
                    Text(app.nome)
                    Spacer()
                
                }
    
            }
            .listRowBackground(Color.clear)
            .padding() //adicionando um padding ao redor do Hstack para dar espaçamento interno. Padding é uma almofada que cria espaço entre o conteúdo e a borda da view.
           
            .background(Color.blue)
            .background(.black.opacity(1.0))//definindo a cor de fundo do cartão como azul / tenho que ver se azul é a cor correta.
           
            .cornerRadius(16) // arredondando os cantos do cartão com um raio de 16 pontos.
            .shadow(radius: 5) //adicionando uma sombra ao redor do cartão com um raio de 5 pontos.
            .padding(.horizontal) //adicionando padding horizontal ao redor do cartão para dar espaçamento nas laterais, opcionalmente.
//.padding()
//.background(Color.blue)
//.padding(.horizontal)
        }.frame(width: 480)
        
    }
    
}


    
struct SearchExample: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            TextField("Buscar...", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding()
                
            }
        }
    }

#Preview {
    VStack{
        SearchExample()
        AppList()
    }
    
}
