//
//  SortDetailView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 15/05/23.
//

import SwiftUI

// MARK: - SortDetailView

struct SortDetailView: View {
    
    @ObservedObject var viewModel = SortViewModel()
    var sortListCellViewModel: SortListCellViewModel
    var isButtonSearch: Bool = true
    var id: String = ""
    
    @State var imageShare: Image = Image(systemName: "calendar")
    @State var state: Bool = false
    @State var isSearch: Bool = false
    
    var mainView: some View {
        ZStack {
            if self.viewModel.isError {
                Button("Tente novamente") {
                    self.initModel()
                }.buttonStyle(.borderedProminent)
            } else if self.viewModel.isLoad {
                ProgressView().scaleEffect(1.0, anchor: .center)
            } else if let sortData = self.viewModel.sortData {
                SortDetailContainerView(sortData: sortData,
                                        sortListCellViewModel: sortListCellViewModel)
            }
        }
    }
    
    init(viewModel: SortViewModel = SortViewModel(),
         sortListCellViewModel: SortListCellViewModel,
         isButtonSearch: Bool = true,
         id: String = "") {
        self.viewModel = viewModel
        self.sortListCellViewModel = sortListCellViewModel
        self.isButtonSearch = isButtonSearch
        self.id = id
    }
    
    var body: some View {
        
        NavigationStack {
            mainView
                .navigationTitle(self.sortListCellViewModel.type.rawValue)
                .toolbar {
                    if !self.viewModel.isLoad && !self.viewModel.isError {
                        ToolbarItemGroup(placement: .primaryAction) {
                            ShareLink(item: self.imageShare,
                                      preview: SharePreview("Compartilhar",
                                                            image: self.imageShare))
                            
                            if self.isButtonSearch {
                                Button(action: {
                                    self.isSearch = true
                                }, label: {
                                    Image(systemName: "magnifyingglass")
                                })
                                .sheet(isPresented: self.$isSearch) {
                                    SearchUIView(sortListCellViewModel: self.sortListCellViewModel,
                                                 totalCod: self.viewModel.sortData?.numero ?? 0,
                                                 isClose: self.$isSearch)
                                }
                            }
                        }
                    }
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            if !state {
                self.initModel()
                self.state = true
            }
        }
    }
}


// MARK: - SortDetailContainerView

struct SortDetailContainerView: View {
    
    @State private var animate = false
    var sortData: SortData
    var sortListCellViewModel: SortListCellViewModel
    
    var body: some View {
        
        List {
            
            Section(header: Text("Concurso")) {
                
                SortDetailLineDescriptionView(title: "Código",
                                              description: "\((sortData.numero ?? 0))",
                                              image: "list.number")
                SortDetailLineDescriptionView(title: "Data",
                                              description: sortData.dataApuracao ?? "",
                                              image: "calendar")
                //                SortDetailLineDescriptionView(title: "Local sorteio",
                //                                              description: sortData.nomeMunicipioUFSorteio ?? "",
                //                                              image: "location.fill")
            }
            
            Section("Resultado") {
                
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
            }
            
            let listaRateioPremio = sortData.listaRateioPremio ?? []
            if !listaRateioPremio.isEmpty {
                Section("Premiação") {
                    ForEach(listaRateioPremio, id: \.self) { sort in
                        SortDetailLineDescriptionView(title: sort.ganhadores,
                                                      subTitle: "\(sort.descricaoFaixa ?? "")",
                                                      description: sort.valorPremioResult,
                                                      image: "brazilianrealsign.square.fill")
                    }
                }
            }
            
            
            if sortData.dataProximoConcurso != "" {
                
                Section("Próximo Concurso") {
                    
                    SortDetailLineDescriptionView(title: "Data",
                                                  description: sortData.dataProximoConcurso ?? "",
                                                  image: "calendar")
                    
                    SortDetailLineDescriptionView(title: "Valor",
                                                  description: self.sortData.valorEstimadoProximoConcursoResult,
                                                  image: "brazilianrealsign.square.fill")
                }
            }
            
            if self.sortData.valorArrecadado ?? 0 > 0 {
                
                Section("Arrecadação") {
                    SortDetailLineDescriptionView(title: "Total",
                                                  description: self.sortData.valorArrecadadoResult,
                                                  image: "brazilianrealsign.square.fill")
                    
                }
            }
        }
        .opacity(animate ? 1.0 : 0.0)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 0.3)) {
                animate = true
            }
        }
    }
}


// MARK: - Actions

extension SortDetailView {
    
    private func initModel() {
        self.viewModel.get(self.sortListCellViewModel.router, id: self.id) { sort in
            self.imageShare = getImageShared() ?? self.imageShare
        }
    }
    
    @MainActor
    func getImageShared() -> Image? {
        let imagerenderer = ImageRenderer(
            content:                SortCardShare(sortData: self.viewModel.sortData!, sortListCellViewModel: self.sortListCellViewModel)
        )
        
        imagerenderer.scale = UIScreen.main.scale
        
        guard let uiImage = imagerenderer.uiImage else {
            return nil
        }
        
        return Image(uiImage: uiImage)
    }
}

#if DEBUG
struct SortDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SortDetailView(sortListCellViewModel: SortListCellViewModel(type: .milhonaria))
    }
}
#endif
