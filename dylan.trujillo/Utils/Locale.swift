//
//  Locale.swift
//  dylan.trujillo
//
//  Created by dtrujillobaez on 03/09/2020.
//  Copyright © 2020 Dylan Trujillo. All rights reserved.
//

import Foundation

enum LocaleKeys: String {
    
    // MARK: ListScreen
    case listscreen_add_button
    case listscreen_remove_all_button
    case listscreen_sort_asc_button
    case listscreen_table_title
    case listscreen_input_placeholder
    case listscreen_table_empty
    
    // MARK: MainScreen
    case mainscreen_call_service_button
    case mainscreen_go_to_list_button
    case mainscreen_response
    
    // MARK: Misc
    case ok
    case error_title
    case error_no_data
    
    var localized: String {
        get {
            return self.rawValue.localized()
        }
    }
}
