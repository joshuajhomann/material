using System;
using System.Drawing;

using UIKit;
using Foundation;

namespace iOSUILib {

	// @interface MDButton : UIButton
	[BaseType (typeof (UIButton))]
	interface MDButton {

		// -(id)initWithFrame:(CGRect)frame type:(enum MDButtonType)buttonType rippleColor:(UIColor *)rippleColor;
		[Export ("initWithFrame:type:rippleColor:")]
		IntPtr Constructor (RectangleF frame, MDButtonType buttonType,[NullAllowed] UIColor rippleColor);

		// @property (nonatomic) UIColor * rippleColor;
		[Export ("rippleColor")]
		UIColor RippleColor { get; set; }

		// @property (nonatomic) int type;
		[Export("Type")]
		int Type { get; set; }

		// @property (nonatomic) enum MDButtonType mdButtonType;
		[Export ("mdButtonType")]
		MDButtonType MdButtonType { get; set; }

	}

	// @interface MDTableViewCell : UITableViewCell
	[BaseType (typeof (UITableViewCell))]
	interface MDTableViewCell {

		// @property (nonatomic) UIColor * rippleColor;
		[Export ("rippleColor")]
		UIColor RippleColor { get; set; }
	}

	// @interface MDProgress : UIView
	[BaseType (typeof (UIView))]
	interface MDProgress {

		// @property (nonatomic) UIColor * progressColor;
		[Export ("progressColor")]
		UIColor ProgressColor { get; set; }

		// @property (nonatomic) UIColor * trackColor;
		[Export ("trackColor")]
		UIColor TrackColor { get; set; }

		// @property (nonatomic) enum MDProgressType progressType;
		[Export ("progressType")]
		MDProgressType ProgressType { get; set; }

		// @property (nonatomic) enum MDProgressStyle progressStyle;
		[Export ("progressStyle")]
		MDProgressStyle ProgressStyle { get; set; }

		// @property (nonatomic) int type;
		[Export ("type")]
		int Type { get; set; }

		// @property (nonatomic) int style;
		[Export ("style")]
		int Style { get; set; }

		// @property (nonatomic) float progress;
		[Export ("progress")]
		float Progress { get; set; }

		// @property (nonatomic) BOOL enableTrackColor;
		[Export ("enableTrackColor")]
		bool EnableTrackColor { get; set; }
	}

	// @interface MDSwitch : UIControl
	[BaseType (typeof (UIControl))]
	interface MDSwitch {

		// @property (nonatomic, getter = isOn) BOOL on;
		[Export ("on")]
		bool On { [Bind ("isOn")] get; set; }

		// @property (nonatomic, getter = isEnabled) BOOL enabled;
		[Export ("enabled")]
		bool Enabled { [Bind ("isEnabled")] get; set; }

		// @property (nonatomic) UIColor * thumbOn;
		[Export ("thumbOn")]
		UIColor ThumbOn { get; set; }

		// @property (nonatomic) UIColor * trackOn;
		[Export ("trackOn")]
		UIColor TrackOn { get; set; }

		// @property (nonatomic) UIColor * thumbOff;
		[Export ("thumbOff")]
		UIColor ThumbOff { get; set; }

		// @property (nonatomic) UIColor * trackOff;
		[Export ("trackOff")]
		UIColor TrackOff { get; set; }

		// @property (nonatomic) UIColor * thumbDisable;
		[Export ("thumbDisable")]
		UIColor ThumbDisable { get; set; }

		// @property (nonatomic) UIColor * trackDisabled;
		[Export ("trackDisabled")]
		UIColor TrackDisabled { get; set; }
	}

	// @interface MDTextField : UIControl
	[BaseType (typeof (UIControl))]
	interface MDTextField {

		// @property (nonatomic) NSString * hint;
		[Export ("hint")]
		string Hint { get; set; }

		// @property (nonatomic) NSString * label;
		[Export ("label")]
		string Label { get; set; }

		// @property (nonatomic) BOOL floatingLabel;
		[Export ("floatingLabel")]
		bool FloatingLabel { get; set; }

		// @property (nonatomic) BOOL highlightLabel;
		[Export ("highlightLabel")]
		bool HighlightLabel { get; set; }

		// @property (nonatomic) NSString * errorMessage;
		[Export ("errorMessage")]
		string ErrorMessage { get; set; }

		// @property (nonatomic) int maxCharacterCount;
		[Export ("maxCharacterCount")]
		int MaxCharacterCount { get; set; }

		// @property (nonatomic) BOOL hasError;
		[Export ("hasError")]
		bool HasError { get; set; }

		// @property (nonatomic) UIColor * normalColor;
		[Export ("normalColor")]
		UIColor NormalColor { get; set; }

		// @property (nonatomic) UIColor * highlightColor;
		[Export ("highlightColor")]
		UIColor HighlightColor { get; set; }

