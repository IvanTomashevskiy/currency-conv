//
//  ViewController.swift
//  first project
//
//  Created by Apple on 31.05.2020.
//  Copyright © 2020 Ivan Tomashevskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerOne.delegate = self
        pickerOne.dataSource = self
        TextFieldOne.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var erorLbl: UILabel!
    @IBOutlet weak var resRUB: UILabel!
    @IBOutlet weak var resCZK: UILabel!
    @IBOutlet weak var resGBP: UILabel!
    @IBOutlet weak var resEUR: UILabel!
    @IBOutlet weak var resUSD: UILabel!
    @IBOutlet weak var resUAH: UILabel!
    @IBOutlet weak var TextFieldOne: UITextField!
    @IBOutlet weak var LblOne: UILabel!
    @IBOutlet weak var pickerOne: UIPickerView!
    
    // MARK: - Public Properties
    let pickerArrOne = ["Выберите валюту","USD Доллар США", "EUR Евро", "UAH Гривна", "RUB Российский рубль", "GBP Фунт стерлингов", "CZK Чешская крона"]
    
    var dollarAmount = 0.0
    
    // MARK: - IBActions
    @IBAction func surpriseBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Обязательно к прочтению😅", message: "Здравствуйте, меня зовут Ваня и это мое первое приожение на Swift, здесь я использовал UIPickerView, для перевода валюты надо переключить UIPickerView, так же я сделал валидацию UITextField", preferredStyle: .alert)
        let confBtn = UIAlertAction(title: "Хорошо", style: .default, handler: nil)
        alert.addAction(confBtn)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        TextFieldOne.text = ""
        resRUB.text = "₽ 0.00"
        resCZK.text = "CZK 0.00"
        resGBP.text = "£ 0.00"
        resEUR.text = "€ 0.00"
        resUSD.text = "$ 0.00"
        resUAH.text = "₴ 0.00"
    }
    
    // MARK: - Private Methods
    private func cleanLBl(){
        resRUB.text = "₽ 0.00"
        resCZK.text = "CZK 0.00"
        resGBP.text = "£ 0.00"
        resEUR.text = "€ 0.00"
        resUSD.text = "$ 0.00"
        resUAH.text = "₴ 0.00"
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == TextFieldOne {
                  let allowedCharacters = "1234567890.,"
                  let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
                  let typedCharacterSet = CharacterSet(charactersIn: string)
                  let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
                  return alphabet
        }
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArrOne.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerArrOne[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        let X = pickerArrOne[row]
        self.LblOne.text = X
        if let amount = Double(TextFieldOne.text!){
            dollarAmount = amount
        }
        
        switch row{
        case 0:
            cleanLBl()
            
        case 1:
            let EUR = 0.9
            let UAH = 0.3
            let RUB = 68.5
            let GBP = 1.1
            let CZK = 23.4
            
            if TextFieldOne.text!.isEmpty{
                cleanLBl()
            }
            else{
                resUSD.text = "$ \(TextFieldOne.text!)"
                resRUB.text = "₽ \(dollarAmount * RUB)"
                resCZK.text = "CZK \(dollarAmount * CZK)"
                resGBP.text = "£ \(dollarAmount * GBP)"
                resEUR.text = "€ \(dollarAmount * EUR)"
                resUAH.text = "₴ \(dollarAmount * UAH)"
            }
            
        case 2:
            let USD = 1.2
            let UAH = 30.2
            let RUB = 78.0
            let GBP = 0.9
            let CZK = 26.6
            
            
            if TextFieldOne.text!.isEmpty{
                cleanLBl()
            }
            else{
                resEUR.text = "€ \(TextFieldOne.text!)"
                resRUB.text = "₽ \(dollarAmount * RUB)"
                resCZK.text = "CZK \(dollarAmount * CZK)"
                resGBP.text = "£ \(dollarAmount * GBP)"
                resUSD.text = "$ \(dollarAmount * USD)"
                resUAH.text = "₴ \(dollarAmount * UAH)"
            }
            
        case 3:
            let USD = 0.04
            let EUR = 0.03
            let RUB = 2.6
            let GBP = 0.05
            let CZK = 0.8
            
            if TextFieldOne.text!.isEmpty{
                cleanLBl()
            }
            else{
                resUAH.text = "₴ \(TextFieldOne.text!)"
                resRUB.text = "₽ \(dollarAmount * RUB)"
                resCZK.text = "CZK \(dollarAmount * CZK)"
                resGBP.text = "£ \(dollarAmount * GBP)"
                resEUR.text = "€ \(dollarAmount * EUR)"
                resUSD.text = "$ \(dollarAmount * USD)"
            }
            
        case 4:
            let USD = 0.02
            let EUR = 0.013
            let UAH = 0.4
            let GBP = 0.01
            let CZK = 0.3
            
            if TextFieldOne.text!.isEmpty{
                cleanLBl()
            }
            else{
                resRUB.text = "₽ \(TextFieldOne.text!)"
                resCZK.text = "CZK \(dollarAmount * CZK)"
                resGBP.text = "£ \(dollarAmount * GBP)"
                resEUR.text = "€ \(dollarAmount * EUR)"
                resUSD.text = "$ \(dollarAmount * USD)"
                resUAH.text = "₴ \(dollarAmount * UAH)"
            }
            
        case 5:
            let USD = 1.3
            let EUR = 1.2
            let UAH = 33.9
            let RUB = 87.2
            let CZK = 29.8
            
            if TextFieldOne.text!.isEmpty{
                cleanLBl()
            }
            else{
                resGBP.text = "£ \(TextFieldOne.text!)"
                resRUB.text = "₽ \(dollarAmount * RUB)"
                resCZK.text = "CZK \(dollarAmount * CZK)"
                resEUR.text = "€ \(dollarAmount * EUR)"
                resUSD.text = "$ \(dollarAmount * USD)"
                resUAH.text = "₴ \(dollarAmount * UAH)"
            }
            
        case 6:
            let USD = 0.05
            let EUR = 0.04
            let UAH = 1.2
            let RUB = 3.0
            let GBP = 0.03
            
            if TextFieldOne.text!.isEmpty{
                cleanLBl()                }
            else{
                resCZK.text = "CZK \(TextFieldOne.text!)"
                resRUB.text = "₽ \(dollarAmount * RUB)"
                resGBP.text = "£ \(dollarAmount * GBP)"
                resEUR.text = "€ \(dollarAmount * EUR)"
                resUSD.text = "$ \(dollarAmount * USD)"
                resUAH.text = "₴ \(dollarAmount * UAH)"
            }
            
        default:
            break
        }
    }
}
