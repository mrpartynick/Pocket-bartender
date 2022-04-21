import UIKit
import SnapKit

class CocktailDescriptionViewController: UIViewController {

    //MARK: - Some var's
    static let cockTailImage = UIImage()
    static let cocktailDescription = ""

    static let cocktailImageView = UIImageView()
    static let cocktailDescriptionLabel = UILabel()

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        CocktailDescriptionViewController.cocktailDescriptionLabel.numberOfLines = 0

        view.addSubview(CocktailDescriptionViewController.cocktailDescriptionLabel)
        view.addSubview(CocktailDescriptionViewController.cocktailImageView)

        CocktailDescriptionViewController.cocktailImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(self.view.center.y)
        }

        CocktailDescriptionViewController.cocktailDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(CocktailDescriptionViewController.cocktailImageView.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }

    }


}
