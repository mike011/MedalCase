//
//  AchievmentsViewController.swift
//  MedalCase
//
//  Created by Michael Charland on 2020-10-25.
//

import UIKit

enum SectionType: Int, CaseIterable {
    case personalRecord
    case virtualEvent
}

class AchievmentsViewController: UICollectionViewController {

    private var models = [EventViewModel]()
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 20, left: 25, bottom: 0, right: 25)
    private let heightModifier: CGFloat = 1.45

    override func viewDidLoad() {
        createModels()
    }

    private func createModels() {
        let networkConnection = MockNetworkConnection()
        models.append(PersonalRecordViewModel(
                        sectionTitleKey: "PersonalRecords",
                        data: networkConnection.loadPersonalRecords()))
        models.append(VirtualEventViewModel(
                        sectionTitleKey: "VirtualEvents",
                        data: networkConnection.loadVirtualEvents()))
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return createCell(collectionView, cellForItemAt: indexPath)
    }

    fileprivate func createCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCell.reuseIdentifier, for: indexPath) as? EventCell else {
            return UICollectionViewCell()
        }

        cell.title.text = models[indexPath.section].getTitle(at: indexPath.row)
        cell.subtitle.text = models[indexPath.section].getSubtitle(at: indexPath.row)
        cell.image.image = models[indexPath.section].getImage(at: indexPath.row)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {

        guard let headerView = getHeaderView(forKind: kind, atIndexPath: indexPath),
              let section = SectionType(rawValue: indexPath.section) else {
            return UICollectionReusableView()
        }

        headerView.titleLabel.text = models[indexPath.section].getSectionTitle()

        switch section {
        case .personalRecord:
            let personalRecord = models[indexPath.section] as! PersonalRecordViewModel
            headerView.infoLabel.text = personalRecord.progressInfo
            return headerView
        case .virtualEvent:
            headerView.infoLabel.isHidden = true
            return headerView
        }
    }

    private func getHeaderView(forKind kind: String, atIndexPath indexPath: IndexPath) -> SectionTitleView? {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return nil
        }
        return collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SectionTitleView.reuseIdentifer,
            for: indexPath) as? SectionTitleView
    }
}

extension AchievmentsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: getWidth(), height: getHeight())
    }

    func getWidth() -> CGFloat {
        let paddingSpace = (itemsPerRow + 1) * sectionInsets.left
        let availableWidth = view.frame.width - paddingSpace
        return availableWidth / itemsPerRow
    }

    func getHeight() -> CGFloat {
        return getWidth() * heightModifier
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
