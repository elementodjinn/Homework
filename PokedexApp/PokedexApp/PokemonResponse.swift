//
//  PokemonResponse.swift
//  PokedexApp
//
//  Created by apple on 8/7/23.
//

import Foundation

struct PokemonResponse : Codable {
    let results : [PokemonCard]
}

struct PokemonCard : Codable {
    let name : String
    let url : String
}

struct Pokemon : Codable, Hashable {
    let abilities : [Ability]
    let name : String
    let order : Int
    let sprites : Sprites
    let types : [PokeType]
}

struct Ability : Codable, Hashable {
    let ability : AbilityName
    let is_hidden : Bool
}

struct Sprites : Codable, Hashable{
    let back_default : String
    let back_female : String?
    let front_default : String
    let front_female : String?
}

struct PokeType : Codable, Hashable {
    let type : TypeName
}

struct TypeName : Codable, Hashable {
    let name : String
}

struct AbilityName : Codable, Hashable {
    let name : String
}
