-- Copyright 2007-2011 Mitchell mitchell<att>caladbolg.net. See LICENSE.

local M = {}

--[[ This comment is for LuaDoc.
---
-- Scintilla constants, functions, and properties.
-- Do not modify anything in this module. Doing so will result in instability.
module('_SCINTILLA')]]

---
-- Scintilla constants.
-- @class table
-- @name constants
M.constants = {ANNOTATION_BOXED=2,ANNOTATION_HIDDEN=0,ANNOTATION_STANDARD=1,CARETSTYLE_BLOCK=2,CARETSTYLE_INVISIBLE=0,CARETSTYLE_LINE=1,CARET_EVEN=0x08,CARET_JUMPS=0x10,CARET_SLOP=0x01,CARET_STRICT=0x04,EDGE_BACKGROUND=2,EDGE_LINE=1,EDGE_NONE=0,INDIC0_MASK=0x20,INDIC1_MASK=0x40,INDIC2_MASK=0x80,INDICS_MASK=0xE0,INDIC_BOX=6,INDIC_CONTAINER=8,INDIC_DASH=9,INDIC_DIAGONAL=3,INDIC_DOTBOX=12,INDIC_DOTS=10,INDIC_HIDDEN=5,INDIC_MAX=31,INDIC_PLAIN=0,INDIC_ROUNDBOX=7,INDIC_SQUIGGLE=1,INDIC_SQUIGGLELOW=11,INDIC_STRAIGHTBOX=8,INDIC_STRIKE=4,INDIC_TT=2,INVALID_POSITION=-1,KEYWORDSET_MAX=8,MARKER_MAX=31,SCEN_CHANGE=768,SCEN_KILLFOCUS=256,SCEN_SETFOCUS=512,SCFIND_MATCHCASE=4,SCFIND_POSIX=0x00400000,SCFIND_REGEXP=0x00200000,SCFIND_WHOLEWORD=2,SCFIND_WORDSTART=0x00100000,SCI_ANNOTATIONGETLINES=2546,SCI_ANNOTATIONGETSTYLE=2543,SCI_ANNOTATIONGETSTYLEOFFSET=2551,SCI_ANNOTATIONGETVISIBLE=2549,SCI_ANNOTATIONSETSTYLE=2542,SCI_ANNOTATIONSETSTYLEOFFSET=2550,SCI_ANNOTATIONSETVISIBLE=2548,SCI_AUTOCGETAUTOHIDE=2119,SCI_AUTOCGETCANCELATSTART=2111,SCI_AUTOCGETCHOOSESINGLE=2114,SCI_AUTOCGETDROPRESTOFWORD=2271,SCI_AUTOCGETIGNORECASE=2116,SCI_AUTOCGETMAXHEIGHT=2211,SCI_AUTOCGETMAXWIDTH=2209,SCI_AUTOCGETSEPARATOR=2107,SCI_AUTOCGETTYPESEPARATOR=2285,SCI_AUTOCSETAUTOHIDE=2118,SCI_AUTOCSETCANCELATSTART=2110,SCI_AUTOCSETCHOOSESINGLE=2113,SCI_AUTOCSETDROPRESTOFWORD=2270,SCI_AUTOCSETFILLUPS=2112,SCI_AUTOCSETIGNORECASE=2115,SCI_AUTOCSETMAXHEIGHT=2210,SCI_AUTOCSETMAXWIDTH=2208,SCI_AUTOCSETSEPARATOR=2106,SCI_AUTOCSETTYPESEPARATOR=2286,SCI_CALLTIPSETBACK=2205,SCI_CALLTIPSETFORE=2206,SCI_CALLTIPSETFOREHLT=2207,SCI_CALLTIPSETPOSITION=2213,SCI_CALLTIPUSESTYLE=2212,SCI_GETADDITIONALCARETFORE=2605,SCI_GETADDITIONALCARETSBLINK=2568,SCI_GETADDITIONALCARETSVISIBLE=2609,SCI_GETADDITIONALSELALPHA=2603,SCI_GETADDITIONALSELECTIONTYPING=2566,SCI_GETALLLINESVISIBLE=2236,SCI_GETANCHOR=2009,SCI_GETBACKSPACEUNINDENTS=2263,SCI_GETBUFFEREDDRAW=2034,SCI_GETCARETFORE=2138,SCI_GETCARETLINEBACK=2097,SCI_GETCARETLINEBACKALPHA=2471,SCI_GETCARETLINEVISIBLE=2095,SCI_GETCARETPERIOD=2075,SCI_GETCARETSTICKY=2457,SCI_GETCARETSTYLE=2513,SCI_GETCARETWIDTH=2189,SCI_GETCHARACTERPOINTER=2520,SCI_GETCHARAT=2007,SCI_GETCODEPAGE=2137,SCI_GETCOLUMN=2129,SCI_GETCONTROLCHARSYMBOL=2389,SCI_GETCURRENTPOS=2008,SCI_GETCURSOR=2387,SCI_GETDIRECTFUNCTION=2184,SCI_GETDIRECTPOINTER=2185,SCI_GETDOCPOINTER=2357,SCI_GETEDGECOLOUR=2364,SCI_GETEDGECOLUMN=2360,SCI_GETEDGEMODE=2362,SCI_GETENDATLASTLINE=2278,SCI_GETENDSTYLED=2028,SCI_GETEOLMODE=2030,SCI_GETEXTRAASCENT=2526,SCI_GETEXTRADESCENT=2528,SCI_GETFIRSTVISIBLELINE=2152,SCI_GETFOCUS=2381,SCI_GETFOLDEXPANDED=2230,SCI_GETFOLDLEVEL=2223,SCI_GETFOLDPARENT=2225,SCI_GETFONTQUALITY=2612,SCI_GETHIGHLIGHTGUIDE=2135,SCI_GETHOTSPOTACTIVEUNDERLINE=2496,SCI_GETHOTSPOTSINGLELINE=2497,SCI_GETHSCROLLBAR=2131,SCI_GETIDENTIFIER=2623,SCI_GETINDENT=2123,SCI_GETINDENTATIONGUIDES=2133,SCI_GETINDICATORCURRENT=2501,SCI_GETINDICATORVALUE=2503,SCI_GETKEYSUNICODE=2522,SCI_GETLAYOUTCACHE=2273,SCI_GETLENGTH=2006,SCI_GETLEXER=4002,SCI_GETLINECOUNT=2154,SCI_GETLINEENDPOSITION=2136,SCI_GETLINEINDENTATION=2127,SCI_GETLINEINDENTPOSITION=2128,SCI_GETLINESTATE=2093,SCI_GETLINEVISIBLE=2228,SCI_GETMAINSELECTION=2575,SCI_GETMARGINCURSORN=2249,SCI_GETMARGINLEFT=2156,SCI_GETMARGINMASKN=2245,SCI_GETMARGINOPTIONS=2557,SCI_GETMARGINRIGHT=2158,SCI_GETMARGINSENSITIVEN=2247,SCI_GETMARGINTYPEN=2241,SCI_GETMARGINWIDTHN=2243,SCI_GETMAXLINESTATE=2094,SCI_GETMODEVENTMASK=2378,SCI_GETMODIFY=2159,SCI_GETMOUSEDOWNCAPTURES=2385,SCI_GETMOUSEDWELLTIME=2265,SCI_GETMULTIPASTE=2615,SCI_GETMULTIPLESELECTION=2564,SCI_GETOVERTYPE=2187,SCI_GETPASTECONVERTENDINGS=2468,SCI_GETPOSITIONCACHE=2515,SCI_GETPRINTCOLOURMODE=2149,SCI_GETPRINTMAGNIFICATION=2147,SCI_GETPRINTWRAPMODE=2407,SCI_GETPROPERTYINT=4010,SCI_GETREADONLY=2140,SCI_GETRECTANGULARSELECTIONANCHOR=2591,SCI_GETRECTANGULARSELECTIONANCHORVIRTUALSPACE=2595,SCI_GETRECTANGULARSELECTIONCARET=2589,SCI_GETRECTANGULARSELECTIONCARETVIRTUALSPACE=2593,SCI_GETRECTANGULARSELECTIONMODIFIER=2599,SCI_GETSCROLLWIDTH=2275,SCI_GETSCROLLWIDTHTRACKING=2517,SCI_GETSEARCHFLAGS=2199,SCI_GETSELALPHA=2477,SCI_GETSELECTIONEND=2145,SCI_GETSELECTIONMODE=2423,SCI_GETSELECTIONNANCHOR=2579,SCI_GETSELECTIONNANCHORVIRTUALSPACE=2583,SCI_GETSELECTIONNCARET=2577,SCI_GETSELECTIONNCARETVIRTUALSPACE=2581,SCI_GETSELECTIONNEND=2587,SCI_GETSELECTIONNSTART=2585,SCI_GETSELECTIONS=2570,SCI_GETSELECTIONSTART=2143,SCI_GETSELEOLFILLED=2479,SCI_GETSTATUS=2383,SCI_GETSTYLEAT=2010,SCI_GETSTYLEBITS=2091,SCI_GETSTYLEBITSNEEDED=4011,SCI_GETTABINDENTS=2261,SCI_GETTABWIDTH=2121,SCI_GETTARGETEND=2193,SCI_GETTARGETSTART=2191,SCI_GETTECHNOLOGY=2631,SCI_GETTEXTLENGTH=2183,SCI_GETTWOPHASEDRAW=2283,SCI_GETUNDOCOLLECTION=2019,SCI_GETUSETABS=2125,SCI_GETVIEWEOL=2355,SCI_GETVIEWWS=2020,SCI_GETVIRTUALSPACEOPTIONS=2597,SCI_GETVSCROLLBAR=2281,SCI_GETWHITESPACESIZE=2087,SCI_GETWRAPINDENTMODE=2473,SCI_GETWRAPMODE=2269,SCI_GETWRAPSTARTINDENT=2465,SCI_GETWRAPVISUALFLAGS=2461,SCI_GETWRAPVISUALFLAGSLOCATION=2463,SCI_GETXOFFSET=2398,SCI_GETZOOM=2374,SCI_INDICGETALPHA=2524,SCI_INDICGETFORE=2083,SCI_INDICGETOUTLINEALPHA=2559,SCI_INDICGETSTYLE=2081,SCI_INDICGETUNDER=2511,SCI_INDICSETALPHA=2523,SCI_INDICSETFORE=2082,SCI_INDICSETOUTLINEALPHA=2558,SCI_INDICSETSTYLE=2080,SCI_INDICSETUNDER=2510,SCI_LEXER_START=4000,SCI_LINESONSCREEN=2370,SCI_MARGINGETSTYLE=2533,SCI_MARGINGETSTYLEOFFSET=2538,SCI_MARGINSETSTYLE=2532,SCI_MARGINSETSTYLEOFFSET=2537,SCI_OPTIONAL_START=3000,SCI_RGBAIMAGESETHEIGHT=2625,SCI_RGBAIMAGESETWIDTH=2624,SCI_SELECTIONISRECTANGLE=2372,SCI_SETADDITIONALCARETFORE=2604,SCI_SETADDITIONALCARETSBLINK=2567,SCI_SETADDITIONALCARETSVISIBLE=2608,SCI_SETADDITIONALSELALPHA=2602,SCI_SETADDITIONALSELBACK=2601,SCI_SETADDITIONALSELECTIONTYPING=2565,SCI_SETADDITIONALSELFORE=2600,SCI_SETANCHOR=2026,SCI_SETBACKSPACEUNINDENTS=2262,SCI_SETBUFFEREDDRAW=2035,SCI_SETCARETFORE=2069,SCI_SETCARETLINEBACK=2098,SCI_SETCARETLINEBACKALPHA=2470,SCI_SETCARETLINEVISIBLE=2096,SCI_SETCARETPERIOD=2076,SCI_SETCARETSTICKY=2458,SCI_SETCARETSTYLE=2512,SCI_SETCARETWIDTH=2188,SCI_SETCODEPAGE=2037,SCI_SETCONTROLCHARSYMBOL=2388,SCI_SETCURRENTPOS=2141,SCI_SETCURSOR=2386,SCI_SETDOCPOINTER=2358,SCI_SETEDGECOLOUR=2365,SCI_SETEDGECOLUMN=2361,SCI_SETEDGEMODE=2363,SCI_SETENDATLASTLINE=2277,SCI_SETEOLMODE=2031,SCI_SETEXTRAASCENT=2525,SCI_SETEXTRADESCENT=2527,SCI_SETFIRSTVISIBLELINE=2613,SCI_SETFOCUS=2380,SCI_SETFOLDEXPANDED=2229,SCI_SETFOLDLEVEL=2222,SCI_SETFONTQUALITY=2611,SCI_SETHIGHLIGHTGUIDE=2134,SCI_SETHOTSPOTACTIVEUNDERLINE=2412,SCI_SETHOTSPOTSINGLELINE=2421,SCI_SETHSCROLLBAR=2130,SCI_SETIDENTIFIER=2622,SCI_SETINDENT=2122,SCI_SETINDENTATIONGUIDES=2132,SCI_SETINDICATORCURRENT=2500,SCI_SETINDICATORVALUE=2502,SCI_SETKEYSUNICODE=2521,SCI_SETKEYWORDS=4005,SCI_SETLAYOUTCACHE=2272,SCI_SETLEXER=4001,SCI_SETLINEINDENTATION=2126,SCI_SETLINESTATE=2092,SCI_SETMAINSELECTION=2574,SCI_SETMARGINCURSORN=2248,SCI_SETMARGINLEFT=2155,SCI_SETMARGINMASKN=2244,SCI_SETMARGINOPTIONS=2539,SCI_SETMARGINRIGHT=2157,SCI_SETMARGINSENSITIVEN=2246,SCI_SETMARGINTYPEN=2240,SCI_SETMARGINWIDTHN=2242,SCI_SETMODEVENTMASK=2359,SCI_SETMOUSEDOWNCAPTURES=2384,SCI_SETMOUSEDWELLTIME=2264,SCI_SETMULTIPASTE=2614,SCI_SETMULTIPLESELECTION=2563,SCI_SETOVERTYPE=2186,SCI_SETPASTECONVERTENDINGS=2467,SCI_SETPOSITIONCACHE=2514,SCI_SETPRINTCOLOURMODE=2148,SCI_SETPRINTMAGNIFICATION=2146,SCI_SETPRINTWRAPMODE=2406,SCI_SETPROPERTY=4004,SCI_SETREADONLY=2171,SCI_SETRECTANGULARSELECTIONANCHOR=2590,SCI_SETRECTANGULARSELECTIONANCHORVIRTUALSPACE=2594,SCI_SETRECTANGULARSELECTIONCARET=2588,SCI_SETRECTANGULARSELECTIONCARETVIRTUALSPACE=2592,SCI_SETRECTANGULARSELECTIONMODIFIER=2598,SCI_SETSCROLLWIDTH=2274,SCI_SETSCROLLWIDTHTRACKING=2516,SCI_SETSEARCHFLAGS=2198,SCI_SETSELALPHA=2478,SCI_SETSELECTIONEND=2144,SCI_SETSELECTIONMODE=2422,SCI_SETSELECTIONNANCHOR=2578,SCI_SETSELECTIONNANCHORVIRTUALSPACE=2582,SCI_SETSELECTIONNCARET=2576,SCI_SETSELECTIONNCARETVIRTUALSPACE=2580,SCI_SETSELECTIONNEND=2586,SCI_SETSELECTIONNSTART=2584,SCI_SETSELECTIONSTART=2142,SCI_SETSELEOLFILLED=2480,SCI_SETSTATUS=2382,SCI_SETSTYLEBITS=2090,SCI_SETTABINDENTS=2260,SCI_SETTABWIDTH=2036,SCI_SETTARGETEND=2192,SCI_SETTARGETSTART=2190,SCI_SETTECHNOLOGY=2630,SCI_SETTWOPHASEDRAW=2284,SCI_SETUNDOCOLLECTION=2012,SCI_SETUSETABS=2124,SCI_SETVIEWEOL=2356,SCI_SETVIEWWS=2021,SCI_SETVIRTUALSPACEOPTIONS=2596,SCI_SETVSCROLLBAR=2280,SCI_SETWHITESPACECHARS=2443,SCI_SETWHITESPACESIZE=2086,SCI_SETWORDCHARS=2077,SCI_SETWRAPINDENTMODE=2472,SCI_SETWRAPMODE=2268,SCI_SETWRAPSTARTINDENT=2464,SCI_SETWRAPVISUALFLAGS=2460,SCI_SETWRAPVISUALFLAGSLOCATION=2462,SCI_SETXOFFSET=2397,SCI_SETZOOM=2373,SCI_START=2000,SCI_STYLEGETBACK=2482,SCI_STYLEGETBOLD=2483,SCI_STYLEGETCASE=2489,SCI_STYLEGETCHANGEABLE=2492,SCI_STYLEGETCHARACTERSET=2490,SCI_STYLEGETEOLFILLED=2487,SCI_STYLEGETFORE=2481,SCI_STYLEGETHOTSPOT=2493,SCI_STYLEGETITALIC=2484,SCI_STYLEGETSIZE=2485,SCI_STYLEGETSIZEFRACTIONAL=2062,SCI_STYLEGETUNDERLINE=2488,SCI_STYLEGETVISIBLE=2491,SCI_STYLEGETWEIGHT=2064,SCI_STYLESETBACK=2052,SCI_STYLESETBOLD=2053,SCI_STYLESETCASE=2060,SCI_STYLESETCHANGEABLE=2099,SCI_STYLESETCHARACTERSET=2066,SCI_STYLESETEOLFILLED=2057,SCI_STYLESETFONT=2056,SCI_STYLESETFORE=2051,SCI_STYLESETHOTSPOT=2409,SCI_STYLESETITALIC=2054,SCI_STYLESETSIZE=2055,SCI_STYLESETSIZEFRACTIONAL=2061,SCI_STYLESETUNDERLINE=2059,SCI_STYLESETVISIBLE=2074,SCI_STYLESETWEIGHT=2063,SCK_ADD=310,SCK_BACK=8,SCK_DELETE=308,SCK_DIVIDE=312,SCK_DOWN=300,SCK_END=305,SCK_ESCAPE=7,SCK_HOME=304,SCK_INSERT=309,SCK_LEFT=302,SCK_MENU=315,SCK_NEXT=307,SCK_PRIOR=306,SCK_RETURN=13,SCK_RIGHT=303,SCK_RWIN=314,SCK_SUBTRACT=311,SCK_TAB=9,SCK_UP=301,SCK_WIN=313,SCMOD_ALT=4,SCMOD_CTRL=2,SCMOD_META=16,SCMOD_NORM=0,SCMOD_SHIFT=1,SCMOD_SUPER=8,SCVS_NONE=0,SCVS_RECTANGULARSELECTION=1,SCVS_USERACCESSIBLE=2,SCWS_INVISIBLE=0,SCWS_VISIBLEAFTERINDENT=2,SCWS_VISIBLEALWAYS=1,SC_ALPHA_NOALPHA=256,SC_ALPHA_OPAQUE=255,SC_ALPHA_TRANSPARENT=0,SC_CACHE_CARET=1,SC_CACHE_DOCUMENT=3,SC_CACHE_NONE=0,SC_CACHE_PAGE=2,SC_CARETSTICKY_OFF=0,SC_CARETSTICKY_ON=1,SC_CARETSTICKY_WHITESPACE=2,SC_CASE_LOWER=2,SC_CASE_MIXED=0,SC_CASE_UPPER=1,SC_CHARSET_8859_15=1000,SC_CHARSET_ANSI=0,SC_CHARSET_ARABIC=178,SC_CHARSET_BALTIC=186,SC_CHARSET_CHINESEBIG5=136,SC_CHARSET_CYRILLIC=1251,SC_CHARSET_DEFAULT=1,SC_CHARSET_EASTEUROPE=238,SC_CHARSET_GB2312=134,SC_CHARSET_GREEK=161,SC_CHARSET_HANGUL=129,SC_CHARSET_HEBREW=177,SC_CHARSET_JOHAB=130,SC_CHARSET_MAC=77,SC_CHARSET_OEM=255,SC_CHARSET_RUSSIAN=204,SC_CHARSET_SHIFTJIS=128,SC_CHARSET_SYMBOL=2,SC_CHARSET_THAI=222,SC_CHARSET_TURKISH=162,SC_CHARSET_VIETNAMESE=163,SC_CP_UTF8=65001,SC_CURSORARROW=2,SC_CURSORNORMAL=-1,SC_CURSORREVERSEARROW=7,SC_CURSORWAIT=4,SC_EFF_QUALITY_ANTIALIASED=2,SC_EFF_QUALITY_DEFAULT=0,SC_EFF_QUALITY_LCD_OPTIMIZED=3,SC_EFF_QUALITY_MASK=0xF,SC_EFF_QUALITY_NON_ANTIALIASED=1,SC_EOL_CR=1,SC_EOL_CRLF=0,SC_EOL_LF=2,SC_FOLDFLAG_LEVELNUMBERS=0x0040,SC_FOLDFLAG_LINEAFTER_CONTRACTED=0x0010,SC_FOLDFLAG_LINEAFTER_EXPANDED=0x0008,SC_FOLDFLAG_LINEBEFORE_CONTRACTED=0x0004,SC_FOLDFLAG_LINEBEFORE_EXPANDED=0x0002,SC_FOLDLEVELBASE=0x400,SC_FOLDLEVELHEADERFLAG=0x2000,SC_FOLDLEVELNUMBERMASK=0x0FFF,SC_FOLDLEVELWHITEFLAG=0x1000,SC_FONT_SIZE_MULTIPLIER=100,SC_IV_LOOKBOTH=3,SC_IV_LOOKFORWARD=2,SC_IV_NONE=0,SC_IV_REAL=1,SC_LASTSTEPINUNDOREDO=0x100,SC_MARGINOPTION_NONE=0,SC_MARGINOPTION_SUBLINESELECT=1,SC_MARGIN_BACK=2,SC_MARGIN_FORE=3,SC_MARGIN_NUMBER=1,SC_MARGIN_RTEXT=5,SC_MARGIN_SYMBOL=0,SC_MARGIN_TEXT=4,SC_MARKNUM_FOLDER=30,SC_MARKNUM_FOLDEREND=25,SC_MARKNUM_FOLDERMIDTAIL=27,SC_MARKNUM_FOLDEROPEN=31,SC_MARKNUM_FOLDEROPENMID=26,SC_MARKNUM_FOLDERSUB=29,SC_MARKNUM_FOLDERTAIL=28,SC_MARK_ARROW=2,SC_MARK_ARROWDOWN=6,SC_MARK_ARROWS=24,SC_MARK_AVAILABLE=28,SC_MARK_BACKGROUND=22,SC_MARK_BOXMINUS=14,SC_MARK_BOXMINUSCONNECTED=15,SC_MARK_BOXPLUS=12,SC_MARK_BOXPLUSCONNECTED=13,SC_MARK_CHARACTER=10000,SC_MARK_CIRCLE=0,SC_MARK_CIRCLEMINUS=20,SC_MARK_CIRCLEMINUSCONNECTED=21,SC_MARK_CIRCLEPLUS=18,SC_MARK_CIRCLEPLUSCONNECTED=19,SC_MARK_DOTDOTDOT=23,SC_MARK_EMPTY=5,SC_MARK_FULLRECT=26,SC_MARK_LCORNER=10,SC_MARK_LCORNERCURVE=16,SC_MARK_LEFTRECT=27,SC_MARK_MINUS=7,SC_MARK_PIXMAP=25,SC_MARK_PLUS=8,SC_MARK_RGBAIMAGE=30,SC_MARK_ROUNDRECT=1,SC_MARK_SHORTARROW=4,SC_MARK_SMALLRECT=3,SC_MARK_TCORNER=11,SC_MARK_TCORNERCURVE=17,SC_MARK_UNDERLINE=29,SC_MARK_VLINE=9,SC_MASK_FOLDERS=-33554432,SC_MODEVENTMASKALL=0xFFFFF,SC_MOD_BEFOREDELETE=0x800,SC_MOD_BEFOREINSERT=0x400,SC_MOD_CHANGEANNOTATION=0x20000,SC_MOD_CHANGEFOLD=0x8,SC_MOD_CHANGEINDICATOR=0x4000,SC_MOD_CHANGELINESTATE=0x8000,SC_MOD_CHANGEMARGIN=0x10000,SC_MOD_CHANGEMARKER=0x200,SC_MOD_CHANGESTYLE=0x4,SC_MOD_CONTAINER=0x40000,SC_MOD_DELETETEXT=0x2,SC_MOD_INSERTTEXT=0x1,SC_MOD_LEXERSTATE=0x80000,SC_MULTILINEUNDOREDO=0x1000,SC_MULTIPASTE_EACH=1,SC_MULTIPASTE_ONCE=0,SC_MULTISTEPUNDOREDO=0x80,SC_PERFORMED_REDO=0x40,SC_PERFORMED_UNDO=0x20,SC_PERFORMED_USER=0x10,SC_PRINT_BLACKONWHITE=2,SC_PRINT_COLOURONWHITE=3,SC_PRINT_COLOURONWHITEDEFAULTBG=4,SC_PRINT_INVERTLIGHT=1,SC_PRINT_NORMAL=0,SC_SEL_LINES=2,SC_SEL_RECTANGLE=1,SC_SEL_STREAM=0,SC_SEL_THIN=3,SC_STARTACTION=0x2000,SC_STATUS_BADALLOC=2,SC_STATUS_FAILURE=1,SC_STATUS_OK=0,SC_TECHNOLOGY_DEFAULT=0,SC_TECHNOLOGY_DIRECTWRITE=1,SC_TIME_FOREVER=10000000,SC_TYPE_BOOLEAN=0,SC_TYPE_INTEGER=1,SC_TYPE_STRING=2,SC_UPDATE_CONTENT=0x1,SC_UPDATE_H_SCROLL=0x8,SC_UPDATE_SELECTION=0x2,SC_UPDATE_V_SCROLL=0x4,SC_WEIGHT_BOLD=700,SC_WEIGHT_NORMAL=400,SC_WEIGHT_SEMIBOLD=600,SC_WRAPINDENT_FIXED=0,SC_WRAPINDENT_INDENT=2,SC_WRAPINDENT_SAME=1,SC_WRAPVISUALFLAGLOC_DEFAULT=0x0000,SC_WRAPVISUALFLAGLOC_END_BY_TEXT=0x0001,SC_WRAPVISUALFLAGLOC_START_BY_TEXT=0x0002,SC_WRAPVISUALFLAG_END=0x0001,SC_WRAPVISUALFLAG_NONE=0x0000,SC_WRAPVISUALFLAG_START=0x0002,SC_WRAP_CHAR=2,SC_WRAP_NONE=0,SC_WRAP_WORD=1,STYLE_BRACEBAD=35,STYLE_BRACELIGHT=34,STYLE_CALLTIP=38,STYLE_CONTROLCHAR=36,STYLE_DEFAULT=32,STYLE_INDENTGUIDE=37,STYLE_LASTPREDEFINED=39,STYLE_LINENUMBER=33,STYLE_MAX=255,UNDO_MAY_COALESCE=1,VISIBLE_SLOP=0x01,VISIBLE_STRICT=0x04,SCN_DOUBLECLICK=2006,SCN_AUTOCCHARDELETED=2027,SCN_SAVEPOINTLEFT=2003,SCN_PAINTED=2013,SCN_HOTSPOTRELEASECLICK=2028,SCN_UPDATEUI=2007,SCN_STYLENEEDED=2000,SCN_AUTOCCANCELLED=2026,SCN_MACRORECORD=2009,SCN_INDICATORRELEASE=2024,SCN_MODIFIED=2008,SCN_SAVEPOINTREACHED=2002,SCN_HOTSPOTDOUBLECLICK=2020,SCN_NEEDSHOWN=2011,SCN_CALLTIPCLICK=2021,SCN_AUTOCSELECTION=2022,SCN_DWELLEND=2017,SCN_ZOOM=2018,SCN_CHARADDED=2001,SCN_HOTSPOTCLICK=2019,SCN_KEY=2005,SCN_DWELLSTART=2016,SCN_MARGINCLICK=2010,SCN_USERLISTSELECTION=2014,SCN_URIDROPPED=2015,SCN_INDICATORCLICK=2023,SCN_MODIFYATTEMPTRO=2004,SCLEX_CONTAINER=0,SCLEX_AUTOMATIC=1000,SCLEX_LPEG=999,SCLEX_NULL=1}

