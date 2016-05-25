
using System;

using Foundation;
using UIKit;
using MaterialControls;
using MaterialControls.Core;

namespace MaterialControls.iOS
{
	public partial class TableViewView : BaseView<TableViewViewModel>
	{
		public TableViewView () : base ("TableView", null)
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
			
			ContentTableView.Source = new TableSource (MockData.Countries);
		}
	}

	public class TableSource : UITableViewSource {
		string[] TableItems;
		string CellIdentifier = "TableCell";

		public TableSource (string[] items)
		{
			TableItems = items;
		}

		public override nint RowsInSection (UITableView tableview, nint section)
		{
			return TableItems.Length;
		}

		public override UITableViewCell GetCell (UITableView tableView, NSIndexPath indexPath)
		{
			UITableViewCell cell = tableView.DequeueReusableCell (CellIdentifier);
			if (cell == null) {
				cell = new MDTableViewCell (UITableViewCellStyle.Default, CellIdentifier);
			}

			cell.TextLabel.Text = TableItems [indexPath.Row];
			return cell;
		}
	}
}

