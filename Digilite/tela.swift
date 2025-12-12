//Nome: Celso José Uchôa Barbosa /
//Data: 06/12/2025 /
//Objetivo: Criando tela swiftUI com cards de navegação reutilizáveis com parâmetros moldáveis/

import Charts


import SwiftUI //importando o framework SwiftUI para criar interfaces de usuário declarativas.


//Passo 1: Criar uma estrutura genérica que aceita parâmetros moldáveis, um molde, para reutilizar a view de navegação em diferentes partes do app.

struct NavigationCard<Destination: View>: View { //Criando uma view de navegação reutilizável. , Destination significa o tipo da view destino. significa que o destino pode ser qualquer view SwiftUI.
   
    let title: String      //aqui teremos as propriedades que a view precisa para ser configurada.
    let subtitle: String   //subtítulo do cartão de navegação. seria a descrição.
    let icon: String        //nome do sistema de ícone SF Symbols. Iremos coloar um ícone no cartão.
    let destination: Destination    //a view destino que será navegada quando o cartão for tocado.
   
    var body: some View { //aqui definimos o corpo da View ou seja, como ela será exibida na tela. e como ela se comporta.
     
     //Primeiro criamos um navigation link, que podemos tocar para navegar para outra view.


        NavigationLink(destination: destination) { //NavigationLink cria um link de navegação para a view destino especificada/ a view destino estará dentro do parênteses.


            HStack(spacing: 16) { // Hstack para organizar os elementos horizontalmente com espaçamento ( Spacing ) de 16 pontos entre eles.
               
                Image(systemName: icon) //personalizando o Hstack com um ícone.
                    .font(.system(size: 28)) //definindo o tamanho da fonte do ícone.
                    .foregroundColor(.white) //definindo a cor do ícone como branco.
                 
                 //criando uma pilha vertical para o título e subtítulo.


                VStack(alignment: .leading) { //Vstack para organizar os elementos verticalmente, alinhados à esquerda.
                    Text(title) //título do cartão de navegação.
                        .font(.headline) //definindo a fonte do título como headline.
                        .foregroundColor(.black) //definindo a cor do título como branco.
                   
                    //adicionando o subtítulo abaixo do título.
                    Text(subtitle) //subtítulo do cartão de navegação.
                        .font(.subheadline) //definindo a fonte do subtítulo como subheadline que é uma fonte que simula um subtítulo.
                        .foregroundColor(.black)
                        .foregroundColor(.white.opacity(1.0)) //definindo a cor do subtítulo como branco com opacidade de 80% sendo a opacidade a transparência da cor.
                } //fim do Vstack
               
                Spacer() //Criando um espaçador que vai deixar o visual mais agradável e empurrar os elementos para a esquerda.


            } //fim do Hstack




            .padding() //adicionando um padding ao redor do Hstack para dar espaçamento interno. Padding é uma almofada que cria espaço entre o conteúdo e a borda da view.
           
            .background(Color.blue)
            .background(.black.opacity(1.0))//definindo a cor de fundo do cartão como azul / tenho que ver se azul é a cor correta.
           
            .cornerRadius(16) // arredondando os cantos do cartão com um raio de 16 pontos.
            .shadow(radius: 5) //adicionando uma sombra ao redor do cartão com um raio de 5 pontos.
            .padding(.horizontal) //adicionando padding horizontal ao redor do cartão para dar espaçamento nas laterais, opcionalmente.
            
            
          //  .background(
          //      RoundedRectangle(cornerRadius: 16)
           //     .fill(Color.blue)
           //         .opacity(0.1)
         //   )


 //adicionando um fundo cinza claro com opacidade de 10% para destacar o cartão na tela.
        }
    }
}


    // Passo 2: Criar uma estrutura de visualização prévia para ver como a view ficará na tela.





// Passo 3: Criar uma VIEW que irá englobar as três instâncias de NavigationCard criadas, formando assim uma lista de navegação com três cards de navegação que irão aceitar parâmetros diferentes que irão ser exibidos na tela inicial do app.
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
        
    
//#Preview {
//    GraficoTempoUso()
//}
struct HomeView: View { //criando a view HomeView que irá englobar as três instâncias de NavigationCard.
    var body: some View {
        //definindo o corpo da view, ou seja, como ela será exibida na tela.

            
            
            
            NavigationStack { //criando uma NavigationView para permitir a navegação entre views.
                VStack(spacing: 20) { //criando uma pilha vertical (VStack) com espaçamento de 20 pontos entre os elementos.
                    
                    NavigationCard(
                        title: "Gerenciamento de apps",
                        subtitle: "limitar o tempo de uso de um aplicativo, pôr uma senha,desativar as notificações.",
                        icon: "gear",
                        destination: AppList()   // 👈 AGORA FUNCIONA
                    )

                    NavigationCard( //segunda instância do NavigationCard.
                        title: "Controle dos pais", //título do cartão de navegação.
                        subtitle: "configurar restrições para crianças, bloquear conteúdo impróprio.", //subtítulo do cartão de navegação.
                        icon: "person.2.fill", //ícone do SF Symbols representando controle dos pais.
                        destination: Text("Controle dos pais") //view destino que será exibida quando o cartão for tocado.
                    )
                    
                    NavigationCard( //terceira instância do NavigationCard.
                        title: "Privacidade e segurança", //título do cartão de navegação.
                        subtitle: "gerenciar permissões de aplicativos, configurar VPN, ajustar configurações de localização.", //subtítulo do cartão de navegação.
                        icon: "lock.shield.fill", //ícone do SF Symbols representando privacidade e segurança.
                        destination: Text("Privacidade e segurança") //view destino que será exibida quando o cartão for tocado.
                    )
                    
                    Spacer() //adicionando um espaçador para empurrar os cartões para cima e deixar espaço vazio abaixo deles.
                }
                 //definindo o título da barra de navegação como "Configurações".
            }
        }
    }
//}

// Passo 4: Criar uma visualização prévia para a HomeView para ver como ela ficará na tela.


//preview 2 EVIDENCIA !!!!
struct HomeView_Previews: PreviewProvider { //estrutura de visualização prévia para a HomeView.
    static var previews: some View { //definindo o corpo da visualização prévia, ou seja, como iremos vê-la.
        NavigationStack{
            VStack{
                GraficoTempoUso()
                HomeView()
                //criando uma instância da HomeView para visualização prévia.
            }
        }
    }
 
}


 //xcode tem uma forma mais prática de fazer preview/ sendo assim, vamos deixar essas previews em evidência.


/*#Preview{
    NavigationCard()
}

#Preview{
    HomeView()
}

*/

// Passo 5: Integrar a HomeView na estrutura principal do app para que ela seja a tela inicial exibida quando o app for aberto.


@main
struct ConfigApp: App { //criando a estrutura principal do app chamada ConfigApp.
    var body: some Scene { //definindo o corpo da cena do app, ou seja, como a interface do app será exibida.
        WindowGroup { //criando um grupo de janelas para o app.
            HomeView() //definindo a HomeView como a view inicial exibida quando o app for aberto.
        }
    }
}


//---------------------------------- Digilite.swift ----------------------------------
