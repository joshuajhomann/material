
using System;

using Foundation;
using UIKit;
using MaterialControls.Core;
using MaterialControls;

namespace MaterialControls.iOS
{
	public partial class SnackBarView : BaseView<SnackBarViewModel>
	{
		public SnackBarView () : base ("SnackBarView", null)
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
			
			// Perform any additional setup after loading the view, typically from a nib.
		}

		partial void ButtonClicked (NSObject sender)
		{
			MDSnackbar snackBar = new MDSnackbar("Connection time out","Retry");
			snackBar.Show();
		}
	}
}

