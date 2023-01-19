//
//  ContentView.swift
//  Beers
//
//  Created by Matheus Rodrigues Araujo on 09/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var beersManager = BeersManager()
    
    var body: some View {
        NavigationStack {
            Text("Beers")
                .font(.title)
            List(beersManager.beers) { beer in
                let viewModel = BeerViewModel(model: beer)
                BeerView(viewModel: viewModel)
                    .listRowSeparator(.hidden)
                Divider()
            }
            .listStyle(.plain)
        }.onAppear{
            beersManager.fetchBeers()
        }
        .background(Color.green)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
