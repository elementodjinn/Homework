//
//  PokemonView.swift
//  PokedexApp
//
//  Created by apple on 8/8/23.
//

import SwiftUI

struct PokemonView: View {
    let pokemon : Pokemon
    @Binding var path : NavigationPath
    var body: some View {
        ZStack{
            VStack{
                Text(pokemon.name.capitalized)
                    .font(.system(size:50))
                HStack{
                    VStack{
                        AsyncImage(url:URL(string:pokemon.sprites.front_default))
                        Text("Front Sprite")
                    }
                    VStack{
                        AsyncImage(url:URL(string:pokemon.sprites.back_default))
                        Text("Back Sprite")
                    }
                }
                HStack{
                    Text("Type:")
                    Spacer()
                    if pokemon.types.count >= 1 {
                        let priType = pokemon.types[0].type.name
                        if pokemon.types.count >= 2 {
                            let secType = pokemon.types[1].type.name
                            Text(priType.capitalized)
                                .foregroundColor(TypeColor(typeName:priType))
                            + Text(", ")
                            + Text(secType.capitalized)
                                .foregroundColor(TypeColor(typeName:secType))
                        }
                        else {
                            Text(priType.capitalized)
                                .foregroundColor(TypeColor(typeName:priType))
                        }
                    }
                }
                HStack{
                    Text("Abilit(ies):")
                    Spacer()
                    if pokemon.abilities.count == 3  {
                        Text("\(HiddenAbility(pokemon.abilities[0])), \(HiddenAbility(pokemon.abilities[1])), \(HiddenAbility(pokemon.abilities[2]))")
                    } else if pokemon.abilities.count == 2 {
                        Text("\(HiddenAbility(pokemon.abilities[0])), \(HiddenAbility(pokemon.abilities[1]))")
                    } else if pokemon.abilities.count == 1 {
                        Text("\(HiddenAbility(pokemon.abilities[0]))")
                    }
                }
            }
            .frame(width:300)
        }
    }
    func HiddenAbility(_ ability: Ability) -> String{
        let abilityString = ability.ability.name.replacingOccurrences(of: "-", with: " ").capitalized
        if ability.is_hidden {
            return abilityString + " (Hidden Ability)"
        }
        else {
            return abilityString
        }
    }
    func TypeColor(typeName: String)->Color{
        switch typeName{
        case "normal" :
            return Color(red:168/255, green: 168/255, blue: 120/255)
        case "fire" :
            return Color(red:240/255, green: 96/255, blue: 48/255)
        case "water" :
            return Color(red:104/255, green: 144/255, blue: 240/255)
        case "grass" :
            return Color(red:120/255, green: 200/255, blue: 80/255)
        case "electric" :
            return Color(red:248/255, green: 208/255, blue: 48/255)
        case "ground" :
            return Color(red:224/255, green: 192/255, blue: 104/255)
        case "flying" :
            return Color(red:168/255, green: 144/255, blue: 240/255)
        case "ice" :
            return Color(red:152/255, green: 216/255, blue: 216/255)
        case "fighting" :
            return Color(red:192/255, green: 48/255, blue: 40/255)
        case "bug" :
            return Color(red:168/255, green: 184/255, blue: 32/255)
        case "rock" :
            return Color(red:184/255, green: 160/255, blue: 56/255)
        case "poison" :
            return Color(red:160/255, green: 64/255, blue: 160/255)
        case "psychic" :
            return Color(red:248/255, green: 88/255, blue: 136/255)
        case "ghost" :
            return Color(red:112/255, green: 88/255, blue: 152/255)
        case "dragon" :
            return Color(red:112/255, green: 56/255, blue: 248/255)
        case "steel" :
            return Color(red:184/255, green: 184/255, blue: 208/255)
        case "dark" :
            return Color(red:112/255, green: 88/255, blue: 72/255)
        case "fairy" :
            return Color(red:238/255, green: 153/255, blue: 172/255)
        default:
            return Color.black
        }
    }
}



