//
//  CellDelegate.swift
//  CineRoom
//
//  Created by Wagner Ongaro Junior on 02/03/21.
//

import Foundation

protocol CellDelegate: class {
	func selectedCell(indexPath: IndexPath, id: Int?)
}
