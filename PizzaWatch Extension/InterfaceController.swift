//
//  InterfaceController.swift
//  PizzaWatch Extension
//
//  Created by Fer on 24/1/16.
//  Copyright © 2016 Fer. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var tamanyoText: WKInterfaceLabel!
    @IBOutlet var masaText: WKInterfaceLabel!
    @IBOutlet var quesoText: WKInterfaceLabel!
    @IBOutlet var ingredientesTabla: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let c = context as! InfoPedido
        
        tamanyoText.setText(c.tamanyo)
        masaText.setText(c.masa)
        quesoText.setText(c.queso)
        
        ingredientesTabla.setNumberOfRows(c.ingredientes.count, withRowType: "IngredienteRowResumen")
        
        for var i = 0; i < c.ingredientes.count; ++i {
            if let row = ingredientesTabla.rowControllerAtIndex(i) as? IngredienteRowResumen {
                row.ingredienteName?.setText(c.ingredientes[i])
            }
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
