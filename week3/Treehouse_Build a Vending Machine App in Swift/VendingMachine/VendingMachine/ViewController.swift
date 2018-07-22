//
//  ViewController.swift
//  VendingMachine
//
//  Created by Pasan Premaratne on 12/1/16.
//  Copyright © 2016 Treehouse Island, Inc. All rights reserved.
//

import UIKit

fileprivate let reuseIdentifier = "vendingItem"
fileprivate let screenWidth = UIScreen.main.bounds.width

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var quntityStepper: UIStepper!
    let vendingMachine: VendingMachine
    var currentSelection:VendingSelection?
   
    
    required init?(coder aDecoder: NSCoder) {
        do {
            let dictionary = try PlistConverter.dictionary(fromFile: "VendingInventory", ofType: "plist")
            let inventory = try InventoryUnarchiver.vendingInventory(fromDictionary: dictionary)
            self.vendingMachine = FoodVendingMachine(inventory: inventory)
        } catch let error {
            //有do就有catch，do無法處理的話就會跑catch中的fatalError("\(error)")
            fatalError("\(error)")
        }
        //之後再會解釋super.init的概念
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionViewCells()
        print(vendingMachine.inventory)
        balanceLabel.text = "$\(vendingMachine.amountDeposited)"
        totalLabel.text = "$00.00"
        priceLabel.text = "$0.00"
        //Passan說quantityLabel.text = "1"但0比較合理吧
        quantityLabel.text = "1"
        updateDisplay(balance: vendingMachine.amountDeposited, totalPrice: 0, itemPrice: 0, itemQuantity: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Setup

    func setupCollectionViewCells() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        let padding: CGFloat = 10
        let itemWidth = screenWidth/3 - padding
        let itemHeight = screenWidth/3 - padding
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collectionView.collectionViewLayout = layout
    }
    //MARK: Vending Machine
    
    @IBAction func purchase() {
        if let currentSelection = currentSelection{
            do{
                try vendingMachine.vend(selection: currentSelection, quantity: Int(quntityStepper.value))
                updateDisplay(balance: vendingMachine.amountDeposited, totalPrice: 0, itemPrice: 0, itemQuantity: 1)
                //catch不同error跳不同的Alert
            }catch VendingMachineError.outOfStock{
                showAlertWith(title: "Out of Stock", message: "This item is unavailable.Please make another selection")
            }catch VendingMachineError.invalidSelection{
                showAlertWith(title: "Invalid Selection", message: "Please make another selection")
            }catch VendingMachineError.insufficientFunds(let required){//用require來表示還差多少錢
                let message = "You need $\(required) to complete the transaction"
                showAlertWith(title: "Insufficient Funds", message: message)

            }catch let error{
                fatalError("\(error)")
            }
            
            //消除按下purchase之後暫存的按鈕
            if let indexPath = collectionView.indexPathsForSelectedItems?.first{
                collectionView.deselectItem(at: indexPath, animated: true)
                updateCell(having: indexPath, selected: false)
            }
        }else{
            // FIXME: Alert user to no user selection
        }
    }
    func updateDisplay(balance:Double? = nil,totalPrice:Double? = nil,itemPrice:Double? = nil,itemQuantity:Int?=nil){
        if let balanceValue = balance{
            balanceLabel.text = "$\(balanceValue)"
        }
        
        if let totalValue = totalPrice{
            totalLabel.text = "\(totalValue)"
        }
        
        if let itemValue = itemPrice{
            priceLabel.text = "\(itemValue)"
        }
        
        if let quantityValue = itemQuantity{
            quantityLabel.text = "\(quantityValue)"
        }
    }
    func updateToPrice(for item:VendingItem){
        let totalLabel = item.price * quntityStepper.value
        updateDisplay(totalPrice: totalLabel)
    }
    
    //控制UIStepper
    @IBAction func updateQuantity(_ sender: UIStepper) {
        let quantity = Int(quntityStepper.value)
        updateDisplay(itemQuantity: quantity)
        
        if let currentSelection = currentSelection, let item = vendingMachine.item(forSelection: currentSelection){
            updateToPrice(for: item)
        }
        
    }
    
    func showAlertWith(title:String,message:String,style:UIAlertControllerStyle = .alert){
        let alertController = UIAlertController(title: title, message:message, preferredStyle: style)
        //在傳到purchase去處理alert的字
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: dismissAlert)
        present(alertController,animated: true,completion: nil)
        alertController.addAction(okAction)
    }
    
    func dismissAlert(sender:UIAlertAction)->Void{
        //當超過amountDeposited的時候會updateDisplay
        updateDisplay(balance: 0, totalPrice: 0, itemPrice: 0, itemQuantity: 1)
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vendingMachine.selection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? VendingItemCell else { fatalError() }
        //加icon
        let item = vendingMachine.selection[indexPath.row]
        cell.iconView.image = item.icon()
        return cell
    }
    @IBAction func depositFunds(_ sender: UIButton) {
        vendingMachine.deposit(5)
        print(vendingMachine.amountDeposited)
        updateDisplay(balance: vendingMachine.amountDeposited)
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: true)
        //換品項時quntity歸1
        quntityStepper.value = 1
        quantityLabel.text = "1"
        totalLabel.text = "$0.00"
        
        updateDisplay(totalPrice: 0,itemQuantity: 1)
        
        currentSelection = vendingMachine.selection[indexPath.row]
        if let currentSelection = currentSelection,let item = vendingMachine.item(forSelection: currentSelection){
            let totalPrice = item.price * quntityStepper.value
            updateDisplay(totalPrice: totalPrice, itemPrice: item.price)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: false)
    }
    
    func updateCell(having indexPath: IndexPath, selected: Bool) {
        
        let selectedBackgroundColor = UIColor(red: 41/255.0, green: 211/255.0, blue: 241/255.0, alpha: 1.0)
        let defaultBackgroundColor = UIColor(red: 27/255.0, green: 32/255.0, blue: 36/255.0, alpha: 1.0)
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = selected ? selectedBackgroundColor : defaultBackgroundColor
        }
    }
}

