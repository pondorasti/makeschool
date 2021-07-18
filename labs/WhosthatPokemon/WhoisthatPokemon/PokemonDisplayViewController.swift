//
//  PokemonDisplayViewController.swift


/*
Instructions:

- Use delegation to pass the selected(guessed) Pokemon from the ChoosePokemonViewController to the PokemenDisplayViewController
- Run the checkGuessedPokemonAndShowPokemon() function in the delegate in PokemonDisplayViewController - this viewcontroller

 Notes:
 
 Pokemons - list of all pokemons
 selectedPokemon - the currently guessed/selected pokemon from the ChoosePokemonViewController, this will be empty at launch
 displayedPokemon - you don't need to touch this, is just shows a random pokemon to be guessed
 
*/

protocol PokeDelegate: class {
    func didSelectPokemon(pokemon: Pokemon)
}

import UIKit

class PokemonDisplayViewController: UIViewController {
    
    @IBOutlet weak var guessedPokemon: UILabel!
    @IBOutlet weak var pokeDisplayImageVIew: UIImageView!
    
    static let pokemons = [
        Pokemon(name: "Haunter", shadowImage: UIImage(named: "haunter_shadow")!, actualImage: UIImage(named: "haunter")!),
        Pokemon(name: "Kakuna", shadowImage: UIImage(named: "kakuna_shadow")!, actualImage: UIImage(named: "kakuna")!),
        Pokemon(name: "Charmander", shadowImage: UIImage(named: "char_shadow")!, actualImage: UIImage(named: "char")!),
        Pokemon(name: "Psyduck", shadowImage: UIImage(named: "psy_shadow")!, actualImage: UIImage(named: "psy")!),
        Pokemon(name: "Horsea", shadowImage: UIImage(named: "seadra_shadow")!, actualImage: UIImage(named: "seadra")!),
        Pokemon(name: "Dragonaire", shadowImage: UIImage(named: "dragonaire_shadow")!, actualImage: UIImage(named: "dragonaire")!),
        Pokemon(name: "Weepingbell", shadowImage: UIImage(named: "weepingbell_shadow")!, actualImage: UIImage(named: "weepingbell")!)
        
        
    ]
    
    var selectedPokemon: Pokemon?
    var displayedPokemon: Pokemon = randomPoke()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokeDisplayImageVIew.image = displayedPokemon.shadowImage
       
    }
    
    // What this does: Selects a random pokemon - starts the guessing game
    
    static func randomPoke() -> Pokemon {
        let index = Int(arc4random()) % pokemons.count
        return pokemons[index]
    }
    
    func goToChoosePokemonViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let choosePokemonController = storyboard.instantiateViewController(withIdentifier: "ChoosePokemonViewController") as! ChoosePokemonTableViewController
        
        choosePokemonController.pokemons = PokemonDisplayViewController.pokemons
        
        // TODO: Make sure to set the *delegate* on the ChoosePokemonViewController
        
    self.navigationController?.pushViewController(choosePokemonController, animated: true)
        
    }
    
    
    /*
         Checks if the selected pokemon from the delegate matches the displayed pokemon
         - Run this when your delegate method is called
    */
    func checkGuessedPokemonAndShowPokemon(selectedPokemon: Pokemon) {
        self.selectedPokemon = selectedPokemon
        
        if selectedPokemon == displayedPokemon {
            guessedPokemon.text = "You're right! Its \(displayedPokemon.name)"
        } else {
            guessedPokemon.text = "Your guess was wrong, it was \(displayedPokemon.name)"
        }
        
        pokeDisplayImageVIew.image = displayedPokemon.actualImage
    }
    
    @IBAction func resetPokeDisplay(_ sender: UIButton) {
        let randomPoke = PokemonDisplayViewController.randomPoke()
        
        displayedPokemon = randomPoke
        pokeDisplayImageVIew.image = displayedPokemon.shadowImage
        guessedPokemon.text = "Who's that Pokemon?"
    }
    
    @IBAction func choosePokemon(_ sender: UIButton) {
        goToChoosePokemonViewController()
    }
}
