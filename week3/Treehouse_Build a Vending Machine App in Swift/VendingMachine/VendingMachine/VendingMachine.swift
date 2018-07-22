//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Screencast on 12/6/16.
//  Copyright © 2016 Treehouse Island, Inc. All rights reserved.
//

import Foundation
import UIKit

enum VendingSelection: String {
    case soda
    case dietSoda
    case chips
    case cookie
    case sandwich
    case wrap
    case candyBar
    case popTart
    case water
    case fruitJuice
    case sportsDrink
    case gum
    func icon() -> UIImage{
    // 加Icon的普通寫法switch self{
    //           case .soda return UIImage(named: "soda")
    //
    //        }
        
        if let image = UIImage(named: self.rawValue){
            return image
        }else{
            return #imageLiteral(resourceName: "default")//Xcode知道defualt真實存在就不會return optional的選項
        }
        
        
    }
}

protocol VendingItem {
    //get代表price不會被VendingMachine改變，get set則是會因為購買數量而改變
    var price: Double { get }
    var quantity: Int { get set }
}

protocol VendingMachine {
    //被選擇的東西是依據VendingSelection
    var selection: [VendingSelection] { get }
    //存貨前面是物品，後面價錢與數量但綁再一起所以要使用名為VendingItem的protocal
    var inventory: [VendingSelection: VendingItem] { get set }
    var amountDeposited: Double { get set }
    
    init(inventory: [VendingSelection: VendingItem])
    func vend(selection: VendingSelection, quantity: Int) throws
   //因Argument Labels為_，vend(5,fruitJuice)
    func deposit(_ amount: Double)
    func item(forSelection selection:VendingSelection) -> VendingItem?
}
//Item繼承VendingItem
struct Item: VendingItem {
    let price: Double
    var quantity: Int
}

enum InventoryError: Error {
    case invalidResource
    case conversionFailure
    case invalidSelection
}

class PlistConverter {
    static func dictionary(fromFile name: String, ofType type: String) throws -> [String: AnyObject] {
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            //如果有錯誤就執行下面的
            throw InventoryError.invalidResource
        }
        
        guard let dictionary = NSDictionary(contentsOfFile: path) as? [String: AnyObject] else {
            //as? [String:AnyObject]是Type Casting
            throw
                InventoryError.conversionFailure
        //NSDictionary並非回傳的[String:AnyObject]型態
        }
        
        return dictionary
    }
}

class InventoryUnarchiver {
    static func vendingInventory(fromDictionary dictionary: [String: AnyObject]) throws -> [VendingSelection: VendingItem] {
        
        var inventory: [VendingSelection: VendingItem] = [:]
        
        for (key, value) in dictionary {
            if let itemDictionary = value as? [String: Any], let price = itemDictionary["price"] as? Double, let quantity = itemDictionary["quantity"] as? Int {
                let item = Item(price: price, quantity: quantity)
                
                guard let selection = VendingSelection(rawValue: key) else {
                    throw InventoryError.invalidSelection
                }
                
                inventory.updateValue(item, forKey: selection)
            }
        }
        
        
        return inventory
    }
}

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(required: Double)
}

class FoodVendingMachine: VendingMachine {
    let selection: [VendingSelection] = [.soda, .dietSoda, .chips, .cookie, .wrap, .sandwich, .candyBar, .popTart, .water, .fruitJuice, .sportsDrink, .gum]
    var inventory: [VendingSelection : VendingItem]
    var amountDeposited: Double = 10.0
    
    required init(inventory: [VendingSelection : VendingItem]) {
        self.inventory = inventory
    }
    
    func vend(selection: VendingSelection, quantity: Int) throws {
        guard var item = inventory[selection] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.quantity >= quantity else {
            throw VendingMachineError.outOfStock
        }
        
        let totalPrice = item.price * Double(quantity)
        
        if amountDeposited >= totalPrice {
            amountDeposited -= totalPrice
            
            item.quantity -= quantity
            
            inventory.updateValue(item, forKey: selection)
        } else {
            let amountRequired = totalPrice - amountDeposited
            throw VendingMachineError.insufficientFunds(required: amountRequired)
        }
    }
    
    func deposit(_ amount: Double) {
        amountDeposited += amount
    }
    
    func item(forSelection selection: VendingSelection) -> VendingItem? {
        return inventory[selection]
    }
}






























































