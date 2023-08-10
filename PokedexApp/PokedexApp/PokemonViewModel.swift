//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by apple on 8/7/23.
//

import Foundation

class PokemonViewModel : ObservableObject {
    @Published var pokemonList : [Pokemon] = []
    let pokemonService : PokemonServiceProtocol
    init(_ service : PokemonServiceProtocol = PokemonService()){
        pokemonService = service
        Task{
            await getPokemon()
        }
    }
    @MainActor func getPokemon() {
        Task{
            do{
                let urlList = try await pokemonService.fetchPokemonList()
                for url in urlList{
                    pokemonList.append(try await pokemonService.fetchPokemon(url.url))
                }
            }catch{
                print(error)
            }
        }
    }
}
