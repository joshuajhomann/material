using System;
using CoreGraphics;
using System.Collections.Generic;

using Foundation;
using UIKit;
using iOSUILib;

namespace XamarinUILibDemo
{
	public partial class MasterViewController : UITableViewController
	{
		static String[] controlsName = { "Button", "TableViewCell", "Progress", "TextField", "Switch", "DatePicker"};

		DataSource dataSource;

		public MasterViewController (IntPtr handle) : base (handle)
		{
			Title = NSBundle.MainBundle.LocalizedString ("Master", "Master");

			// Custom initialization
		}

//		void AddNewItem (object sender, EventArgs args)
//		{
//			dataSource.Objects.Insert (0, DateTime.Now);
//
//			using (var indexPath = NSIndexPath.FromRowSection (0, 0))
//				TableView.InsertRows (new NSIndexPath[] { indexPath }, UITableViewRowAnimation.Automatic);
//		}

		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			
			// Perform any additional setup after loading the view, typically from a nib.
//			NavigationItem.LeftBarButtonItem = EditButtonItem;
//
//			var addButton = new UIBarButtonItem (UIBarButtonSystemItem.Add, AddNewItem);
//			NavigationItem.RightBarButtonItem = addButton;

			TableView.Source = dataSource = new DataSource (this);

			foreach (var control in controlsName) {
				dataSource.AppRow (control);
			}
		}

//		public override void RowSelected (UITableView tableView, NSIndexPath indexPath)
//		{
//
//		}



		class DataSource : UITableViewSource
		{
			static readonly NSString CellIdentifier = new NSString ("Cell");
			readonly List<object> objects = new List<object> ();
			readonly MasterViewController masterController;

			public DataSource (MasterViewController controller)
			{
				this.masterController = controller;
			}

			public void AppRow(String title) {
				objects.Add (title);
			}

			public IList<object> Objects {
				get { return objects; }
			}

			// Customize the number of sections in the table view.
			public override nint NumberOfSections (UITableView tableView)
			{
				return 1;
			}

			public override nint RowsInSection (UITableView tableview, nint section)
			{
				return objects.Count;
			}

			// Customize the appearance of table view cells.
			public override UITableViewCell GetCell (UITableView tableView, NSIndexPath indexPath)
			{
				var cell = (UITableViewCell)tableView.DequeueReusableCell (CellIdentifier, indexPath);

//				cell.RippleColor = UIColor.Red;

				cell.TextLabel.Text = objects [indexPath.Row].ToString ();

				return cell;
			}

			public override bool CanEditRow (UITableView tableView, NSIndexPath indexPath)
			{
				// Return false if you do not want the specified item to be editable.
				return true;
			}

			public override void CommitEditingStyle (UITableView tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath indexPath)
			{
				if (editingStyle == UITableViewCellEditingStyle.Delete) {
					// Delete the row from the data source.
					objects.RemoveAt (indexPath.Row);
					masterController.TableView.DeleteRows (new NSIndexPath[] { indexPath }, UITableViewRowAnimation.Fade);
				} else if (editingStyle == UITableViewCellEditingStyle.Insert) {
					// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
				}
			}

			public override void RowSelected (UITableView tableView, NSIndexPath indexPath)
			{
				UIViewController controller = null;
				String row = controlsName[indexPath.Row];
				if(row.Equals("Button")) {
					controller = new ButtonViewController ();
				} else if(row.Equals("Progress")) {
					controller = new ProgressViewController ();
				} else if(row.Equals("TextField")) {
					controller = new TextFieldViewController();
				} else if(row.Equals("Switch")) {
					controller = new SwitchViewController ();
				}

				if(controller != null)
					masterController.NavigationController.PushViewController(controller, true);
			}

			/*
			// Override to support rearranging the table view.
			public override void MoveRow (UITableView tableView, NSIndexPath sourceIndexPath, NSIndexPath destinationIndexPath)
			{
			}
			*/

			/*
			// Override to support conditional rearranging of the table view.
			public override bool CanMoveRow (UITableView tableView, NSIndexPath indexPath)
			{
				// Return false if you do not want the item to be re-orderable.
				return true;
			}
			*/
		}

//		public override void PrepareForSegue (UIStoryboardSegue segue, NSObject sender)
//		{
//			if (segue.Identifier == "showDetail") {
//				var indexPath = TableView.IndexPathForSelectedRow;
//				var item = dataSource.Objects [indexPath.Row];
//
//				((DetailViewController)segue.DestinationViewController).SetDetailItem (item);
//			}
//		}
	}
}

