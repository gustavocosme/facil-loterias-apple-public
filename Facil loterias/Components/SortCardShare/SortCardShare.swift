//
//  SortCardShare.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 11/06/23.
//

import SwiftUI

struct SortCardShare: View {
    
    var sortData: SortData
    var sortListCellViewModel: SortListCellViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(sortListCellViewModel.type.rawValue).font(.largeTitle)
                .bold()
                .padding(.bottom, 8)

            
            Text("Concurso")
            SortDetailLineDescriptionView(title: "Código",
                                          description: "\((sortData.numero ?? 0))",
                                          image: "list.number")
            SortDetailLineDescriptionView(title: "Data",
                                          description: sortData.dataApuracao ?? "",
                                          image: "calendar")
//            SortDetailLineDescriptionView(title: "Local sorteio",
//                                          description: sortData.nomeMunicipioUFSorteio ?? "",
//                                          image: "location.fill")
            
            
            Text("Resultado")
                .padding(.top, 16)
                .padding(.bottom, 16)

            switch self.sortListCellViewModel.type {
                
            case .megaSena,
                    .quina,
                    .duplaSena:
                
                SectionLineResultView(texts1: self.sortData.listaDezenasResult,
                                      texts2: self.sortData.listaDezenasSegundoSorteioResult,
                                      colorText: self.sortListCellViewModel.textColor,
                                      colorBG: self.sortListCellViewModel.color)
                
            case .milhonaria:
                
                SectionLineResultView(texts1: self.sortData.listaDezenasResult,
                                      texts2: [],
                                      colorText: self.sortListCellViewModel.textColor,
                                      colorBG: self.sortListCellViewModel.color)
                
                Section("Trevos sorteados") {
                    SectionLineResultView(texts1: self.sortData.trevosSorteados ?? [],
                                          texts2: [],
                                          colorText: self.sortListCellViewModel.textColor,
                                          colorBG: self.sortListCellViewModel.color)
                }
                
            case .timeMania:
                
                SectionLineResultView(texts1: self.sortData.listaDezenasResult,
                                      texts2: self.sortData.listaDezenasSegundoSorteioResult,
                                      colorText: self.sortListCellViewModel.textColor,
                                      colorBG: self.sortListCellViewModel.color)
                
                if let heartTime = sortData.heartTime {
                    Section("Time do coração") {
                        SortDetailLineDescriptionView(title: heartTime.ganhadores,
                                                      subTitle: "\(sortData.nomeTimeCoracaoMesSorte?.trimmingAllSpaces() ?? "")",
                                                      description: heartTime.valorPremioResult,
                                                      image: "heart.fill")
                    }
                    
                }
                
            case .diaDeSorte:
                
                SectionLineResultView(texts1: self.sortData.listaDezenasResult,
                                      texts2: self.sortData.listaDezenasSegundoSorteioResult,
                                      colorText: self.sortListCellViewModel.textColor,
                                      colorBG: self.sortListCellViewModel.color)
                
                if let heartTime = sortData.heartTime {
                    Section("Mês da Sorte") {
                        SortDetailLineDescriptionView(title: heartTime.ganhadores,
                                                      subTitle: "\(sortData.nomeTimeCoracaoMesSorte?.trimmingAllSpaces() ?? "")",
                                                      description: heartTime.valorPremioResult,
                                                      image: "calendar")
                    }
                    
                }
                
            case .lotoFacil,
                    .lotoMania:
                
                SectionGridResultView(texts: self.sortData.listaDezenasResult,
                                      colorText: self.sortListCellViewModel.colorDefault)
                
            case .superSete:
                
                SectionSuperSeteResultView(texts1: self.sortData.listaDezenasResult,
                                           texts2: self.sortData.listaDezenasSegundoSorteioResult,
                                           colorText: self.sortListCellViewModel.textColor,
                                           colorBG: self.sortListCellViewModel.color)
                
            case .federal:
                
                SectionFederalResultView(texts: self.sortData.listaDezenasResult)
                
            default:
                Text("")
            }
            
            
            let listaRateioPremio = sortData.listaRateioPremio ?? []
            if !listaRateioPremio.isEmpty {
                Text("Premiação")
                    .padding(.top, 16)

                    ForEach(listaRateioPremio, id: \.self) { sort in
                        SortDetailLineDescriptionView(title: sort.ganhadores,
                                                      subTitle: "\(sort.descricaoFaixa ?? "")",
                                                      description: sort.valorPremioResult,
                                                      image: "brazilianrealsign.square.fill")
                    }
                
            }
            
            
            if sortData.dataProximoConcurso != "" {
                
                Text("Próximo Concurso")
                    .padding(.top, 16)

                SortDetailLineDescriptionView(title: "Data",
                                              description: sortData.dataProximoConcurso ?? "",
                                              image: "calendar")
                
                SortDetailLineDescriptionView(title: "Valor",
                                              description: self.sortData.valorEstimadoProximoConcursoResult,
                                              image: "brazilianrealsign.square.fill")
                
            }
            
            if self.sortData.valorArrecadado ?? 0 > 0 {
                
                Text("Arrecadação")
                    .padding(.top, 16)

                SortDetailLineDescriptionView(title: "Total",
                                              description: self.sortData.valorArrecadadoResult,
                                              image: "brazilianrealsign.square.fill")
                
                
            }
        }
        .padding(88)
    }
}
