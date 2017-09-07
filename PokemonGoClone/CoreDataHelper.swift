//
//  CoreDataHelper.swift
//  PokemonGoClone
//
//  Created by Patty Harris on 9/4/17.
//  Copyright © 2017 Patty Harris. All rights reserved.
//

import UIKit
import CoreData

// Add all the Pokemon entities
func addAllPokemons() {
 
    createPokemon(name: "Pikachu", imageName: "pikachu-2")
    createPokemon(name: "Meowth", imageName: "meowth")
    createPokemon(name: "Pidgey", imageName: "pidgey")
    createPokemon(name: "Zubat", imageName: "zubat")
    createPokemon(name: "Snorlax", imageName: "snorlax")
    createPokemon(name: "Psyduck", imageName: "psyduck")
    createPokemon(name: "Mew", imageName: "mew")
    createPokemon(name: "Mankey", imageName: "mankey")
    createPokemon(name: "Bullbasaur", imageName: "bullbasaur")
}

// Helper to create and save a Pokemon
func createPokemon(name: String, imageName: String) {
    if let context  =
        ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext) {
        
        let pokemon = Pokemon(entity: Pokemon.entity(), insertInto: context)
        pokemon.name = name
        pokemon.imageName = imageName
        
        try? context.save()
    }
        
}

func saveCaughtPokemon(pokemon: Pokemon) {
    if let context  =
        ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext) {
        
        pokemon.caught = true
        try? context.save()
    }

}

// Return all the Pokemons in Core Data
func getAllPokemons() -> [Pokemon] {
    
    var getOutOfJail = 0;
    
    if let context  =
        ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext) {
        
        if let coreDataItems = try? context.fetch(Pokemon.fetchRequest()) as? [Pokemon] {
            
            if let pokemonData = coreDataItems {
                
                // This logic is a bit dangerous since there's no get out of
                // jail card if for some reason Core Data fails to save the added entries.
                // I added a funky getOutOfJail check..
                
                if pokemonData.count == 0 && getOutOfJail == 0 {
                    
                    print("Adding all pokemons to Core Data")
                    addAllPokemons()
                    getOutOfJail += 1
                    
                    return getAllPokemons()
                }
                return pokemonData
            }
        }
    }

    return []
}

// Return just the caught Pokemons
func getCaughtPokemons() -> [Pokemon] {
    if let context  =
        ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext) {
        
        let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
        
        // Return all the pokemons where the caught property = true
        fetchRequest.predicate = NSPredicate(format: "caught = %@", true as CVarArg)
        
        if let coreDataItems = try? context.fetch(fetchRequest) as [Pokemon] {
            return coreDataItems
        }
    }

    return []
}


// Return just the uncaught Pokemons
func getUncaughtPokemons() -> [Pokemon] {
    if let context  =
        ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext) {
        
        let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
        
        // Return all the pokemons where the caught property = ture
        fetchRequest.predicate = NSPredicate(format: "caught = %@", false as CVarArg)
        
        if let coreDataItems = try? context.fetch(fetchRequest) as [Pokemon] {
            return coreDataItems
        }
    }

    return []
}




