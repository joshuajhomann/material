
using System;

using Foundation;
using UIKit;
using Cirrious.MvvmCross.Touch.Views;
using Cirrious.MvvmCross.Binding.Touch.Views;
using MaterialControls.Core;
using Cirrious.MvvmCross.Binding.BindingContext;

namespace MaterialControls.iOS
{
	public partial class MainView : MvxViewController
	{
		public MainView () : base ("MainView", null)
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
			var source = new MvxStandardTableViewSource (TableView);

			var set = this.CreateBindingSet<MainView,MainViewModel> ();
			set.Bind (source).To (vm => vm.Titles);
			set.Bind (source).For (s => s.SelectionChangedCommand).To (vm => vm.ItemSelectedCommand);
			set.Apply ();

			TableView.Source = source;
			TableView.ReloadData ();

			Title = "Material Design Demo";

			NavigationController.NavigationBar.Translucent = false;
			// Perform any additional setup after loading the view, typically from a nib.
		}

		public override void ViewWillAppear (bool animated)
		{
			base.ViewWillAppear (animated);
			TableView.DeselectRow (TableView.IndexPathForSelectedRow, false);
		}

		public override void ViewDidAppear (bool animated)
		{
			base.ViewDidAppear (animated);
			TableView.DeselectRow (TableView.IndexPathForSelectedRow, false);
		}
	}
}

