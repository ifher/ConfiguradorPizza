//
//  ICPaso1.swift
//  ConfiguradorPizza
//
//  Created by Fer on 26/1/16.
//  Copyright © 2016 Fer. All rights reserved.
//

import WatchKit
import Foundation


class ICPaso1: WKInterfaceController {

    @IBOutlet var pickerTamanyo: WKInterfacePicker!
    var pickerItems : [WKPickerItem] = []
    var pickerVal = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let items : [String] = ["Pequeña","Mediana","Grande"]
        
        for i in items{
            let itm = WKPickerItem()
            itm.title = i
            pickerItems.append(itm)
        }
        self.pickerTamanyo.setItems(pickerItems)
    }
    @IBAction func changeSelection(value: Int) {
        pickerVal = value
    }
    @IBAction func next() {
        let ctx = InfoPedido()
        ctx.tamanyo = pickerItems[pickerVal].title!
        
        pushControllerWithName("ICPaso2", context: ctx)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        pickerTamanyo.setSelectedItemIndex(pickerVal)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
