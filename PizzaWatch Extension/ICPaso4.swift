//
//  ICPaso4.swift
//  ConfiguradorPizza
//
//  Created by Fer on 26/1/16.
//  Copyright © 2016 Fer. All rights reserved.
//

import WatchKit
import Foundation


class ICPaso4: WKInterfaceController {
    @IBOutlet var tableView: WKInterfaceTable!
    @IBOutlet var btnNext: WKInterfaceButton!
    
    var ctx : InfoPedido = InfoPedido()
    
    var ingredientes : [String] = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceitunas", "Cebolla", "Pimiento", "Piña", "Anchoas", "Ternera"]
    var ingSeleccionados : [String] = []

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        ctx = context as! InfoPedido
        
        setupTable()
    }

    @IBAction func next() {
        
        ctx.ingredientes = ingSeleccionados
        
        pushControllerWithName("ICResumen", context: ctx)
    }
    
    func setupTable(){
        tableView.setNumberOfRows(ingredientes.count, withRowType: "IngredienteRow")
        
        for var i = 0; i < ingredientes.count; ++i {
            if let row = tableView.rowControllerAtIndex(i) as? IngredienteRow {
                row.IngredienteName.setText(ingredientes[i])
                row.check.setColor(UIColor.blackColor())
            }
        }
    }
    
    //función de la tabla que permite recoger la acción del clic sobre una fila
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let rowSelected = tableView.rowControllerAtIndex(rowIndex) as? IngredienteRow
        
        let indice = ingSeleccionados.indexOf(ingredientes[rowIndex])
        
        if ingSeleccionados.count == 5 {
            let ok = WKAlertAction(title: "OK", style: WKAlertActionStyle.Default, handler: { () -> Void in })
            self.presentAlertControllerWithTitle("Atención", message: "Solo puedes elegir un máximo de 5 ingredientes", preferredStyle: WKAlertControllerStyle.Alert, actions: [ok])
        }else{
            if indice != nil {
                rowSelected?.check.setColor(UIColor.blackColor())
                ingSeleccionados.removeAtIndex(indice!)
            }else{
                rowSelected?.check.setColor(UIColor(red: 0, green: 230/255, blue: 80/255, alpha: 1))
                ingSeleccionados.append(ingredientes[rowIndex])
            }
        }
        if ingSeleccionados.count == 0 {
            btnNext.setEnabled(false)
        }else{
            btnNext.setEnabled(true)
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
