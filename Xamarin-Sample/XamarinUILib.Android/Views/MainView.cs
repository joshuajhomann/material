
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Cirrious.MvvmCross.Droid.Views;
using MaterialControls.Core;
using Cirrious.MvvmCross.Binding.BindingContext;

namespace MaterialControls.Android
{
	[Activity (Label = "Main", MainLauncher = true)]			
	public class MainView : BaseView<MainViewModel>
	{
		protected override void OnViewModelSet ()
		{
			base.OnViewModelSet ();
			SetContentView (Resource.Layout.main);
		}
	}
}

