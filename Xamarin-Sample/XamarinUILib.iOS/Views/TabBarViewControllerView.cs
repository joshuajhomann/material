
using System;

using Foundation;
using UIKit;
using MaterialControls.Core;
using MaterialControls;
using System.Linq;

namespace MaterialControls.iOS
{
	public partial class TabBarViewControllerView : BaseView<TabBarViewControllerViewModel>
	{
		MDTabBarViewController TabBarViewController;
		TabBarViewControllerDelegate Delegate;

		public TabBarViewControllerView () : base ("TabBarViewControllerView", null)
		{
			Delegate = new TabBarViewControllerDelegate ();
				TabBarViewController = new MDTabBarViewController (Delegate);
			TabBarViewController.SetItems (new NSObject [] {
				new NSString ("FIRST TAB"),
				new NSString ("SECOND TAB"),
				new NSString ("THIRD TAB"),
				new NSString ("FOURTH TAB"),
				new NSString ("FIFTH TAB"),
				new NSString ("SIXTH TAB"),
				new NSString ("SEVENTH TAB"),
				new NSString ("EIGHTH TAB"),
				new NSString ("NINTH TAB"),
				new NSString ("TENTH TAB")
			});
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
			
			AddChildViewController (TabBarViewController);
			UIView controllerView = TabBarViewController.View;
			View.AddSubview (controllerView);

			NSDictionary viewsDictionary = new NSDictionary ("TopLayoutGuide", TopLayoutGuide, "BottomLayoutGuide", BottomLayoutGuide, "controllerView", controllerView);
			View.AddConstraints (NSLayoutConstraint.FromVisualFormat ("V:[TopLayoutGuide]-0-[controllerView]-0-[BottomLayoutGuide]", NSLayoutFormatOptions.DirectionLeadingToTrailing, null, viewsDictionary));
			View.AddConstraints (NSLayoutConstraint.FromVisualFormat ("H:|-0-[controllerView]-0-|", NSLayoutFormatOptions.DirectionLeadingToTrailing, null, viewsDictionary));
		}
	}

	public class TabBarViewControllerDelegate: MDTabBarViewControllerDelegate
	{
		#region implemented abstract members of MDTabBarViewControllerDelegate

		public override UIViewController ViewControllerAtIndex (MDTabBarViewController viewController, nuint index)
		{
			TabContentViewController controller = new TabContentViewController("Tab "+ (index + 1));
			return controller;
		}

		#endregion
		
	}
}

