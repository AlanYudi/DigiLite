import SwiftUI

// MARK: - Linha reutilizável de configuração
struct SettingsRow: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.body)
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.bottom, 1)
    }
}

// MARK: - Tela de Configurações do App
struct ConfiguracoesTela: View {

    // Dados recebidos do App selecionado
    let appNome: String
    let appIcone: String

    // Estados
    @State private var notificationsDisabled = false

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {

                // Nome do App
                Text(appNome)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                // Ícone do App
                Image(systemName: appIcone)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .padding(30)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.blue, .cyan]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(25)
                    .shadow(radius: 10)

                // Opções de Configuração
                VStack(spacing: 0) {

                    SettingsRow(title: "Colocar Senha")

                    SettingsRow(title: "Definir limite de tela")

                    HStack {
                        Text("Desativar Notificações")
                            .font(.body)

                        Spacer()

                        Toggle("", isOn: $notificationsDisabled)
                            .labelsHidden()
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                .padding(.horizontal)

                Spacer()
            }
        }
        .navigationTitle("Configurações")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        ConfiguracoesTela(
            appNome: "Instagram",
            appIcone: "camera"
        )
    }
}
