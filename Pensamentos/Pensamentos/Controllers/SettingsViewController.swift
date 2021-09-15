//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Gilmar Junior on 15/09/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var autoRefreshSwitch: UISwitch!
    @IBOutlet weak var timeIntervalLabel: UILabel!
    @IBOutlet weak var timeIntervalSlider: UISlider!
    @IBOutlet weak var colorSchemeSC: UISegmentedControl!
    
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { notification in
            
            self.formatView()
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    func formatView() {
        autoRefreshSwitch.setOn(config.autoRefresh, animated: false)
        timeIntervalSlider.setValue(Float(config.timeInterval), animated: false)
        colorSchemeSC.selectedSegmentIndex = config.colorScheme
        changeTimeIntervalLAbel(with: config.timeInterval)
    
    }
    
    func changeTimeIntervalLAbel(with value: Double){
        timeIntervalLabel.text = "Mudar após \(Int(value)) segundos"
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeIntervalLAbel(with: value)
        config.timeInterval = value
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
        
    }
    
    

}
