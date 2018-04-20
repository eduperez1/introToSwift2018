//
//  ViewController.swift
//  Homework5_EP
//
//  Created by Eduardo Perez Cortes on 4/16/18.
//  Copyright © 2018 Eduardo Perez Cortes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var redColorViewModels: [ColorViewModel] = []
    var blueColorViewModels: [ColorViewModel] = []
    var randomColorViewModels: [ColorViewModel] = []

    var colorViewModels: [ColorViewModel] {
        
        get{
            switch segmentControl.selectedSegmentIndex {
            case 0:
                return redColorViewModels
            case 1:
                return blueColorViewModels
            default:
                return randomColorViewModels
            }
        }
       
    }
    
    @IBOutlet weak var segmentControl: UISegmentedControl!{
        didSet{
            segmentControl.addTarget(self, action: #selector(segmentControlValueChanged), for: UIControlEvents.valueChanged)
        }
    }
    
    @objc private func segmentControlValueChanged(){
        print(segmentControl.selectedSegmentIndex)
        tableView.reloadData()
        
    }
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self as UITableViewDelegate
            tableView.dataSource = self as UITableViewDataSource
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Color Table"
        redColorViewModels = ColorManager.generateRedColors(desired: 100)
        blueColorViewModels = ColorManager.generateBlueColors(desired: 100)
        randomColorViewModels = ColorManager.generateRandomColors(desired: 100)
        tableView.reloadData()
    
    }


}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let colorViewModel: ColorViewModel
        let cell =  UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        colorViewModel = colorViewModels[indexPath.row]
        
        cell.backgroundColor = colorViewModel.color
        cell.textLabel?.text = colorViewModel.name
        cell.textLabel?.textColor = UIColor .white
        
        cell.accessoryType = colorViewModel.isSelected ? .checkmark : .none
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorViewModels.count
    }
   
}


extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var item = colorViewModels[indexPath.row]
        item.isSelected = !item.isSelected
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
           redColorViewModels[indexPath.row] = item
        case 1:
            blueColorViewModels[indexPath.row] = item
        default:
            randomColorViewModels[indexPath.row] = item
        }
        
        tableView.reloadData()

    }
}



