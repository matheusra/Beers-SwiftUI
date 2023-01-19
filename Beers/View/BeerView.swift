//
//  BeerView.swift
//  Beers
//
//  Created by Matheus Rodrigues Araujo on 16/01/23.
//

import SwiftUI
import CachedAsyncImage

struct BeerView: View {
    
    let viewModel: BeerViewModel
    
    var body: some View {
        NavigationLink(destination: DetailsView(viewModel: viewModel) ) {
            HStack {
                CachedAsyncImage(url: URL(string: viewModel.beerImageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    Color(.clear)
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 40.0, height: 70.0)
                VStack(alignment: .leading, spacing: 0) {
                    Text(viewModel.beerName)
                        .font(.system(size: 18))
                    Text("Teor alcolico: \(viewModel.beerAbv)")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct BeerView_Previews: PreviewProvider {
    static var previews: some View {
        BeerView(viewModel: BeerViewModel(model:
                                            Beer(id: 1,
                                                 name: "bom dia",
                                                 tagline: "bla bla bla",
                                                 imageUrl: "https://images.punkapi.com/v2/22.pn",
                                                 abv: 40.0,
                                                 ibu: 12.0,
                                                 description: "my very very very very long text about something i dont understand")))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
