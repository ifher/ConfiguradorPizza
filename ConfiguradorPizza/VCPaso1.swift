//
//  VCPaso1.swift
//  ConfiguradorPizza
//
//  Created by Fer on 9/1/16.
//  Copyright © 2016 Fer. All rights reserved.
//

import UIKit

class VCPaso1: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var PVTamanyo: UIPickerView!
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePickerView()

        // Do any additional setup after loading the view.
    }
    
    func configurePickerView(){
        //Muestra que una fila está seleccionada, por defecto está apagado
        PVTamanyo.showsSelectionIndicator = true
        
        //conectar la información
        self.PVTamanyo.delegate = self
        self.PVTamanyo.dataSource = self
        
        //añadir las opciones
        pickerData = ["Pequeña", "Mediana", "Grande"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //el número de columnas del selector
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    // el número de filas del selector
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    // La información a devolver según la selección
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // La información que se devuelve con la fila elegida
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Este método se lanza siempre que un usuario hace algún cambio en el selector
        //los parámetros row y component representan lo que se ha elegido.
    }
    
    override func  prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let sigVista = segue.destinationViewController as! VCPaso2
        
        sigVista.seleccion.append(pickerData[PVTamanyo.selectedRowInComponent(0)])
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
