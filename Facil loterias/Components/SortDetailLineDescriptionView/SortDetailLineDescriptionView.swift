//
//  SortDetailLineDescriptionView.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 27/05/23.
//

import SwiftUI

struct SortDetailLineDescriptionView: View {
    
    var title = ""
    var subTitle = ""
    var description = ""
    var image = "cloud.bolt.fill"
    
    private let marginX4 = Dimensions.Margins.x4
    private let sizeIcon = Dimensions.Icons.size
    
    var body: some View {
        
        HStack {
            
            if !self.image.isEmpty {
                Image(systemName: self.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: self.sizeIcon,
                           height: self.sizeIcon)
                    .foregroundColor(.accentColor)
                    .padding(.trailing, self.marginX4)
            }

            VStack(alignment: .leading) {
                if !self.title.isEmpty {
                    Text(self.title)
                }

                if !self.subTitle.isEmpty {
                    Text(self.subTitle)
                        .font(.subheadline)
                }
            }
            
            Spacer()
            
            if !self.description.isEmpty {
                Text(self.description)
                    .foregroundColor(.accentColor)
                    .bold()
            }
        }
        .padding(.vertical, self.marginX4)
    }
}


#if DEBUG
struct SortDetailLineDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SortDetailLineDescriptionView()
    }
}
#endif
