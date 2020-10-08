//
//  ThemeHelper.swift
//  Macro43
//
//  Created by Rahman Fadhil on 08/10/20.
//

import UIKit

enum AssetColor: String {
    case background
    case button
}

enum Theme: String {
    case blue
    case green
    case purple
}

class ThemeHelper {
    static func getCurrentTheme() -> Theme {
        let theme = UserDefaultsHelper.getData(type: String.self, forKey: .themeColor) ?? "blue"
        return Theme(rawValue: theme) ?? Theme.blue
    }
    
    static func setTheme(_ theme: Theme) {
        UserDefaultsHelper.setData(value: theme.rawValue, key: .themeColor)
    }
    
    static func getColor(_ color: AssetColor) -> UIColor? {
        let theme = getCurrentTheme()
        let name = "\(theme.rawValue)-\(color.rawValue)"
        return UIColor(named: name)
    }
    
    static func colorizeButton(_ button: UIButton) {
        button.tintColor = getColor(.background)
        button.backgroundColor = getColor(.button)
    }
}
