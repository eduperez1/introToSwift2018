//
//  ColorManager.swift
//  Homework5_EP
//
//  Created by Eduardo Perez Cortes on 4/16/18.
//  Copyright © 2018 Eduardo Perez Cortes. All rights reserved.
//

import UIKit

//static var randomRGBValue

struct ColorManager {
    
    static let maxRGBValue: UInt32 = 255
    static let maxRGBFloatValue: CGFloat = CGFloat(maxRGBValue)
    static var randomRGBValue: CGFloat {
        get {
            return CGFloat(arc4random_uniform(maxRGBValue + 1))
        }
    }
    
    /**
     * Se que debo inicializar mi randomValue en otro lado porque ahora mismo
     * solo me devuelve un valor
     */

    static func generateRedColors(desired numberOfColors: Int) -> Array<ColorViewModel>{
        
        var randomRedValues: [CGFloat] = []
        
        for _ in 0..<numberOfColors {
            randomRedValues.append(ColorManager.randomRGBValue)
        }
        
        var redColors: [ColorViewModel] = []
        
        for i in 0..<randomRedValues.count{
            let color = UIColor(red: randomRedValues[i]/maxRGBFloatValue, green: 0, blue: 0, alpha: 1.0)
            let colorName = String(format: "R: %.0f, G: %.0f, B: %.0f, A: %.0f", randomRedValues[i], 0,  0, 1)
            
            
            let colorViewModel = ColorViewModel(name: colorName, color: color, isSelected: false)
            redColors.append(colorViewModel)
        }
        
        return redColors
    }
    
    
    static func generateBlueColors(desired numberOfColors: Int) -> Array<ColorViewModel>{
        
        var randomBlueValues: [CGFloat] = []
        
        for _ in 0..<numberOfColors {
            randomBlueValues.append(ColorManager.randomRGBValue)
        }
        
        var blueColors: [ColorViewModel] = []
        
        for i in 0..<randomBlueValues.count{
            let color = UIColor(red: 0, green: 0, blue: randomBlueValues[i]/maxRGBFloatValue, alpha: 1.0)
            let colorName = String(format: "R: %.0f, G: %.0f, B: %.0f, A: %.0f", 0, 0, randomBlueValues[i], 1)
            let colorViewModel = ColorViewModel(name: colorName, color: color, isSelected: false)
            blueColors.append(colorViewModel)
        }
        
        return blueColors
    }
    
    static func generateRandomColors(desired numberOfColors: Int) -> Array<ColorViewModel>{
        
        var randomRValues: [CGFloat] = []
        var randomGValues: [CGFloat] = []
        var randomBValues: [CGFloat] = []
        
        
        for _ in 0..<numberOfColors {
            randomRValues.append(ColorManager.randomRGBValue)
            randomGValues.append(ColorManager.randomRGBValue)
            randomBValues.append(ColorManager.randomRGBValue)
        }
        
        var randomColors: [ColorViewModel] = []
    

        for i in 0..<randomRValues.count{
            let color = UIColor(red: randomRValues[i]/maxRGBFloatValue, green: randomGValues[i]/maxRGBFloatValue, blue: randomBValues[i]/maxRGBFloatValue, alpha: 1.0)
            let colorName = String(format: "R: %.0f, G: %.0f, B: %.0f, A: %.0f", randomRValues[i], randomGValues[i], randomBValues[i], 1)
            let colorViewModel = ColorViewModel(name: colorName, color: color, isSelected: false)
            randomColors.append(colorViewModel)
        }
        
        return randomColors
    }
    
}