---
-- Scintilla functions.
-- @class table
-- @name functions
M.functions = {add_ref_document={2376,0,0,1},add_selection={2573,1,1,1},add_styled_text={2002,0,2,9},add_text={2001,0,2,7},add_undo_action={2560,0,1,1},allocate={2446,0,1,0},annotation_clear_all={2547,0,0,0},annotation_get_styles={2545,1,1,8},annotation_get_text={2541,1,1,8},annotation_set_styles={2544,0,1,7},annotation_set_text={2540,0,1,7},append_text={2282,0,2,7},assign_cmd_key={2070,0,6,1},auto_c_active={2102,5,0,0},auto_c_cancel={2101,0,0,0},auto_c_complete={2104,0,0,0},auto_c_get_current={2445,1,0,0},auto_c_get_current_text={2610,1,0,8},auto_c_pos_start={2103,3,0,0},auto_c_select={2108,0,0,7},auto_c_show={2100,0,1,7},auto_c_stops={2105,0,0,7},back_tab={2328,0,0,0},begin_undo_action={2078,0,0,0},brace_bad_light={2352,0,3,0},brace_bad_light_indicator={2499,0,5,1},brace_highlight={2351,0,3,3},brace_highlight_indicator={2498,0,5,1},brace_match={2353,3,3,0},call_tip_active={2202,5,0,0},call_tip_cancel={2201,0,0,0},call_tip_pos_start={2203,3,0,0},call_tip_set_hlt={2204,0,1,1},call_tip_show={2200,0,3,7},can_paste={2173,5,0,0},can_redo={2016,5,0,0},can_undo={2174,5,0,0},cancel={2325,0,0,0},change_lexer_state={2617,1,3,3},char_left={2304,0,0,0},char_left_extend={2305,0,0,0},char_left_rect_extend={2428,0,0,0},char_position_from_point={2561,3,1,1},char_position_from_point_close={2562,3,1,1},char_right={2306,0,0,0},char_right_extend={2307,0,0,0},char_right_rect_extend={2429,0,0,0},choose_caret_x={2399,0,0,0},clear={2180,0,0,0},clear_all={2004,0,0,0},clear_all_cmd_keys={2072,0,0,0},clear_cmd_key={2071,0,6,0},clear_document_style={2005,0,0,0},clear_registered_images={2408,0,0,0},clear_selections={2571,0,0,0},colourise={4003,0,3,3},contracted_fold_next={2618,1,1,0},convert_eo_ls={2029,0,1,0},copy={2178,0,0,0},copy_allow_line={2519,0,0,0},copy_range={2419,0,3,3},copy_text={2420,0,2,7},count_characters={2633,1,1,1},create_document={2375,1,0,0},create_loader={2632,1,1,0},cut={2177,0,0,0},del_line_left={2395,0,0,0},del_line_right={2396,0,0,0},del_word_left={2335,0,0,0},del_word_right={2336,0,0,0},del_word_right_end={2518,0,0,0},delete_back={2326,0,0,0},delete_back_not_line={2344,0,0,0},describe_key_word_sets={4017,1,0,8},describe_property={4016,1,7,8},doc_line_from_visible={2221,1,1,0},document_end={2318,0,0,0},document_end_extend={2319,0,0,0},document_start={2316,0,0,0},document_start_extend={2317,0,0,0},edit_toggle_overtype={2324,0,0,0},empty_undo_buffer={2175,0,0,0},encoded_from_utf8={2449,1,7,8},end_undo_action={2079,0,0,0},ensure_visible={2232,0,1,0},ensure_visible_enforce_policy={2234,0,1,0},find_column={2456,1,1,1},find_text={2150,3,1,11},form_feed={2330,0,0,0},format_range={2151,3,5,12},get_cur_line={2027,1,2,8},get_hotspot_active_back={2495,4,0,0},get_hotspot_active_fore={2494,4,0,0},get_last_child={2224,1,1,1},get_lexer_language={4012,1,0,8},get_line={2153,1,1,8},get_line_sel_end_position={2425,3,1,0},get_line_sel_start_position={2424,3,1,0},get_property={4008,1,7,8},get_property_expanded={4009,1,7,8},get_sel_text={2161,1,0,8},get_styled_text={2015,1,0,10},get_tag={2616,1,1,8},get_text={2182,1,2,8},get_text_range={2162,1,0,10},goto_line={2024,0,1,0},goto_pos={2025,0,3,0},grab_focus={2400,0,0,0},hide_lines={2227,0,1,1},hide_selection={2163,0,5,0},home={2312,0,0,0},home_display={2345,0,0,0},home_display_extend={2346,0,0,0},home_extend={2313,0,0,0},home_rect_extend={2430,0,0,0},home_wrap={2349,0,0,0},home_wrap_extend={2450,0,0,0},indicator_all_on_for={2506,1,1,0},indicator_clear_range={2505,0,1,1},indicator_end={2509,1,1,1},indicator_fill_range={2504,0,1,1},indicator_start={2508,1,1,1},indicator_value_at={2507,1,1,1},insert_text={2003,0,3,7},line_copy={2455,0,0,0},line_cut={2337,0,0,0},line_delete={2338,0,0,0},line_down={2300,0,0,0},line_down_extend={2301,0,0,0},line_down_rect_extend={2426,0,0,0},line_duplicate={2404,0,0,0},line_end={2314,0,0,0},line_end_display={2347,0,0,0},line_end_display_extend={2348,0,0,0},line_end_extend={2315,0,0,0},line_end_rect_extend={2432,0,0,0},line_end_wrap={2451,0,0,0},line_end_wrap_extend={2452,0,0,0},line_from_position={2166,1,3,0},line_length={2350,1,1,0},line_scroll={2168,0,1,1},line_scroll_down={2342,0,0,0},line_scroll_up={2343,0,0,0},line_transpose={2339,0,0,0},line_up={2302,0,0,0},line_up_extend={2303,0,0,0},line_up_rect_extend={2427,0,0,0},lines_join={2288,0,0,0},lines_split={2289,0,1,0},load_lexer_library={4007,0,0,7},lower_case={2340,0,0,0},margin_get_styles={2535,1,1,8},margin_get_text={2531,1,1,8},margin_set_styles={2534,0,1,7},margin_set_text={2530,0,1,7},margin_text_clear_all={2536,0,0,0},marker_add={2043,1,1,1},marker_add_set={2466,0,1,1},marker_define={2040,0,1,1},marker_define_pixmap={2049,0,1,7},marker_define_rgba_image={2626,0,1,7},marker_delete={2044,0,1,1},marker_delete_all={2045,0,1,0},marker_delete_handle={2018,0,1,0},marker_enable_highlight={2293,0,5,0},marker_get={2046,1,1,0},marker_line_from_handle={2017,1,1,0},marker_next={2047,1,1,1},marker_previous={2048,1,1,1},marker_set_alpha={2476,0,1,1},marker_set_back={2042,0,1,4},marker_set_back_selected={2292,0,1,4},marker_set_fore={2041,0,1,4},marker_symbol_defined={2529,1,1,0},move_caret_inside_view={2401,0,0,0},move_selected_lines_down={2621,0,0,0},move_selected_lines_up={2620,0,0,0},new_line={2329,0,0,0},null={2172,0,0,0},page_down={2322,0,0,0},page_down_extend={2323,0,0,0},page_down_rect_extend={2434,0,0,0},page_up={2320,0,0,0},page_up_extend={2321,0,0,0},page_up_rect_extend={2433,0,0,0},para_down={2413,0,0,0},para_down_extend={2414,0,0,0},para_up={2415,0,0,0},para_up_extend={2416,0,0,0},paste={2179,0,0,0},point_x_from_position={2164,1,0,3},point_y_from_position={2165,1,0,3},position_after={2418,3,3,0},position_before={2417,3,3,0},position_from_line={2167,3,1,0},position_from_point={2022,3,1,1},position_from_point_close={2023,3,1,1},private_lexer_call={4013,1,1,1},property_names={4014,1,0,8},property_type={4015,1,7,0},redo={2011,0,0,0},register_image={2405,0,1,7},register_rgba_image={2627,0,1,7},release_document={2377,0,0,1},replace_sel={2170,0,0,7},replace_target={2194,1,2,7},replace_target_re={2195,1,2,7},rotate_selection={2606,0,0,0},scroll_caret={2169,0,0,0},scroll_to_end={2629,0,0,0},scroll_to_start={2628,0,0,0},search_anchor={2366,0,0,0},search_in_target={2197,1,2,7},search_next={2367,1,1,7},search_prev={2368,1,1,7},select_all={2013,0,0,0},selection_duplicate={2469,0,0,0},set_chars_default={2444,0,0,0},set_empty_selection={2556,0,3,0},set_fold_flags={2233,0,1,0},set_fold_margin_colour={2290,0,5,4},set_fold_margin_hi_colour={2291,0,5,4},set_hotspot_active_back={2411,0,5,4},set_hotspot_active_fore={2410,0,5,4},set_length_for_encode={2448,0,1,0},set_lexer_language={4006,0,0,7},set_save_point={2014,0,0,0},set_sel={2160,0,3,3},set_sel_back={2068,0,5,4},set_sel_fore={2067,0,5,4},set_selection={2572,1,1,1},set_styling={2033,0,2,1},set_styling_ex={2073,0,2,7},set_text={2181,0,0,7},set_visible_policy={2394,0,1,1},set_whitespace_back={2085,0,5,4},set_whitespace_fore={2084,0,5,4},set_x_caret_policy={2402,0,1,1},set_y_caret_policy={2403,0,1,1},show_lines={2226,0,1,1},start_record={3001,0,0,0},start_styling={2032,0,3,1},stop_record={3002,0,0,0},stuttered_page_down={2437,0,0,0},stuttered_page_down_extend={2438,0,0,0},stuttered_page_up={2435,0,0,0},stuttered_page_up_extend={2436,0,0,0},style_clear_all={2050,0,0,0},style_get_font={2486,1,1,8},style_reset_default={2058,0,0,0},swap_main_anchor_caret={2607,0,0,0},tab={2327,0,0,0},target_as_utf8={2447,1,0,8},target_from_selection={2287,0,0,0},text_height={2279,1,1,0},text_width={2276,1,1,7},toggle_caret_sticky={2459,0,0,0},toggle_fold={2231,0,1,0},undo={2176,0,0,0},upper_case={2341,0,0,0},use_pop_up={2371,0,5,0},user_list_show={2117,0,1,7},vc_home={2331,0,0,0},vc_home_extend={2332,0,0,0},vc_home_rect_extend={2431,0,0,0},vc_home_wrap={2453,0,0,0},vc_home_wrap_extend={2454,0,0,0},vertical_centre_caret={2619,0,0,0},visible_from_doc_line={2220,1,1,0},word_end_position={2267,1,3,5},word_left={2308,0,0,0},word_left_end={2439,0,0,0},word_left_end_extend={2440,0,0,0},word_left_extend={2309,0,0,0},word_part_left={2390,0,0,0},word_part_left_extend={2391,0,0,0},word_part_right={2392,0,0,0},word_part_right_extend={2393,0,0,0},word_right={2310,0,0,0},word_right_end={2441,0,0,0},word_right_end_extend={2442,0,0,0},word_right_extend={2311,0,0,0},word_start_position={2266,1,3,5},wrap_count={2235,1,1,0},zoom_in={2333,0,0,0},zoom_out={2334,0,0,0}}

