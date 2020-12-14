-- =========================================== --
--  ______     ______     ______     __        --  
-- /\  ___\   /\  ___\   /\  __ \   /\ \       --  
-- \ \  __\   \ \ \____  \ \  __ \  \ \ \____  -- 
--  \ \_____\  \ \_____\  \ \_\ \_\  \ \_____\ --  
--   \/_____/   \/_____/   \/_/\/_/   \/_____/ --
--					       --
-- =========================================== --


-- =================== Imports =================== --

    -- Base
import XMonad
import System.Exit
import qualified XMonad.StackSet as W

    -- Actions
import XMonad.Actions.WithAll (killAll)
import qualified XMonad.Actions.Search as S

    -- Data
import Data.Monoid
import qualified Data.Map as M

    -- Hooks
import XMonad.Hooks.FadeInactive

    -- Layouts
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.WindowArranger

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
    ("M-r", spawn "dmenu_run"), -- Run Prompt
    ("M-c", spawn "chromium --profile-directory='Default'"), -- Chromium (main)
    ("M-S-c", spawn "chromium --profile-directory='Profile 1'"), -- Chromium (alt)

    -- Kill Windows
    ("M-q", kill), -- Focused window
    ("M-S-q", killAll), -- Kill all windows

    -- Layout
    ("M-<Tab>", sendMessage NextLayout), -- Next Layout
    ("M-C-<Up>", sendMessage Arrange),
    ("M-C-<Down>", sendMessage DeArrange),
    ("M-<Up>", sendMessage (MoveUp 5)),
    ("M-<Down>", sendMessage (MoveDown 5)),
    ("M-<Left>", sendMessage (MoveLeft 5)),
    ("M-<Right>", sendMessage (MoveRight 5)),
    ("M-S-<Up>", sendMessage (IncreaseUp 5)),
    ("M-S-<Down>", sendMessage (IncreaseDown 5)),
    ("M-S-<Left>", sendMessage (IncreaseLeft 5)),
    ("M-S-<Right>", sendMessage (IncreaseRight 5)),
    ("M-M1-<Up>", sendMessage (DecreaseUp 5)),
    ("M-M1-<Down>", sendMessage (DecreaseDown 5)),
    ("M-M1-<Left>", sendMessage (DecreaseLeft 5)),
    ("M-M1-<Right>", sendMessage (DecreaseRight 5)),

    -- Focus
    ("M-m", windows W.focusMaster), -- Focus master window
    ("M-j", windows W.focusDown), -- Move focus down
    ("M-k", windows W.focusUp), -- Move focus up
    ("M-S-m", windows W.swapMaster), -- Swap focused with master
    ("M-S-j", windows W.swapDown), -- Swap focused down
    ("M-S-k", windows W.swapUp), -- Swap focused up

    -- Shrink the master area
    ("M-h", sendMessage Shrink),

    -- Expand the master area
    ("M-l", sendMessage Expand),

    -- Push window back into tiling
    ("M-t", withFocused $ windows . W.sink),

    -- Increment the number of windows in the master area
    ("M-,", sendMessage (IncMasterN 1)),

    -- Deincrement the number of windows in the master area
    ("M-.", sendMessage (IncMasterN (-1))),

    -- XMonad
    ("M-S-<Escape>", io (exitWith ExitSuccess)), -- Quit
    ("M-S-r", spawn "xmonad --recompile; xmonad --restart") -- Restart

    ]


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

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.

myLayout = smartBorders tiled ||| Mirror tiled ||| noBorders Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = 
     	--gaps [(U,10), (D,10), (L,10), (R,10)] $ 
     	spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True$
     	Tall nmaster delta ratio 

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100


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

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = return ()


-- =================== Startup =================== --

main = xmonad defaults
-- Launch with xmobar
-- main = do
-- 	xmproc <- spawnPipe "xmobar -x 0 /home/ecal/.config/xmobar/xmobarrc"
-- 	xmonad defaults

-- Options for main
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = False,
        clickJustFocuses   = False,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        --keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = windowArrange myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    } `additionalKeysP` myKeys

