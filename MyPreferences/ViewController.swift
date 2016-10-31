//
//  ViewController.swift
//  MySettings
//
//  Created by Charles Konkol on 3/23/15.
//  Copyright (c) 2015 Rock Valley College. All rights reserved.
//

import UIKit
//class start
class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    //delegates
    @IBOutlet weak var txtFullName: UITextField!
   
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var MyBirthYear: UIPickerView!
    
    
    //Clear Event
    @IBAction func btnClear(sender: AnyObject) {
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(nil, forKey: "FullName")
        defaults.setObject(nil, forKey: "Address")
        defaults.setObject(nil, forKey: "BirthYear")
        
        defaults.synchronize()
        
        txtFullName.text = ""
        txtAddress.text = ""
        MyBirthYear.selectRow(0,inComponent: 0, animated: true)
 txtFullName.becomeFirstResponder()
    }
    
    //BirthYear
    var SelectedBirthYears:String!
    let pickerBirthYear = ["1940", "1941", "1942", "1943", "1944", "1945", "1946", "1947", "1948", "1949", "1950", "1951", "1952", "1953", "1954", "1955", "1956", "1957", "1958", "1959", "1960", "1961", "1962", "1963", "1964", "1965", "1966", "1967", "1968", "1969", "1970", "1971", "1972", "1973", "1974", "1975", "1976", "1977", "1978", "1979", "1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020"]
    
    
    
    
    //Load Event
    @IBAction func btnLoad(sender: UIButton) {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("FullName") as? String) != nil {
            self.txtFullName.text = defaults.objectForKey("FullName") as? String
        }
        
        if (defaults.objectForKey("Address") as? String) != nil {
            self.txtAddress.text = defaults.objectForKey("Address") as? String
        }
        
        if (defaults.objectForKey("BirthYear") as? String) != nil {
        
        let favoriteBirthYearSelected = defaults.objectForKey("BirthYear") as! String
        let SelectedBirthYear:Int = (pickerBirthYear).indexOf(favoriteBirthYearSelected)!
        MyBirthYear.selectRow(SelectedBirthYear, inComponent: 0, animated: true)
        }
        
    }
    
    
    //Save Event
    @IBAction func btnSave(sender: UIButton) {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
            defaults.setObject(self.txtFullName.text, forKey: "FullName")
        defaults.setObject(self.txtAddress.text, forKey: "Address")
        defaults.setObject(SelectedBirthYears, forKey: "BirthYear")
   

        
        defaults.synchronize()
    }
    
    
    //Needed for picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerBirthYear.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         SelectedBirthYears=pickerBirthYear[row]
         print(SelectedBirthYears)
        return pickerBirthYear[row]
       
    }
    
    
    //new method hiding keyboard
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches , withEvent: event)
    }
    
    //set delegate to all uitextfields
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFullName.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        }
        
}