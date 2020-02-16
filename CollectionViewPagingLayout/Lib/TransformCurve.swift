//
//  TransformCurve.swift
//  CollectionViewPagingLayout
//
//  Created by Amir Khorsandi on 2/16/20.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import UIKit

public enum TransformCurve {
    case linear
    case easeIn
    case easeOut
}


public extension TransformCurve {
    
    func computeProgress(min: CGFloat, max: CGFloat, progress: CGFloat) -> CGFloat {
        switch self {
        case .linear:
            return progress
        case .easeIn, .easeOut:
            let logValue = (abs(progress - min) / abs(max - min)) * 9
            let value: CGFloat
            if self == .easeOut {
                value = 1 - log10(1 + (9 - logValue))
            } else {
                value = log10(1 + logValue)
            }
            return value
        }
    }
    
}
