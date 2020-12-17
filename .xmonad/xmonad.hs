-- =========================================== --
--  ______     ______     ______     __        --  
-- /\  ___\   /\  ___\   /\  __ \   /\ \       --  
-- \ \  __\   \ \ \____  \ \  __ \  \ \ \____  -- 
--  \ \_____\  \ \_____\  \ \_\ \_\  \ \_____\ --  
--   \/_____/   \/_____/   \/_/\/_/   \/_____/ --
--																			       --
-- =========================================== --


-- =================== Imports =================== --

    -- Base
import XMonad
import System.Exit
import qualified XMonad.StackSet as W

    -- Actions
import XMonad.Actions.WithAll (killAll)
import XMonad.Actions.WindowNavigation
import qualified XMonad.Actions.Search as S

    -- Data
import Data.Monoid
import qualified Data.Map as M

    -- Hooks
import XMonad.Hooks.FadeInactive

    -- Layouts
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.WindowArranger
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Renamed

    -- Utils
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce


-- =================== Variables =================== --

    -- Modkey
myModMask :: KeyMask
myModMask = mod4Mask -- Windows key

    -- Alt Mask
altMask :: KeyMask
altMask = mod1Mask

    -- Terminal
myTerminal :: String
myTerminal = "alacritty" -- Only works if fish is installed

    -- Editor
myEditor :: String
myEditor = "nvim"

    -- Border
myBorderWidth :: Dimension
myBorderWidth = 4

myFocusedBorderColor :: String
myFocusedBorderColor = "#4ec9b0" -- turquoise

myNormalBorderColor :: String
myNormalBorderColor = "#dddddd" -- grey

    -- Workspaces
myWorkspaces = ["main","alt1","alt2"]

    -- Opacity
myLogHook :: X ()
myLogHook = fadeInactiveLogHook 0.9

    -- Search Engines
archwiki = S.searchEngine "archwiki" "https://wiki.archlinux.org/index.php?search="
searchList :: [(String, S.SearchEngine)]
searchList = [
    ("a", archwiki),
    ("d", S.vocabulary),
    ("i", S.images),
    ("g", S.google),
    ("t", S.thesaurus),
    ("v", S.youtube),
    ("w", S.wikipedia)
    ]


-- =================== Key bindings =================== --

myKeys :: [(String, X ())]
myKeys = [
    -- Launch Programs
    ("M-<Return>", spawn myTerminal), -- Terminal
    ("M-r", spawn "rofi -show drun"), -- Run Prompt
    ("M-<Space>", spawn "rofi -show drun"), -- Run Prompt
    ("M-c", spawn "chromium --profile-directory='Default'"), -- Chromium (main)
    ("M-S-c", spawn "chromium --profile-directory='Profile 1'"), -- Chromium (alt)
		("M-o", spawn "chromium https://onq.queensu.ca/d2l/home"), -- OnQ
		("M-n", spawn "chromium https://www.notion.so/ecall/"), -- Notion

    -- Kill Windows
    ("M-q", kill), -- Focused window
    ("M-S-q", killAll), -- Kill all windows

    -- Layout
    ("M-<Tab>", sendMessage NextLayout), -- Next Layout
    ("M-C-<Down>", sendMessage DeArrange), -- Tile Mode
    ("M-S-<Tab>", withFocused $ windows . W.sink), -- Push window back into tiling
    ("M-S-h", sendMessage Shrink), -- Shrink horizontal
    ("M-S-l", sendMessage Expand), -- Expand horizontal
    ("M-S-j", sendMessage MirrorShrink), -- Shrink vertical
    ("M-S-k", sendMessage MirrorExpand), -- Expand vertical
    ("M-,", sendMessage (IncMasterN 1)), -- Add a window to master area
    ("M-.", sendMessage (IncMasterN (-1))), -- Remove a window from master area

    -- Floating Layout
    ("M-C-<Up>", sendMessage Arrange), -- Floating Mode
    ("M-<Up>", sendMessage (MoveUp 10)),
    ("M-<Down>", sendMessage (MoveDown 10)),
    ("M-<Left>", sendMessage (MoveLeft 10)),
    ("M-<Right>", sendMessage (MoveRight 10)),
    ("M-S-<Up>", sendMessage (IncreaseUp 10)),
    ("M-S-<Down>", sendMessage (DecreaseDown 10)),
    ("M-S-<Left>", sendMessage (IncreaseLeft 10)),
    ("M-S-<Right>", sendMessage (DecreaseRight 10)),
    ("M-M1-<Up>", sendMessage (DecreaseUp 10)),
    ("M-M1-<Down>", sendMessage (IncreaseDown 10)),
    ("M-M1-<Left>", sendMessage (DecreaseLeft 10)),
    ("M-M1-<Right>", sendMessage (IncreaseRight 10)),

    -- Focus
    ("M-m", windows W.focusMaster), -- Focus master window
    ("M-C-m", windows W.swapMaster), -- Swap focused with master

    -- XMonad
    ("C-M1-<Delete>", io (exitWith ExitSuccess)), -- Quit
    ("M-S-r", spawn "xmonad --recompile; xmonad --restart"), -- Restart

		-- Function Keys
		("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +2%"),
    ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@  -2%"),
    ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"),

    ("<XF86AudioPlay>", spawn "$HOME/scripts/sp play"),
    ("<XF86AudioPrev>", spawn "$HOME/scripts/sp prev"),
    ("<XF86AudioNext>", spawn "$HOME/scripts/sp next"),

    ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 2"),
    ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 2")
    ]

myWindowNavigation = withWindowNavigationKeys ([
												((myModMask, xK_k), WNGo U),
												((myModMask, xK_j), WNGo D),
												((myModMask, xK_h), WNGo L),
												((myModMask, xK_l), WNGo R),
												((myModMask .|. controlMask, xK_k), WNSwap U),
												((myModMask .|. controlMask, xK_j), WNSwap D),
												((myModMask .|. controlMask, xK_h), WNSwap L),
												((myModMask .|. controlMask, xK_l), WNSwap R)
										])

-- =================== Mouse Bindings =================== --

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]


-- =================== Layouts =================== --
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw True (Border i i i i) True (Border i i i i) True

tall		= renamed [Replace "tall"]
						$ smartBorders
						$ mySpacing 5
						$ ResizableTall 1 (3/100) (1/2) [] -- Numbers: windows in master, increment on resize, proportion for master
spirals	= renamed [Replace "spirals"]
						$ smartBorders
						$ mySpacing 5
						$ spiral (6/7)
full		= renamed [Replace "full"]
						$ noBorders Full

myLayoutHook = windowArrange myLayout
								where
										myLayout =			tall
																|||	spirals
																|||	full

-- =================== Window Rules =================== --

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]


-- =================== Event Handling =================== --

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty


-- =================== Startup =================== --

myStartupHook :: X ()
myStartupHook = do
		spawnOnce "nitrogen --restore &"
		spawnOnce "picom &"
		spawnOnce "xsetroot -cursor_name left_ptr &"



-- =================== Main =================== --

main = do
		config <- myWindowNavigation
				$ defaults
		xmonad config

defaults = def {
        terminal           = myTerminal,
        focusFollowsMouse  = False,
        clickJustFocuses   = False,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        mouseBindings      = myMouseBindings,
        layoutHook         = myLayoutHook,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    } `additionalKeysP` myKeys

