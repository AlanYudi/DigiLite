// Seu ContentView original (com a adição do NavigationView e do NavigationLink)
import SwiftUI
// import SwiftUIExtras // Mantenha se for necessário, senão remova

struct ContentView: View {
    var body: some View {
        // O NavigationView é crucial para que a navegação e o botão de voltar funcionem
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                // Adiciona um link para a nova tela de configurações
                NavigationLink(destination: SettingsView()) {
                    Text("Abrir Configurações")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 50)
            }
            .padding()
            .navigationTitle("Home") // Título da tela principal
        }
    }
}

// ... e logo abaixo, o código da SettingsRow e SettingsView que você colou ...
// ... (O código que você forneceu) ...