---
-- Scintilla properties.
-- @class table
-- @name properties
M.properties = {additional_caret_fore={2605,2604,4,0},additional_carets_blink={2568,2567,5,0},additional_carets_visible={2609,2608,5,0},additional_sel_alpha={2603,2602,1,0},additional_sel_back={0,2601,4,0},additional_sel_fore={0,2600,4,0},additional_selection_typing={2566,2565,5,0},all_lines_visible={2236,0,5,0},anchor={2009,2026,3,0},annotation_lines={2546,0,1,1},annotation_style={2543,2542,1,1},annotation_style_offset={2551,2550,1,0},annotation_visible={2549,2548,1,0},auto_c_auto_hide={2119,2118,5,0},auto_c_cancel_at_start={2111,2110,5,0},auto_c_choose_single={2114,2113,5,0},auto_c_drop_rest_of_word={2271,2270,5,0},auto_c_fill_ups={0,2112,7,0},auto_c_ignore_case={2116,2115,5,0},auto_c_max_height={2211,2210,1,0},auto_c_max_width={2209,2208,1,0},auto_c_separator={2107,2106,1,0},auto_c_type_separator={2285,2286,1,0},back_space_un_indents={2263,2262,5,0},buffered_draw={2034,2035,5,0},call_tip_back={0,2205,4,0},call_tip_fore={0,2206,4,0},call_tip_fore_hlt={0,2207,4,0},call_tip_position={0,2213,5,0},call_tip_use_style={0,2212,1,0},caret_fore={2138,2069,4,0},caret_line_back={2097,2098,4,0},caret_line_back_alpha={2471,2470,1,0},caret_line_visible={2095,2096,5,0},caret_period={2075,2076,1,0},caret_sticky={2457,2458,1,0},caret_style={2513,2512,1,0},caret_width={2189,2188,1,0},char_at={2007,0,1,3},character_pointer={2520,0,1,0},code_page={2137,2037,1,0},column={2129,0,1,3},control_char_symbol={2389,2388,1,0},current_pos={2008,2141,3,0},cursor={2387,2386,1,0},direct_function={2184,0,1,0},direct_pointer={2185,0,1,0},doc_pointer={2357,2358,1,0},eol_mode={2030,2031,1,0},edge_colour={2364,2365,4,0},edge_column={2360,2361,1,0},edge_mode={2362,2363,1,0},end_at_last_line={2278,2277,5,0},end_styled={2028,0,3,0},extra_ascent={2526,2525,1,0},extra_descent={2528,2527,1,0},first_visible_line={2152,2613,1,0},focus={2381,2380,5,0},fold_expanded={2230,2229,5,1},fold_level={2223,2222,1,1},fold_parent={2225,0,1,1},font_quality={2612,2611,1,0},h_scroll_bar={2131,2130,5,0},highlight_guide={2135,2134,1,0},hotspot_active_underline={2496,2412,5,0},hotspot_single_line={2497,2421,5,0},identifier={2623,2622,1,0},indent={2123,2122,1,0},indentation_guides={2133,2132,1,0},indic_alpha={2524,2523,1,1},indic_fore={2083,2082,4,1},indic_outline_alpha={2559,2558,1,1},indic_style={2081,2080,1,1},indic_under={2511,2510,5,1},indicator_current={2501,2500,1,0},indicator_value={2503,2502,1,0},key_words={0,4005,7,1},keys_unicode={2522,2521,5,0},layout_cache={2273,2272,1,0},length={2006,0,1,0},lexer={4002,4001,1,0},line_count={2154,0,1,0},line_end_position={2136,0,1,1},line_indent_position={2128,0,3,1},line_indentation={2127,2126,1,1},line_state={2093,2092,1,1},line_visible={2228,0,5,1},lines_on_screen={2370,0,1,0},main_selection={2575,2574,1,0},margin_cursor_n={2249,2248,1,1},margin_left={2156,2155,1,0},margin_mask_n={2245,2244,1,1},margin_options={2557,2539,1,0},margin_right={2158,2157,1,0},margin_sensitive_n={2247,2246,5,1},margin_style={2533,2532,1,1},margin_style_offset={2538,2537,1,0},margin_type_n={2241,2240,1,1},margin_width_n={2243,2242,1,1},max_line_state={2094,0,1,0},mod_event_mask={2378,2359,1,0},modify={2159,0,5,0},mouse_down_captures={2385,2384,5,0},mouse_dwell_time={2265,2264,1,0},multi_paste={2615,2614,1,0},multiple_selection={2564,2563,5,0},overtype={2187,2186,5,0},paste_convert_endings={2468,2467,5,0},position_cache={2515,2514,1,0},print_colour_mode={2149,2148,1,0},print_magnification={2147,2146,1,0},print_wrap_mode={2407,2406,1,0},property={0,4004,7,7},property_int={4010,0,1,7},rgba_image_height={0,2625,1,0},rgba_image_width={0,2624,1,0},read_only={2140,2171,5,0},rectangular_selection_anchor={2591,2590,3,0},rectangular_selection_anchor_virtual_space={2595,2594,1,0},rectangular_selection_caret={2589,2588,3,0},rectangular_selection_caret_virtual_space={2593,2592,1,0},rectangular_selection_modifier={2599,2598,1,0},scroll_width={2275,2274,1,0},scroll_width_tracking={2517,2516,5,0},search_flags={2199,2198,1,0},sel_alpha={2477,2478,1,0},sel_eol_filled={2479,2480,5,0},selection_end={2145,2144,3,0},selection_is_rectangle={2372,0,5,0},selection_mode={2423,2422,1,0},selection_n_anchor={2579,2578,3,1},selection_n_anchor_virtual_space={2583,2582,1,1},selection_n_caret={2577,2576,3,1},selection_n_caret_virtual_space={2581,2580,1,1},selection_n_end={2587,2586,3,1},selection_n_start={2585,2584,3,1},selection_start={2143,2142,3,0},selections={2570,0,1,0},status={2383,2382,1,0},style_at={2010,0,1,3},style_back={2482,2052,4,1},style_bits={2091,2090,1,0},style_bits_needed={4011,0,1,0},style_bold={2483,2053,5,1},style_case={2489,2060,1,1},style_changeable={2492,2099,5,1},style_character_set={2490,2066,1,1},style_eol_filled={2487,2057,5,1},style_font={0,2056,7,1},style_fore={2481,2051,4,1},style_hot_spot={2493,2409,5,1},style_italic={2484,2054,5,1},style_size={2485,2055,1,1},style_size_fractional={2062,2061,1,1},style_underline={2488,2059,5,1},style_visible={2491,2074,5,1},style_weight={2064,2063,1,1},tab_indents={2261,2260,5,0},tab_width={2121,2036,1,0},target_end={2193,2192,3,0},target_start={2191,2190,3,0},technology={2631,2630,1,0},text_length={2183,0,1,0},two_phase_draw={2283,2284,5,0},undo_collection={2019,2012,5,0},use_tabs={2125,2124,5,0},v_scroll_bar={2281,2280,5,0},view_eol={2355,2356,5,0},view_ws={2020,2021,1,0},virtual_space_options={2597,2596,1,0},whitespace_chars={0,2443,7,0},whitespace_size={2087,2086,1,0},word_chars={0,2077,7,0},wrap_indent_mode={2473,2472,1,0},wrap_mode={2269,2268,1,0},wrap_start_indent={2465,2464,1,0},wrap_visual_flags={2461,2460,1,0},wrap_visual_flags_location={2463,2462,1,0},x_offset={2398,2397,1,0},zoom={2374,2373,1,0}}

local marker_number, indic_number, list_type = -1, 7, 0

---
-- Returns a unique marker number.
-- Use this function for custom markers in order to prevent clashes with
-- identifiers of other custom markers.
-- @usage local marknum = _SCINTILLA.next_marker_number()
-- @see buffer.marker_define
-- @name next_marker_number
function M.next_marker_number()
  marker_number = marker_number + 1
  return marker_number
end

---
-- Returns a unique indicator number.
-- Use this function for custom indicators in order to prevent clashes with
-- identifiers of other custom indicators.
-- @usage local indic_num = _SCINTILLA.next_indic_number()
-- @see buffer.indic_style
-- @name next_indic_number
function M.next_indic_number()
  indic_number = indic_number + 1
  return indic_number
end

---
-- Returns a unique user list type.
-- Use this function for custom user lists in order to prevent clashes with
-- type identifiers of other custom user lists.
-- @usage local list_type = _SCINTILLA.next_user_list_type()
-- @see buffer.user_list_show
-- @name next_user_list_type
function M.next_user_list_type()
  list_type = list_type + 1
  return list_type
end

return M
