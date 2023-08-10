//
//  PokemonService.swift
//  PokedexApp
//
//  Created by apple on 8/7/23.
//

import Foundation

protocol PokemonServiceProtocol {
    func fetchPokemonList() async throws -> [PokemonCard]
    func fetchPokemon(_ urlString:String) async throws -> Pokemon
}

enum APIError : Error {
    case invalidUrl
    case invalidResponse
}

class PokemonService : PokemonServiceProtocol{
    let baseUrl : String
    init(url: String = "https://pokeapi.co/api/v2/pokemon/?limit=100&offset=0"){
        baseUrl = url
    }
    func fetchPokemonList() async throws -> [PokemonCard] {
        let urlString = baseUrl
        guard let url = URL(string:urlString) else {throw APIError.invalidUrl}
        
        let (data, response) = try await URLSession.shared.data(from:url)
        
        guard let r = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= r else {throw APIError.invalidResponse}
        do {
            let result = try JSONDecoder().decode(PokemonResponse.self, from: data)
            return result.results
        }catch{
            throw error
        }
    }
    
    func fetchPokemon(_ urlString: String) async throws -> Pokemon {
        guard let url = URL(string:urlString) else {throw APIError.invalidUrl}
        
        let (data, response) = try await URLSession.shared.data(from:url)
        
        guard let r = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= r else {throw APIError.invalidResponse}
        do {
            return try JSONDecoder().decode(Pokemon.self, from: data)
        }catch{
            throw error
        }
    }
}
