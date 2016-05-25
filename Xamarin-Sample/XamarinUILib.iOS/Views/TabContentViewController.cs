
using System;

using Foundation;
using UIKit;

namespace MaterialControls.iOS
{
	public partial class TabContentViewController : UIViewController
	{
		string Title;

		public TabContentViewController (string title) : base ("TabContentViewController", null)
		{
			Title = title;
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
			Label.Text = Title;
		}
	}
}

