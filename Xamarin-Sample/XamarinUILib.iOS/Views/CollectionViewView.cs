
using System;

using Foundation;
using UIKit;
using MaterialControls.Core;
using CoreGraphics;
using System.Collections.Generic;

namespace MaterialControls.iOS
{
	public partial class CollectionViewView : BaseView<CollectionViewViewModel>
	{
		public CollectionViewView () : base ("CollectionViewView", null)
		{
		}

		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			
//			NSMutableArray firstSection = [[NSMutableArray alloc] init];
//			for (int i = 0; i < 50; i++) {
//				[firstSection addObject:[NSString stringWithFormat:@"Cell %d", i]];
//			}
//			self.dataArray = [[NSArray alloc] initWithObjects:firstSection, nil];

			UINib cellNib = UINib.FromName ("CollectionViewCell", null);
			CollectionView.RegisterNibForCell (cellNib, "cvCell");

			float cellWidth = ((float)View.Frame.Size.Width - 10) / 2;

			UICollectionViewFlowLayout flowLayout = new UICollectionViewFlowLayout ();
			flowLayout.ItemSize = new CGSize (cellWidth, cellWidth);
			flowLayout.ScrollDirection = UICollectionViewScrollDirection.Vertical;
			CollectionView.CollectionViewLayout = flowLayout;

			List<List<string>> data = new List<List<string>> ();
			List<string> firstSection = new List<string> ();
			firstSection.AddRange (MockData.Countries);
			data.Add (firstSection);

			CollectionView.Source = new CollectionViewSourceDelegate (data);
		}
	}

	public class CollectionViewSourceDelegate :UICollectionViewSource {

		public List<List<string>>Data;
		string cellIndentifier = "cvCell";

		public CollectionViewSourceDelegate(List<List<string>>data) {
			Data = data;
		}

		public override nint NumberOfSections (UICollectionView collectionView)
		{
			return Data.Count;
		}

		public override nint GetItemsCount (UICollectionView collectionView, nint section)
		{
			return Data[(int)section].Count;
		}
		public override UICollectionViewCell GetCell (UICollectionView collectionView, NSIndexPath indexPath)
		{
			string label = Data[indexPath.Section][indexPath.Row];
			UICollectionViewCell cell = (UICollectionViewCell)collectionView.DequeueReusableCell (cellIndentifier, indexPath);

			UILabel titleLabel = (UILabel)cell.ViewWithTag (100);
			titleLabel.Text = label;
			return cell;
		}	
	}
}

