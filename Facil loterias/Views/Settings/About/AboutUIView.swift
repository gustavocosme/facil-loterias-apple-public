//
//  AboutUIView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 24/05/23.
//

import SwiftUI

struct AboutUIView: View {
    
    let marginX8 = Dimensions.Margins.x8
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack(alignment: .leading) {

                    Text("Nosso aplicativo de resultados da Loteria do Brasil! Aqui você encontrará os resultados mais recentes dos principais jogos de loteria do país. Fique por dentro dos números sorteados, premiações e outras informações importantes. Acompanhe seus jogos favoritos e aumente suas chances de ganhar!")
                    
                    Text("Recursos")
                        .font(.title)
                        .bold()
                        .padding(.bottom, self.marginX8)
                        .padding(.top, self.marginX8)
                    
                    Text("1. Resultados atualizados")
                        .font(.headline)
                        .bold()
                        .padding(.bottom, self.marginX8)
                        .padding(.top, self.marginX8)
                    
                    Text("Mantemos você informado sobre os resultados mais recentes da Mega-Sena, Quina, Lotofácil, Dupla Sena e outros jogos populares. Sempre que houver um sorteio, você terá acesso imediato aos números vencedores.")
                        .padding(.bottom, self.marginX8)

                    Text("2. Histórico de resultados")
                        .font(.headline)
                        .bold()
                        .padding(.bottom, self.marginX8)
                        .padding(.top, self.marginX8)
                    
                    Text("Consulte o histórico completo dos resultados de cada jogo de loteria. Verifique os números sorteados, prêmios distribuídos e datas de sorteio. Com nosso aplicativo, é fácil conferir se seus números foram sorteados em jogos anteriores.")
                        .padding(.bottom, self.marginX8)

//                    Text("3. Notificações personalizadas")
//                        .font(.headline)
//                        .bold()
//                        .padding(.bottom, self.marginX8)
//                        .padding(.top, self.marginX8)
//                    
//                    Text("Personalize suas preferências de notificação para receber alertas sobre os sorteios, resultados e prazos importantes. Nunca perca a oportunidade de verificar seus bilhetes!")
                }
                .padding(.horizontal, Dimensions.Margins.x24)
            }
            .navigationTitle("Sobre")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


#if DEBUG
struct AboutUIView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUIView()
        AboutUIView().environment(\.colorScheme, .dark)
    }
}
#endif
