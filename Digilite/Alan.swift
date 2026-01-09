import SwiftUI
import SwiftUIExtras
import SwiftData

// MARK: - Modelo de App
struct AppModel: Identifiable {
    let id = UUID()
    let nome: String
    let descricao: String
    let imagem: String
}

// MARK: - Lista de Aplicativos
struct AppList: View {

    let appsList: [AppModel] = [
        AppModel(nome: "Instagram", descricao: "Rede social para fotos e vídeos", imagem: "camera"),
        AppModel(nome: "TikTok", descricao: "Vídeos curtos e divertidos", imagem: "play.rectangle"),
        AppModel(nome: "YouTube", descricao: "Plataforma de vídeos", imagem: "tv"),
        AppModel(nome: "Mobile Legends", descricao: "Jogo de estratégia MOBA", imagem: "gamecontroller")
    ]

    var body: some View {
        List(appsList) { app in
            NavigationLink(
                destination: ConfiguracoesTela(
                    appNome: app.nome,
                    appIcone: app.imagem
                )
            ) {
                HStack(spacing: 16) {
                    Image(systemName: app.imagem)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)

                    VStack(alignment: .leading) {
                        Text(app.nome)
                            .font(.headline)
                            .foregroundColor(.white)

                        Text(app.descricao)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }

                    Spacer()
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(16)
                .shadow(radius: 5)
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .navigationTitle("Aplicativos")
    }
}

// MARK: - Campo de Busca (Exemplo)
struct SearchExample: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            TextField("Buscar aplicativo...", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        VStack {
            SearchExample()
            AppList()
        }
    }
}
