
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
using MaterialControls.Core;
using Cirrious.MvvmCross.Binding.BindingContext;

namespace MaterialControls.Android
{
	[Activity (Label = "ProgressView")]			
	public class ProgressView : BaseView<ProgressViewModel>
	{
		protected override void OnViewModelSet ()
		{
			base.OnViewModelSet ();
			SetContentView (Resource.Layout.progress);
		}
	}
}

