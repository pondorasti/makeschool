//
//  ChoosePokemonTableViewController.swift

/*
 Instructions
 
 Inform the PokemonDisplayController that the user has choosed a pokemon through a delegate
*/

import UIKit

class ChoosePokemonTableViewController: UITableViewController {

    var pokemons: [Pokemon] = []
    var selectedPokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pokemons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath)

        cell.textLabel?.text =  pokemons[indexPath.row].name
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedPokemon = pokemons[indexPath.row]
        
        
        // TODO:  You will want to inform your delegate HERE that a pokemon was selected
        
        
        self.navigationController?.popViewController(animated: true)
    }

}
