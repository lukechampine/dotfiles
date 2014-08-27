/* See LICENSE file for copyright and license details. */

/* for media keys */
#include <X11/XF86keysym.h>
#define XK_VolUp XF86XK_AudioRaiseVolume
#define XK_VolDn XF86XK_AudioLowerVolume

/* appearance */
static const char font[]            = "-*-terminus2-*-*-*-*-*-*-*-*-*-*-*-*";

static const char bordercolors[2][8] =
   /* focused,   unfocused */
    { "#696969", "#212121" };

static const char tagcolors[2][ColLast][8] = {
   /* foreground background */
    { "#696969", "#121212" }, /* selected */
    { "#eeeeee", "#121212" }, /* unselected */
};

#define NUMCOLORS 6
static const char statuscolors[NUMCOLORS][ColLast][8] = {
   /* foreground background */
    { "#363636", "#121212" }, // 1 = black to gray
    { "#eeeeee", "#363636" }, // 2 = white on gray
    { "#121212", "#363636" }, // 3 = gray to black
    { "#eeeeee", "#121212" }, // 4 = white on black
    { "#ff0000", "#363636" }, // 5 = red on gray
    { "#ff0000", "#121212" }, // 6 = red on black
};

static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int paddingpx = 10;       /* window padding */
static const unsigned int snap      = 10;       /* snap pixel */
static const Bool overlap           = True;     /* False means double-size vertical gap */

/* tagging */
static const char *tags[] = { "\u00B3", "\u00B4", "\u00B5", "\u00D2" };

static const Rule rules[] = { 
	/* class      instance    title       tag (0 for current)  isfloating */
	{ "Firefox",  NULL,       NULL,       2,                   False },
	{ "feh",      NULL,       NULL,       0,                   True  },
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "\u00A2",   tile },    /* first entry is default */
	{ "\u00A2",   tilegap },
	{ "\u00A3",   floating },
	{ " [M]",     monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.i = TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.i = TAG} }, 

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", statuscolors[0][ColBG], "-nf", statuscolors[0][ColFG], "-sb", statuscolors[1][ColBG], "-sf", statuscolors[1][ColFG], NULL };
static const char *termcmd[] = { "urxvt", NULL };
static const char *browser[] = { "firefox", NULL };
static const char *volumeup[] = { "amixer", "-q", "set", "PCM", "3dB+", NULL };
static const char *volumedown[] = { "amixer", "-q", "set", "PCM", "3dB-", NULL };
static const char *htop[] = { "urxvt", "-e", "htop" };
static const char *slimlock[] = { "slimlock" };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      spawn,          {.v = browser } },
	{ MODKEY|ShiftMask,             XK_l,      spawn,          {.v = slimlock } },
	{ MODKEY,                       XK_r,      spawn,          {.v = dmenucmd } },
    { 0,                            XK_VolUp,  spawn,          {.v = volumeup } },
    { 0,                            XK_VolDn,  spawn,          {.v = volumedown } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1} },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1} },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1} },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1} },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {.i = -1} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.i = 0} },
	{ MODKEY|ShiftMask,             XK_t,      setlayout,      {.i = 1} },
	{ MODKEY,                       XK_f,      setlayout,      {.i = 2} },
	{ MODKEY,                       XK_m,      setlayout,      {.i = 3} },
	{ MODKEY,                       XK_space,  setlayout,      {.i =-1} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {.i = -1} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        spawn,          {.v = htop} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
};

