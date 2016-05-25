
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

namespace MaterialControls.Android
{
	[Activity (Label = "SwitchView")]			
	public class SwitchView : BaseView<SwitchViewModel>
	{
		protected override void OnViewModelSet ()
		{
			base.OnViewModelSet ();
			SetContentView(Resource.Layout.switches);
		}
	}
}