		// @property (nonatomic) UIColor * errorColor;
		[Export ("errorColor")]
		UIColor ErrorColor { get; set; }

		// @property (nonatomic) UIColor * disableColor;
		[Export ("disableColor")]
		UIColor DisableColor { get; set; }

		// @property (nonatomic) UIColor * textColor;
		[Export ("textColor")]
		UIColor TextColor { get; set; }

		// @property (nonatomic) UIColor * hintColor;
		[Export ("hintColor")]
		UIColor HintColor { get; set; }

		// @property (nonatomic) UIFont * labelsFont;
		[Export ("labelsFont")]
		UIFont LabelsFont { get; set; }

		// @property (nonatomic) UIFont * inputTextFont;
		[Export ("inputTextFont")]
		UIFont InputTextFont { get; set; }

		// @property (nonatomic) NSLayoutConstraint * textViewHeightConstraint;
		[Export ("textViewHeightConstraint")]
		NSLayoutConstraint TextViewHeightConstraint { get; set; }

		// @property (nonatomic, getter = isEnabled) BOOL enabled;
		[Export ("enabled")]
		bool Enabled { [Bind ("isEnabled")] get; set; }

		// @property (nonatomic) BOOL autoComplete;
		[Export ("autoComplete")]
		bool AutoComplete { get; set; }

		// @property (nonatomic) BOOL singleLine;
		[Export ("singleLine")]
		bool SingleLine { get; set; }

		// @property (nonatomic) BOOL fullWidth;
		[Export ("fullWidth")]
		bool FullWidth { get; set; }

		// @property (nonatomic) int minVisibleLines;
		[Export ("minVisibleLines")]
		int MinVisibleLines { get; set; }

		// @property (nonatomic) int maxVisibleLines;
		[Export ("maxVisibleLines")]
		int MaxVisibleLines { get; set; }

		// @property (nonatomic) NSString * text;
		[Export ("text")]
		string Text { get; set; }

//		// @property (nonatomic) AutoResizeTextView * textView;
//		[Export ("textView")]
//		AutoResizeTextView TextView { get; set; }
//
//		// @property (nonatomic) CustomTextField * textField;
//		[Export ("textField")]
//		CustomTextField TextField { get; set; }

		// @property (nonatomic) NSArray * suggestionsDictionary;
		[Export ("suggestionsDictionary")]
		NSObject [] SuggestionsDictionary { get; set; }

		// -(void)updateTextLength:(NSUInteger)textLength;
		[Export ("updateTextLength:")]
		void UpdateTextLength (nuint textLength);

		// -(void)inputTextDidBeginEditing:(NSUInteger)textLength;
		[Export ("inputTextDidBeginEditing:")]
		void InputTextDidBeginEditing (nuint textLength);

		// -(void)inputTextDidEndEditing:(NSUInteger)textLength;
		[Export ("inputTextDidEndEditing:")]
		void InputTextDidEndEditing (nuint textLength);

		// -(void)setPlaceholder:(NSString *)placeholder;
		[Export ("setPlaceholder:")]
		void SetPlaceholder (string placeholder);

		// -(NSUInteger)getTextLength;
		[Export ("getTextLength")]
		nuint GetTextLength ();

		// @property (nonatomic) BOOL secureTextEntry;
		[Export ("secureTextEntry")]
		bool SecureTextEntry { get; set; }
	}

	// @interface MDColor (UIColor)
	[BaseType (typeof (UIColor))]
	[Category]
	interface MDColor {
	}

	// @interface UIColorHelper : NSObject
	[BaseType (typeof (NSObject))]
	interface UIColorHelper {

		// +(UIColor *)colorWithRGBA:(NSString *)rgba;
		[Static, Export ("colorWithRGBA:")]
		UIColor ColorWithRGBA (string rgba);

		// +(UIColor *)colorFromRGB:(NSString *)rgb withAlpha:(float)alpha;
		[Static, Export ("colorFromRGB:withAlpha:")]
		UIColor ColorFromRGB (string rgb, float alpha);
	}

	// @interface MDFont (UIFont)
	[BaseType (typeof (UIFont))]
	[Category]
	interface  MDFont {

		// +(UIFont *)robotoFontOfSize:(CGFloat)fontSize withFontName:(NSString *)fontName;
		[Static, Export ("robotoFontOfSize:withFontName:")]
		 UIFont RobotoFontOfSize (nfloat fontSize, string fontName);

		// +(UIFont *)robotoFontOfSize:(CGFloat)fontSize;
		[Static, Export ("robotoFontOfSize:")]
		UIFont RobotoFontOfSize (nfloat fontSize);

		// +(NSString *)robontoFontName:(MDFontFamilySize)fontFamily withType:(MDFontFamilyType)fontType;
		[Static, Export ("robontoFontName:withType:")]
		string RobontoFontName (MDFontFamilySize fontFamily, MDFontFamilyType fontType);
	}
}


