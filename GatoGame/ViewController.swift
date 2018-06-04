//
//  ViewController.swift
//  GatoGame
//
//  Created by Jony Developer on 24/05/18.
//  Copyright © 2018 jony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var boton0: UIButton!
    @IBOutlet weak var boton2: UIButton!
    @IBOutlet weak var boton1: UIButton!
    @IBOutlet weak var boton3: UIButton!
    @IBOutlet weak var boton7: UIButton!
    @IBOutlet weak var boton6: UIButton!
    @IBOutlet weak var boton5: UIButton!
    @IBOutlet weak var boton8: UIButton!
    @IBOutlet weak var boton4: UIButton!
    var turno :Int = 1
    var activeGame :Bool = true
    var gameState = [ 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winStates = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    
    func existWin (){
        for combination in self.winStates{
            if  self.gameState[combination[0]] != 0 &&
                self.gameState[combination[0]] == self.gameState[combination[1]] &&
                self.gameState[combination[1]] == self.gameState[combination[2]] {
                self.activeGame = false
                var ganador :String = ""
                
                if turno == 1 {
                    ganador = "circulo"
                } else {
                    ganador = "tache"
                }
                let alert = UIAlertController(title: "Fin del juego", message: "Gano el jugador que uso el \(ganador)" , preferredStyle: .alert)
                let action = UIAlertAction(title: "Volver a jugar", style: .default, handler: {(alert: UIAlertAction!) in
                    self.turno = 1
                    self.activeGame = true
                    self.gameState = [ 0, 0, 0, 0, 0, 0, 0, 0, 0]
                    self.boton0.setImage(nil, for: .normal)
                    self.boton1.setImage(nil, for: .normal)
                    self.boton2.setImage(nil, for: .normal)
                    self.boton3.setImage(nil, for: .normal)
                    self.boton4.setImage(nil, for: .normal)
                    self.boton5.setImage(nil, for: .normal)
                    self.boton6.setImage(nil, for: .normal)
                    self.boton7.setImage(nil, for: .normal)
                    self.boton8.setImage(nil, for: .normal)
                })
                alert.addAction(action)
                present(alert, animated: true)
            }
        }
    }
    
    
    @IBAction func changeImage(_ sender: UIButton) {
        
        var image  = UIImage(named: "nought.png")
        
        if self.gameState[sender.tag] == 0 && self.activeGame {
            
            self.gameState[sender.tag] = self.turno
            self.existWin()
            
            if turno == 1 {
                image = UIImage(named: "nought.png")
                self.turno = 2
            } else {
                image = UIImage(named: "cross.png")
                self.turno = 1
            }
            sender.setImage(image, for: .normal)
        } else {
            let alert = UIAlertController(title: "Error", message: "Esa casilla ya ha sido seleccionada", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

