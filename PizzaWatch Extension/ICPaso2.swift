//
//  ICPaso2.swift
//  ConfiguradorPizza
//
//  Created by Fer on 26/1/16.
//  Copyright © 2016 Fer. All rights reserved.
//

import WatchKit
import Foundation


class ICPaso2: WKInterfaceController {

    @IBOutlet var pickerMasa: WKInterfacePicker!
    var pickerItems : [WKPickerItem] = []
    var pickerVal = 0
    
    var ctx : InfoPedido = InfoPedido()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        ctx = context as! InfoPedido
        
        let items : [String] = ["Delgada","Crujiente","Gruesa"]
        
        for i in items{
            let itm = WKPickerItem()
            itm.title = i
            pickerItems.append(itm)
        }
        self.pickerMasa.setItems(pickerItems)
        
    }
    
    @IBAction func changeSelection(value: Int) {
        pickerVal = value
    }
    
    @IBAction func next() {
        ctx.masa = pickerItems[pickerVal].title!
        
        pushControllerWithName("ICPaso3", context: ctx)
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
