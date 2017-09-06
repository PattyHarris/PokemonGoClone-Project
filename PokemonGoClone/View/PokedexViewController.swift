//
//  PokedexViewController.swift
//  PokemonGoClone
//
//  Created by Patty Harris on 9/4/17.
//  Copyright © 2017 Patty Harris. All rights reserved.
//

import UIKit

// I have no idea what is meant by Pokedex - it's Nick's name for
// this view....

class PokedexViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var caughtPokemons : [Pokemon] = []
    var uncaughtPokemons : [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        caughtPokemons = getCaughtPokemons()
        uncaughtPokemons = getUncaughtPokemons()
}

    @IBAction func returnToMapButtonDidTap(_ sender: Any) {
        // Dismiss this VC
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: UITableViewDelegate

extension PokedexViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)

        let cell = UITableViewCell()
        
        var pokemon : Pokemon
        
        if indexPath.section == 0 {
            pokemon = caughtPokemons[indexPath.row]
        }
        else if indexPath.section == 1 {
            pokemon = uncaughtPokemons[indexPath.row]
        }
        else {
            return cell
        }
        
        if let imageName = pokemon.imageName {
            cell.imageView?.image = UIImage(named: imageName)
        }
        cell.textLabel?.text = pokemon.name
        
        return cell
    }
    
}

// MARK: UITableViewDataSource

extension PokedexViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "CAUGHT"
        }
        else if section == 1 {
            return "UNCAUGHT"
        }
        
        return "Unknown"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return caughtPokemons.count
        }
        else if section == 1 {
            return uncaughtPokemons.count
        }
        
        return 0
    }
    
}
