import Charts


import SwiftUI

struct NavigationCard<Destination: View>: View {
   
    let title: String
    let subtitle: String
    let icon: String
    let destination: Destination
    var body: some View {
        NavigationLink(destination: destination) {
            
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .foregroundColor(.white.opacity(1.0))
                }
                
                Spacer()
                
            }
            
            .padding()
            .background(Color.blue)
            .background(.black.opacity(1.0))
            
            .cornerRadius(16)
            .shadow(radius: 5)
            .padding(.horizontal)
        }
    }
}
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
        
struct HomeView: View {
    var body: some View {

            
            
            
            NavigationStack {
                VStack(spacing: 20) {
                    
                    NavigationCard(
                        title: "Gerenciamento de apps",
                        subtitle: "limitar o tempo de uso de um aplicativo, pôr uma senha,desativar as notificações.",
                        icon: "gear",
                        destination: AppList()
                    )

                    NavigationCard(
                        title: "Controle dos pais",
                        subtitle: "configurar restrições para crianças, bloquear conteúdo impróprio.",
                        icon: "person.2.fill",
                        destination: Text("Controle dos pais")
                    )
                    
                    NavigationCard(
                        title: "Privacidade e segurança",
                        subtitle: "gerenciar permissões de aplicativos, configurar VPN, ajustar configurações de localização.",
                        icon: "lock.shield.fill",
                        destination: Text("Privacidade e segurança")
                    )
                    
                    Spacer()
                }
            }
        }
    }
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            VStack{
                GraficoTempoUso()
                HomeView()
            }
        }
    }
 
}

@main
struct ConfigApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
