using System;
using Cirrious.MvvmCross.Touch.Views;
using UIKit;
using MaterialControls.Core;
using Foundation;

namespace MaterialControls.iOS
{
	public class BaseView<T>:MvxViewController where T:BaseViewModel
	{
		public T ViewModel {
			get { 
				return base.ViewModel as T;
			}
			set { 
				base.ViewModel = value;
			}
		}

		protected BaseView (string nibName, NSBundle bundle) : base (nibName, bundle)
		{
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			var tap = new UITapGestureRecognizer { CancelsTouchesInView = false };
			tap.AddTarget (
				() => View.EndEditing (true)
			);
			tap.ShouldReceiveTouch = (recognizer, touch) => 
				!(touch.View is UIControl || touch.View.FindSuperviewOfType(View,typeof(UITableViewCell)) != null || touch.View.FindSuperviewOfType(View,typeof(UICollectionViewCell)) != null);
			View.AddGestureRecognizer (tap);
		}
	}
}

