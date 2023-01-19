//
//  DetailsView.swift
//  Beers
//
//  Created by Matheus Rodrigues Araujo on 16/01/23.
//

import SwiftUI

struct DetailsView: View {
    
    let viewModel: BeerViewModel
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            ZStack {
                Color(.systemGray2)
                    .frame(width: 400, height: 400)
                    .padding(.all).padding(30)
                if viewModel.isDefaultImage {
                    Image(systemName: "photo.circle.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                } else {
                    AsyncImage(url: URL(string: viewModel.beerImageUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        Color(.clear)
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                }
            }
            Text(viewModel.beerName)
                .fontWeight(.bold)
                .font(.system(size: 30))
            VStack(alignment: .leading, spacing: 20) {
                buildTaglineText(tagline: viewModel.beerTagline)
                buildAbvText(abv: viewModel.beerAbv)
                buildIbuText(ibu: viewModel.beerIbu)
            }
            Text("\(viewModel.beerDescription)")
                .padding(.horizontal)
            
        }
    }
    
    private func buildTaglineText(tagline: String) -> Text {
        let taglineLabel = Text("Tagline: ")
        let taglineValue = Text(tagline).foregroundColor(Color(.systemGray))
        return taglineLabel + taglineValue
    }
    
    private func buildAbvText(abv: String) -> Text {
        let abvLabel = Text("Teor Alcolico: ")
        let abvValue = Text(abv).foregroundColor(Color(.systemGray))
        return abvLabel + abvValue
    }
    
    private func buildIbuText(ibu: String) -> Text {
        let ibuLabel = Text("Escala de Amargor: ")
        let ibuValue = Text(ibu).foregroundColor(Color(.systemGray))
        return ibuLabel + ibuValue
    }
    
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: BeerViewModel(
            model: Beer(id: 1,
                        name: "Bom dia",
                        tagline: "bla bla bla",
                        imageUrl: "https://images.punkapi.com/v2/keg.png",
                        abv: 4.1,
                        ibu: 1.2,
                        description: "my very very very very very very very very very very very very very very very verylong text about something i dont understand")))
    }
}
