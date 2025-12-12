import SwiftUI

// Componente auxiliar para as linhas de configuração (sem Toggle)
struct SettingsRow: View {
    var title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.body)
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6)) // Cor de fundo para simular a célula
        .cornerRadius(10)
        .padding(.bottom, 1) // Espaçamento entre as células
    }
}

// A nova View que contém a tela de configurações
struct SettingsView: View {
    // Estado para controlar o Toggle de "Desativar Notificações"
    @State private var notificationsDisabled = false

    var body: some View {
        // Usa um ScrollView para garantir que o conteúdo seja rolável em telas menores
        ScrollView {
            VStack(spacing: 30) {
                // 1. Título do Aplicativo
                Text("nome do app")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                // 2. Ícone do Aplicativo
                Image(systemName: "app.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .padding(30)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.cyan]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(25)
                    .shadow(radius: 10)

                // 3. Opções de Configuração
                VStack(spacing: 0) {
                    // Opção 1: Colocar Senha
                    SettingsRow(title: "Colocar Senha")

                    // Opção 2: Definir limite de tela
                    SettingsRow(title: "Definir limite de tela")

                    // Opção 3: Desativar Notificações (com Toggle)
                    HStack {
                        Text("Desativar Notificações")
                            .font(.body)
                        Spacer()
                        Toggle("", isOn: $notificationsDisabled)
                            .labelsHidden() // Esconde o label do Toggle
                    }
                    .padding()
                    .background(Color(.systemGray6)) // Cor de fundo para simular a célula
                    .cornerRadius(10)
                }
                .padding(.horizontal) // Adiciona padding horizontal para afastar das bordas
                
                Spacer() // Empurra o conteúdo para cima
            }
        }
        // Título da barra de navegação e botão de voltar
        .navigationTitle("Configurações")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    // Para ver a prévia da SettingsView com a barra de navegação
    NavigationView {
        SettingsView()
    }
}

