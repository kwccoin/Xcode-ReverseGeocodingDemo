//
//  ViewController.swift
//  ReverseGeocodingDemo
//
//  Created by Sunny NG on 26/2/2017.
//  Copyright © 2017 Sunny NG. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var latLabel: UITextField!
    @IBOutlet weak var lngLabel: UITextField!
    @IBOutlet weak var geocodingResultTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startReverseGeocoding(_ sender: Any) {
        let location = CLLocation(latitude: Double(self.latLabel.text!)!, longitude: Double(self.lngLabel.text!)!)
        
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
            if error != nil {
                self.geocodingResultTextView.text = "Error!"
            }
            else if placemarks!.count > 0{
                let placemark = placemarks![0]
                let addressDictionary = placemark.addressDictionary
                let address = addressDictionary!["Street"]
                let city = addressDictionary!["City"]
                self.geocodingResultTextView.text = "\(address!), \(city!)"
            }
        })
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

