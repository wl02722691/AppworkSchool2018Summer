//
//  ViewController.swift
//  Alice
//
//  Created by 張書涵 on 2018/7/26.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stationIDLabel: UILabel!
    
    @IBOutlet weak var stationNameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataManager = DataManager.shared
        
        dataManager.getStationData { (station, message) in
            print("back to VC")
            print(station?.stationID)
            self.stationIDLabel.text = station?.stationID
            print(station?.stationAddress)
            self.addressLabel.text = station?.stationAddress
            
            guard let stationName = station?.stationName else {
                print("error : \(message)")
                return
            }

            self.stationNameLabel.text = stationName.en
            print(stationName.en!)
            print(stationName.zh_tw!)
        }
    }

}

