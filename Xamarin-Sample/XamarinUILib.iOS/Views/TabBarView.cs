
using System;

using Foundation;
using UIKit;
using MaterialControls.Core;
using MaterialControls;

namespace MaterialControls.iOS
{
	public partial class TabBarView : BaseView<TabBarViewModel>
	{
		public TabBarView () : base ("TabBarView", null)
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
			TabBar.SetItems( new NSObject []{new NSString ("FIRST TAB"), new NSString ("SECOND TAB")});
			TabBar.Delegate = new TabBarDelegate(SelectedIndexLabel);
		}

		partial void AddClicked (NSObject sender)
		{
			string title = LabelTextField.Text;
			int index = 0;
			Int32.TryParse( IndexTextField.Text, out index);
			TabBar.InsertItem(new NSString (title),(nuint)index,AnimatedSwitch.On);
		}

		partial void RemoveClicked (NSObject sender)
		{
			int index = 0;
			Int32.TryParse( IndexTextField.Text, out index);
			TabBar.RemoveItemAtIndex((nuint)index,AnimatedSwitch.On);
		}

		partial void ReplaceClicked (NSObject sender)
		{
			string title = LabelTextField.Text;
			int index = 0;
			Int32.TryParse( IndexTextField.Text, out index);
			TabBar.ReplaceItem(new NSString (title),(nuint) index);
		}

		partial void SelectClicked (NSObject sender)
		{
			int index = 0;
			Int32.TryParse( IndexTextField.Text, out index);
			TabBar.SelectedIndex = (nuint)index;
		}
	}

	public class TabBarDelegate:MDTabBarDelegate {
		public UILabel SelectedIndexLabel;

		public TabBarDelegate(UILabel selectedIndexLabel) {
			SelectedIndexLabel = selectedIndexLabel;
		}

		#region implemented abstract members of MDTabBarDelegate
		public override void DidChangeSelectedIndex (MDTabBar tabBar, nuint selectedIndex)
		{
			SelectedIndexLabel.Text = selectedIndex + "";
		}
		#endregion
		
	}
}

