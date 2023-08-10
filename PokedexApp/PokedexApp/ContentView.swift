//
//  ContentView.swift
//  PokedexApp
//
//  Created by apple on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PokemonViewModel()
    @State var path = NavigationPath()
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            VStack {
                Text("Pokedex")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                
                NavigationStack(path: $path){
                    ScrollView{
                        ForEach(viewModel.pokemonList, id:\.self){pokemon in
                            NavigationLink(value:pokemon){
                                PokemonListCell(pokemon: pokemon)
                            }
                            Divider()
                        }
                    }
                    .frame(width:300)
                    .background(.white)
                    .navigationDestination(for: Pokemon.self){pokemon in
                        PokemonView(pokemon: pokemon, path: $path)
                    }
                }
                .cornerRadius(30)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
