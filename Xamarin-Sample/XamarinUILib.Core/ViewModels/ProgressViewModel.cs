using System;

namespace MaterialControls.Core
{
	public class ProgressViewModel:BaseViewModel
	{
		Random random;
		Timer t;
		public ProgressViewModel ()
		{
			random = new Random();
		}

		public override void Start ()
		{
			base.Start ();
			t = new Timer (simulateProgress, null, 200, 200);

		}

		private void simulateProgress(object state) {
			float val = random.Next(1,5) / 100f;
			Progress += val;
			if (Progress > 1) {
				Progress = 0;
			}
		}

		float progress;
		public float Progress {
			get {return progress;}
			set { SetProperty (ref progress, value, () => Progress);}
		}
	}
}

