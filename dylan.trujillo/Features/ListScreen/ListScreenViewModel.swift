//
//  ListScreenViewModel.swift
//  dylan.trujillo
//
//  Created by Lang Troyan on 03/09/2020.
//  Copyright © 2020 Dylan Trujillo. All rights reserved.
//

import Foundation

class ListScreenViewModel {
    
    // MARK: Properties
    
    private var list: Array<Int> = []
    
    // MARK: Class methods
    
    func add(_ input: Int) {
        guard input > 0 else { return }
        for _ in 1...input {
            list.append(Int.random(in: 1...999))
        }
    }
    
    func remove(at index: Int) {
        guard index < getListCount() else { return }
        list.remove(at: index)
    }
    
    func removeAll() {
        list = []
    }
    
    func sortList() {
        list.sort()
    }
    
    func getListValue(in index: Int) -> Int? {
        guard index < getListCount() else { return nil }
        return list[index]
    }
    
    func getListCount() -> Int {
        return list.count
    }
}
