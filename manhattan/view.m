//
//  view.m
//  manhattan
//
//  Created by PHILIP JACOBS on 7/6/13.
//  Copyright (c) 2013 PHILIP JACOBS. All rights reserved.
//

#import <CoreLocation/CLLocation.h>	//for CLLocationCoordinate2D
#import "view.h"
@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
	// Drawing code
    static CLLocationCoordinate2D a1[] = {
		{40.72921,      -73.971548},    //East River at East 17th Street
		{40.735519,     -73.974595},    //24
		{40.742998,     -73.971806},    //34
		{40.754767,     -73.96215},     //53
		{40.762146,     -73.954296},    //65
		{40.771474,     -73.946185},    //81
		{40.776154,     -73.942022},    //89
		{40.776154,     -73.942022},    //96
		{40.787008,     -73.93816},     //103
		{40.795326,     -73.929534},    //118
		{40.800946,     -73.929062},    //125
		{40.808775,     -73.934212},    //Harlem River at 132nd Street
		{40.817772,     -73.933868},    //143
		{40.83547,      -73.935113},    //163
		{40.855857,     -73.922195},    //Dyckman Street
		{40.869878,     -73.91078},     //218
		{40.873416,     -73.911767},    //Broadway Bridge
		{40.877018,     -73.922968},    //Henry Hudson Parkway Bridge
		{40.877082,     -73.926916},    //Hudson River
		{40.867379,     -73.933096},    //Riverside Drive
		{40.852417,     -73.943224},    //Hudson River at West 181st Street
		{40.850339,     -73.946786},    //George Washingon Bridge
		{40.850339,     -73.946786},    //168
		{40.834626,     -73.95052},     //155
		{40.827417,     -73.955026},    //144 sewage treatment plant
		{40.828034,     -73.956399},    //144
		{40.82365,      -73.959446},    //137
		{40.822676,     -73.957601},    //137
		{40.771669,     -73.994765},    //57
		{40.769524,     -73.995152},    //54
		{40.763316,     -73.999872},    //44
		{40.762276,     -74.001718},    //42
		{40.754052,     -74.007726},    //29
		{40.749825,     -74.009442},    //23
		{40.748362,     -74.00794},     //21
		{40.740754,     -74.009228},    //Meatpacking District
		{40.739258,     -74.010344},    //Gansevoort Street
		{40.726218,     -74.011545},    //Holland Tunnel
		{40.718315,     -74.013176},    //Battery Park City
		{40.718737,     -74.016609},    //Battery Park City
		{40.706539,     -74.019227},    //South Cove
		{40.70078,      -74.014893},    //Battery Park
		{40.701919,     -74.009314},    //Heliport
		{40.708523,     -73.997984},    //north of Brooklyn Bridge
		{40.710475,     -73.977985},    //Corlears Hook Park
		{40.712752,     -73.976011},    //Grand Street
		{40.720819,     -73.972964}		//East 6th Street
	};
	
	static const size_t n1 = sizeof a1 / sizeof a1[0];
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	CGSize s = self.bounds.size;
	CGContextTranslateCTM(c, s.width / 2, s.height / 2);
	
	//Longitude and latitude in degrees of the heart of Manhattan,
	//probably somewhere around the Angel of the Waters.
	CGFloat xtranslate = 73.965;
	CGFloat ytranslate = -40.79;
	CGFloat scale = 2200;	//pixels per degree of latitude
    
	//CGContextRotateCTM(c, -28.9 * M_PI / 180);	//negative for counterclockwise
	CGContextScaleCTM(c, scale * cos(ytranslate * M_PI / 180), -scale);
	CGContextTranslateCTM(c, xtranslate, ytranslate);
    
	CGContextBeginPath(c);
	CGContextMoveToPoint(c, a1[0].longitude, a1[0].latitude);
	
	for (size_t i = 1; i < n1; ++i) {
		CGContextAddLineToPoint(c, a1[i].longitude, a1[i].latitude);
	}
	
	CGContextClosePath(c);
	
	//Cut out Central Park
	CGContextMoveToPoint(c, -73.97305, 40.764291);		//Grand Army Plaza
	CGContextAddLineToPoint(c, -73.981762, 40.767997);	//Columbus Circle
	CGContextAddLineToPoint(c, -73.958116, 40.800556);	//Frederick Douglass Circle
	CGContextAddLineToPoint(c, -73.949235, 40.796848);	//Frawley Circle
	CGContextClosePath(c);
	
	//Add Central Park Lake
	static CLLocationCoordinate2D a1a[] = {
		{40.788957420888174, -73.95824432373047},
		{40.788664991278836, -73.9576005935669},
		{40.78837256038171, -73.95747184753418},
		{40.78769021661367, -73.95777225494385},
		{40.78655296141958, -73.95768642425537},
		{40.783238563770986, -73.96017551422119},
		{40.78216622323578, -73.96099090576172},
		{40.78206873687405, -73.96176338195801},
		{40.78236119552992, -73.96296501159668},
		{40.783660996197945, -73.96382331848145},
		{40.785090747552616, -73.96678447723389},
		{40.7876577238784, -73.96605491638184},
		{40.78814511323808, -73.96571159362793},
		{40.78840505276722, -73.9648962020874},
		{40.78811262072539, -73.96395206451416},
		{40.78837256038171, -73.96313667297363},
		{40.78834006798032, -73.96227836608887},
		{40.78889243664182, -73.96137714385986},
		{40.78885994449482, -73.96103382110596},
		{40.788664991278836, -73.95966053009033},
		{40.788957420888174, -73.95845890045166},
		{40.78889243664182, -73.95777225494385}
	};
	static const size_t n1a = sizeof a1a / sizeof a1a[0];
	
	CGContextMoveToPoint(c, a1a[0].longitude, a1a[0].latitude);
	
	for (size_t i = 1; i < n1a; ++i) {
		CGContextAddLineToPoint(c, a1a[i].longitude, a1a[i].latitude);
	}
	CGContextClosePath(c);
	
	//Add Island to lake
	static CLLocationCoordinate2D a1b[] = {
		{40.78723531687313, -73.96210670471191},
		{40.78681290718098, -73.96313667297363},
		{40.785870598954766, -73.96352291107178},
		{40.78483079505022, -73.96249294281006},
		{40.784668324219524, -73.96103382110596},
		{40.78528571126166, -73.9599609375},
		{40.78632550804367, -73.95970344543457},
		{40.78730030274114, -73.96026134490967}
	};
	static const size_t n1b = sizeof a1b / sizeof a1b[0];
	
	CGContextMoveToPoint(c, a1b[0].longitude, a1b[0].latitude);
	
	for (size_t i = 1; i < n1b; ++i) {
		CGContextAddLineToPoint(c, a1b[i].longitude, a1b[i].latitude);
	}
	CGContextClosePath(c);

	
	//Add Randals Island
	static CLLocationCoordinate2D a2[] = {
		{40.8019205061098, -73.9255428314209},
		{40.80185553455108, -73.92279624938965},
		{40.801400731859495, -73.92193794250488},
		{40.79977641109268, -73.92099380493164},
		{40.79932159415491, -73.9203929901123},
		{40.79776219813824, -73.91653060913086},
		{40.79691751000055, -73.91524314880371},
		{40.7960078338323, -73.91481399536133},
		{40.794513338780895, -73.91378402709961},
		{40.79353864997009, -73.91378402709961},
		{40.79126432043123, -73.91618728637695},
		{40.79106937427438, -73.91618728637695},
		{40.790289583923226, -73.91661643981934},
		{40.79048453236955, -73.91730308532715},
		{40.78950978441437, -73.91833305358887},
		{40.78574062435699, -73.92168045043945},
		{40.78567563696274, -73.92202377319336},
		{40.78359600676868, -73.92288208007812},
		{40.78236119552992, -73.92434120178223},
		{40.782231214064105, -73.92511367797852},
		{40.78229620482882, -73.92580032348633},
		{40.78125634496213, -73.92717361450195},
		{40.78093138541519, -73.92803192138672},
		{40.78236119552992, -73.93120765686035},
		{40.7829461089784, -73.93472671508789},
		{40.78405093143805, -73.93567085266113},
		{40.78567563696274, -73.93575668334961},
		{40.790419549617724, -73.93129348754883},
		{40.791329302356345, -73.92983436584473},
		{40.7909394098518, -73.92837524414062},
		{40.79080944517486, -73.9266586303711},
		{40.79119933844256, -73.92605781555176},
		{40.79171919257143, -73.92622947692871},
		{40.79191413682043, -73.92657279968262},
		{40.791459266015764, -73.92640113830566},
		{40.79106937427438, -73.92622947692871},
		{40.79100439209487, -73.9266586303711},
		{40.791134356390245, -73.92760276794434},
		{40.791524247750075, -73.92768859863281},
		{40.79184915546769, -73.92708778381348},
		{40.79230402360135, -73.9281177520752},
		{40.79295382981514, -73.92837524414062},
		{40.79503316696241, -73.92708778381348},
		{40.79639769657359, -73.92691612243652},
		{40.79763224681665, -73.92743110656738},
		{40.800166251701846, -73.92674446105957},
		{40.8019205061098, -73.9255428314209}
	};
	static const size_t n2 = sizeof a2 / sizeof a2[0];
		
	CGContextMoveToPoint(c, a2[0].longitude, a2[0].latitude);
		
	for (size_t i = 1; i < n2; ++i) {
		CGContextAddLineToPoint(c, a2[i].longitude, a2[i].latitude);
	}
	CGContextClosePath(c);
		
	//Add Roosevelt Island
	static CLLocationCoordinate2D a3[] = {
		{40.7731968790187, -73.93987655639648},
		{40.77300187982538, -73.94039154052734},
		{40.772416878811576, -73.9409065246582},
		{40.772481879178564, -73.94142150878906},
		{40.76988181489869, -73.94433975219727},
		{40.76435634049001, -73.948974609375},
		{40.76260109365134, -73.95120620727539},
		{40.76078078870895, -73.9518928527832},
		{40.753629108109145, -73.95824432373047},
		{40.75382416414895, -73.95867347717285},
		{40.75245875985304, -73.95970344543457},
		{40.751808557475776, -73.95987510681152},
		{40.74953279908402, -73.9614200592041},
		{40.75187357799962, -73.95875930786133},
		{40.75349907043135, -73.95618438720703},
		{40.757400090129245, -73.95215034484863},
		{40.75831029512206, -73.95206451416016},
		{40.76110584681915, -73.94888877868652},
		{40.76377126336098, -73.94674301147461},
		{40.76663159147414, -73.94425392150879},
		{40.76871175277928, -73.9423656463623},
		{40.7703368334922, -73.94039154052734},
		{40.7720918760227, -73.94039154052734},
		{40.772936879967084, -73.94013404846191}
	};
	static const size_t n3 = sizeof a3 / sizeof a3[0];
	
	CGContextMoveToPoint(c, a3[0].longitude, a3[0].latitude);
	
	for (size_t i = 1; i < n3; ++i) {
		CGContextAddLineToPoint(c, a3[i].longitude, a3[i].latitude);
	}
	CGContextClosePath(c);

	/*
	CGContextSetLineWidth(c, 1 / scale);
	CGContextSetRGBStrokeColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextStrokePath(c);
	 */
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	//opaque red
	CGContextFillPath(c);
}


@end
