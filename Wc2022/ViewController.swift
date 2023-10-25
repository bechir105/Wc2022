//
//  ViewController.swift
//  Wc2022
//
//  Created by Bechir Kefi on 25/10/2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var managedObjectContext: NSManagedObjectContext!
    
    let pays = ["Qatar","Allemagne","Danemark","Brésil","France","Belgique","Serbie",
    "Espagne","Croatie","Suisse","Angleterre","Pays-Bas","Argentine","Iran","Corée du Sud","Japon","Arabie Saoudite","Equateur","Uruguay","Canada","Maroc","Tunisie",
    "Ghana","Sénégal","Portugal","Cameroun","Etats-Unis","Mexique"]
    let continents = ["Asie","Europe","Europe","Amerique du Sud","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Amerique du Sud","Asie","Asie","Asie","Asie","Amerique du Sud","Amerique du Sud","Amerique Centrale","Afrique","Afrique","Afrique","Afrique","Europe","Afrique","Amerique Centrale","Amerique Centrale"]
    let pots = ["1","2","2","1","1","1","3","1","2","2","1","2","1","3","3","3","4","4","2","4","3","3","4","3","1",
    "4","2","2"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentView = cell?.contentView
        let label1 = contentView?.viewWithTag(1) as! UILabel
        let imageview = contentView?.viewWithTag(2) as! UIImageView
        
        label1.text = pays[indexPath.row]
        imageview.image = UIImage(named:pays[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           
           let countryName = pays[indexPath.row]
           let countryPot = pots[indexPath.row]
           let countryContinent = continents[indexPath.row]
           
           let alertController = UIAlertController(title: "Country Information", message: "Country: \(countryName)\nPot: \(countryPot)\nContinent: \(countryContinent)", preferredStyle: .alert)
           
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(okAction)
           
           present(alertController, animated: true, completion: nil)
       }
    

    @IBAction func drawGroups(_ sender: Any) {
        // Générez un index aléatoire pour sélectionner un pays aléatoire
        let randomIndex = Int.random(in: 0..<pays.count)
        
        // Sélectionnez le pays et le groupe associé à l'index aléatoire
        let countryName = pays[randomIndex]
        let countryPot = pots[randomIndex]
        
        // Affichez une alerte avec les informations du pays
        let alertController = UIAlertController(title: "Country Draw", message: "Country: \(countryName)\nPot: \(countryPot)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }

    
    @IBAction func showGroupDraw(_ sender: Any) {
        performSegue(withIdentifier: "mSegue", sender: self)
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

