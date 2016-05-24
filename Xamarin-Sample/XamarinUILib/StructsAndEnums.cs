using System;
using ObjCRuntime;

namespace iOSUILib {

	public enum MDButtonType : uint {
		Raised,
		Flat,
		FloatingAction
	}

	public enum MDProgressStyle : uint {
		Circular,
		Linear
	}

	public enum MDProgressType : uint {
		Indeterminate,
		Determinate,
		Buffer,
		QueryIndeterminateAndDeterminate
	}

	public enum ViewState : uint {
		NORMAL,
		HIGHLIGHT,
		ERROR,
		DISABLED
	}

	[Native]
	public enum MDFontFamilySize : long /* nint */ {
		Regular = 0,
		Bold = 1,
		Light = 2,
		Medium = 3,
		Thin = 4,
		Black = 5
	}

	[Native]
	public enum MDFontFamilyType : long /* nint */ {
		Bold = 1,
		Italic = 2
	}
}

