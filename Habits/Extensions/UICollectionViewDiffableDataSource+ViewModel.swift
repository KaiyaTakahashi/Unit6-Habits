//
//  UICollectionViewDiffableDataSource+ViewModel.swift
//  Habits
//
//  Created by Kaiya Takahashi on 2022-06-03.
//

import UIKit

extension UICollectionViewDiffableDataSource {
    func applySnapshotUsing(sectionIDs: [SectionIdentifierType], itemsBySection: [SectionIdentifierType: [ItemIdentifierType]], sectionRetainedIfEmoty: Set<SectionIdentifierType> = Set<SectionIdentifierType>()) {
        applySnapShotUsing(sectionIDs: sectionIDs, itemsBySection: itemsBySection, animatingDifferences: true, sectionsRetainedIfEmpty: sectionRetainedIfEmoty)
    }
    
    func applySnapShotUsing(sectionIDs: [SectionIdentifierType], itemsBySection: [SectionIdentifierType: [ItemIdentifierType]], animatingDifferences: Bool, sectionsRetainedIfEmpty: Set<SectionIdentifierType> = Set<SectionIdentifierType>()) {
        var snapshot = NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType>()
        
        for sectionID in sectionIDs {
            guard let sectionItems = itemsBySection[sectionID], sectionItems.count > 0 || sectionsRetainedIfEmpty.contains(sectionID) else { continue }
            
            snapshot.appendSections([sectionID])
            snapshot.appendItems(sectionItems, toSection: sectionID)
            snapshot.reloadItems(sectionItems)
        }
        
        self.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}
