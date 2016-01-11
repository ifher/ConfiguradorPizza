//
//  VCPaso4.swift
//  ConfiguradorPizza
//
//  Created by Fer on 10/1/16.
//  Copyright © 2016 Fer. All rights reserved.
//

import UIKit

class VCPaso4: UIViewController {
    
    var seleccion: [String] = [String]();
    var ingredientes: [UISwitch!] = [UISwitch!]()
    var contador = 0

    @IBOutlet weak var SWJamon: UISwitch!
    @IBOutlet weak var SWPepperoni: UISwitch!
    @IBOutlet weak var SWPavo: UISwitch!
    @IBOutlet weak var SWSalchica: UISwitch!
    @IBOutlet weak var SWAceitunas: UISwitch!
    @IBOutlet weak var SWCebolla: UISwitch!
    @IBOutlet weak var SWPimiento: UISwitch!
    @IBOutlet weak var SWPiña: UISwitch!
    @IBOutlet weak var SWAnchoa: UISwitch!
    @IBOutlet weak var SWTernera: UISwitch!
    
    @IBOutlet weak var btnFinalizar: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureSwitches()
        ingredientes.append(SWJamon)
        ingredientes.append(SWPepperoni)
        ingredientes.append(SWPavo)
        ingredientes.append(SWSalchica)
        ingredientes.append(SWAceitunas)
        ingredientes.append(SWCebolla)
        ingredientes.append(SWPimiento)
        ingredientes.append(SWPiña)
        ingredientes.append(SWAnchoa)
        ingredientes.append(SWTernera)
        
    }

    func configureSwitches() {
        SWJamon.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        SWPepperoni.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        SWPavo.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        SWSalchica.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        SWAceitunas.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        SWCebolla.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        SWPimiento.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        SWPiña.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        SWAnchoa.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        SWTernera.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
    }
    
    func switchValueDidChange(aSwitch: UISwitch) {
        NSLog("A switch changed its value: \(aSwitch).")
//        if SWJamon.on {
//            contador++
//        }
//        if SWPepperoni.on {
//            contador++
//        }
//        if SWPavo.on {
//            contador++
//        }
//        if SWSalchica.on {
//            contador++
//        }
//        if SWAceitunas.on {
//            contador++
//        }
//        if SWCebolla.on {
//            contador++
//        }
//        if SWPimiento.on {
//            contador++
//        }
//        if SWPiña.on {
//            contador++
//        }
//        if SWAnchoa.on {
//            contador++
//        }
//        if SWTernera.on {
//            contador++
//        }
        if aSwitch.on {
            contador++
        }else{
            contador--
        }
        
        if contador >= 1 && contador <= 5 {
            self.btnFinalizar.enabled = true
        }
        if contador > 5 {
            let alertController = UIAlertController(title: "Cuidado!", message: "Solo se permite un máximo de 5 ingredientes", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            self.btnFinalizar.enabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let sigVista = segue.destinationViewController as! VCResumen
        sigVista.seleccion = self.seleccion
        
        if SWJamon.on {
            sigVista.ingredientes.append("Jamón")
        }
        if SWPepperoni.on {
            sigVista.ingredientes.append("Pepperoni")
        }
        if SWPavo.on {
            sigVista.ingredientes.append("Pavo")
        }
        if SWSalchica.on {
            sigVista.ingredientes.append("Salchicha")
        }
        if SWAceitunas.on {
            sigVista.ingredientes.append("Aceitunas")
        }
        if SWCebolla.on {
            sigVista.ingredientes.append("Cebolla")
        }
        if SWPimiento.on {
            sigVista.ingredientes.append("Pimiento")
        }
        if SWPiña.on {
            sigVista.ingredientes.append("Piña")
        }
        if SWAnchoa.on {
            sigVista.ingredientes.append("Anchoa")
        }
        if SWTernera.on {
            sigVista.ingredientes.append("Ternera")
        }

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
