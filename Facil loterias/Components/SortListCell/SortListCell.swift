//
//  SortListCell.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 17/05/23.
//

import SwiftUI

struct SortListCell: View {
    
    var model = SortListCellViewModel(type: .timeMania)
    
    
    // MARK: - Dimensions
    
    private let sizeIconSort = Dimensions.Icons.sizeX2
    private let sizeArrow = Dimensions.Icons.size
    private let margin24 = Dimensions.Margins.x24
    private let margin16 = Dimensions.Margins.x16
    private let margin8 = Dimensions.Margins.x8
    private let sizeFontTitle = Fonts.Titles.x24
    private let height = Dimensions.Cells.heightX3
    
    var body: some View {
       
        NavigationLink {
            SortDetailView(sortListCellViewModel: model)
        } label: {
            ZStack {
                Rectangle().fill(self.model.color)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.2), radius: 2)

                HStack {
                    
                    Image(self.model.icon)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(self.model.textColor)
                        .frame(width: self.sizeIconSort,
                               height: self.sizeIconSort)
                        .opacity(0.6)
                        .padding(.leading, self.margin16)

                    Text(self.model.type.rawValue.uppercased())
                        .foregroundColor(self.model.textColor)
                        .font(Font.custom("Impact", size: 24))
                        .bold()
                        .padding(.leading, self.margin8)

                    HStack {
                        
                        Spacer()
                        
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(self.model.textColor)
                            .scaledToFit()
                            .frame(width: self.sizeArrow,
                                   height: self.sizeArrow)
                        
                    }.padding(.trailing, 4)

                    Spacer()
                }
            }
            .frame(height: self.height)
            .padding(.horizontal, self.margin16)
            .accessibilityAddTraits(.isButton)
            .accessibilityHint(self.model.type.rawValue)
        }
        
    }
}

#if DEBUG
struct SortListCell_Previews: PreviewProvider {
    static var previews: some View {
        SortListCell()
    }
}
#endif
