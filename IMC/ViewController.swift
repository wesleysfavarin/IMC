//
//  ViewController.swift
//  IMC
//
//  Created by mac on 26/01/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    
    //@IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var viResults: UIView!
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func calculate(_ sender: Any) {
        if let wight = Double(tfWight.text!), let height = Double(tfHeight.text!){
        
          imc = wight / (height*height)
            showResults()
        
        }
    
    }
    func showResults(){
        var result: String=""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
            }
        lbResult.text = "IMC: \(Int(imc)) - \(result)"
       
        viResults.isHidden = false
        ivResult.image = UIImage(named: image)
        view.endEditing(true)
    }
    
}

