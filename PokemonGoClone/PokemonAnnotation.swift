//
//  PokemonAnnotation.swift
//  PokemonGoClone
//
//  Created by Patty Harris on 9/6/17.
//  Copyright © 2017 Patty Harris. All rights reserved.
//

import UIKit
import MapKit

// This special annotation class allows us to provide random Pokemon icons on the map.
class PokemonAnnotation : NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var pokemon: Pokemon
    
    init(coordinate : CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coordinate
        self.pokemon = pokemon
    }
    
    
    
    
    
    
}
