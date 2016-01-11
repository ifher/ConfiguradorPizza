//
//  VCResumen.swift
//  ConfiguradorPizza
//
//  Created by Fer on 10/1/16.
//  Copyright © 2016 Fer. All rights reserved.
//

import UIKit

class VCResumen: UIViewController {

    var seleccion: [String] = [String]();
    var ingredientes: [String] = [String]()
    
    var tamanyo : String = ""
    var masa : String = ""
    var queso : String = ""
    
    @IBOutlet weak var ResTamanyo: UILabel!
    @IBOutlet weak var ResMasa: UILabel!
    @IBOutlet weak var ResQueso: UILabel!
    @IBOutlet weak var listaIngredientes: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        ResTamanyo.text = seleccion[0]
        ResMasa.text = seleccion[1]
        ResQueso.text = seleccion[2]
        
        listaIngredientes.text = ""
        
        for ingrediente in ingredientes{
            listaIngredientes.text.appendContentsOf(ingrediente+"\n")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
