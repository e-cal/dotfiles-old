-- =========================================== --
--  ______     ______     ______     __        --
-- /\  ___\   /\  ___\   /\  __ \   /\ \       --
-- \ \  __\   \ \ \____  \ \  __ \  \ \ \____  --
--  \ \_____\  \ \_____\  \ \_\ \_\  \ \_____\ --
--   \/_____/   \/_____/   \/_/\/_/   \/_____/ --
--                                             --
-- =========================================== --

--------------------------------------------------------------------------------
-- Imports
--------------------------------------------------------------------------------

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
import XMonad.Hooks.Place
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.Minimize
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

    -- Layouts
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.WindowArranger
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Renamed
import XMonad.Layout.Minimize

    -- Utils
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce

    -- DBus
import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

--------------------------------------------------------------------------------
-- Variables
--------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------
-- Workspaces
--------------------------------------------------------------------------------

wsMain = "\xf015"
ws2 = "\xfcc1"
ws3 = "\xf718"
wsMusic = "\xf001"

myWorkspaces :: [String]
myWorkspaces = [wsMain, ws2, ws3, wsMusic]

--------------------------------------------------------------------------------
-- Search Engines
--------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------
-- Layouts
--------------------------------------------------------------------------------
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw True (Border i i i i) True (Border i i i i) True

tall    = renamed [Replace "Main"]
            $ avoidStruts
            $ smartBorders
            $ mySpacing 5
            $ ResizableTall 1 (3/100) (1/2) [] -- Numbers: windows in master, increment on resize, proportion for master
full    = renamed [Replace "Fullscreen"]
            $ noBorders Full

myLayoutHook = windowArrange myLayout
                where
                    myLayout = tall ||| full

--------------------------------------------------------------------------------
-- Manage Hook
--------------------------------------------------------------------------------
myManageHook = composeAll
    [ className =? "MPlayer"          --> doFloat
    , className =? "Gimp"             --> doFloat
    , resource  =? "desktop_window"   --> doIgnore
    , className =? "feh"              --> doFloat
    , className =? "Gpick"            --> doFloat
    , role      =? "pop-up"           --> doFloat ]
  where
    role = stringProperty "WM_WINDOW_ROLE"
myManageHook' = composeOne [ isFullscreen -?> doFullFloat ]

--------------------------------------------------------------------------------
-- Startup Hook
--------------------------------------------------------------------------------

myStartupHook :: X ()
myStartupHook = do
    spawn "$HOME/.config/polybar/launch.sh"
    -- spawnOnce "xsetroot -cursor_name left_ptr &"


--------------------------------------------------------------------------------
-- Main
--------------------------------------------------------------------------------
main = do
    dbus <- D.connectSession
    -- Request access to the DBus name
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

    mainConfig <- myWindowNavigation
        $ ewmh
        $ docks
        $ myConfig {
            logHook = dynamicLogWithPP (myLogHook dbus)
                >> fadeInactiveLogHook 0.9
        }

    xmonad mainConfig

--------------------------------------------------------------------------------
-- LogHook (xmonad-log output)
--------------------------------------------------------------------------------


-- Colours
fg        = "#ebdbb2"
bg        = "#282828"
gray      = "#a89984"
bg1       = "#3c3836"
bg2       = "#505050"
bg3       = "#665c54"
bg4       = "#7c6f64"

green     = "#b8bb26"
darkgreen = "#98971a"
red       = "#fb4934"
darkred   = "#cc241d"
yellow    = "#fabd2f"
blue      = "#83a598"
purple    = "#d3869b"
cyan      = "#4ec9b0"
white     = "#eeeeee"

pur2      = "#5b51c9"
blue2     = "#2266d0"

myDisable :: String -> String
myDisable str = ""

myLogHook :: D.Client -> PP
myLogHook dbus = def
    { ppOutput = dbusOutput dbus
    , ppCurrent = wrap ("%{F" ++ cyan ++ "} ") " %{F-}"
    , ppVisible = wrap ("%{F" ++ blue2 ++ "} ") " %{F-}"
    , ppUrgent = wrap ("%{F" ++ red ++ "} ") " %{F-}"
    , ppHidden = wrap " " " "
    , ppWsSep = ""
    , ppSep = " | "
    , ppTitle = myDisable
    , ppLayout = myDisable
    }

dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal objectPath interfaceName memberName) {
            D.signalBody = [D.toVariant $ UTF8.decodeString str]
        }
    D.emit dbus signal
  where
    objectPath = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName = D.memberName_ "Update"


--------------------------------------------------------------------------------
-- Mouse Bindings
--------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------
-- Config
--------------------------------------------------------------------------------

myConfig = def
    { terminal           = myTerminal
    , layoutHook         = myLayoutHook
    , manageHook         = placeHook(smart(0.5, 0.5))
        <+> manageDocks
        <+> myManageHook
        <+> myManageHook'
        <+> manageHook def
    , handleEventHook    = docksEventHook
        <+> minimizeEventHook
        <+> fullscreenEventHook
    , startupHook        = myStartupHook
    , focusFollowsMouse  = False
    , clickJustFocuses   = False
    , borderWidth        = myBorderWidth
    , modMask            = myModMask
    , workspaces         = myWorkspaces
    , normalBorderColor  = gray
    , focusedBorderColor = cyan
    , mouseBindings      = myMouseBindings
    } `additionalKeysP` [
--------------------------------------------------------------------------------
-- Keybindings
--------------------------------------------------------------------------------

    -- Launch Programs
        ("M-<Return>", spawn myTerminal) -- Terminal
      , ("M-r", spawn "rofi -show drun") -- Run Prompt
      , ("M-<Space>", spawn "rofi -show drun") -- Run Prompt
      , ("M-c", spawn "chromium --profile-directory='Default'") -- Chromium (main)
      , ("M-S-c", spawn "chromium --profile-directory='Profile 1'") -- Chromium (alt)
      , ("M-o", spawn "chromium https://onq.queensu.ca/d2l/home") -- OnQ
      , ("M-n", spawn "chromium https://www.notion.so/ecall/") -- Notion
      , ("M-b", spawn "$HOME/.config/polybar/launch.sh")

    -- Kill Windows
      , ("M-q", kill) -- Focused window
      , ("M-S-q", killAll) -- Kill all windows

    -- Layout
      , ("M-S-<Tab>", sendMessage NextLayout) -- Next Layout
      , ("M-C-<Down>", sendMessage DeArrange) -- Tile Mode
      , ("M-C-<Tab>", withFocused $ windows . W.sink) -- Push window back into tiling
      , ("M-S-h", sendMessage Shrink) -- Shrink horizontal
      , ("M-S-l", sendMessage Expand) -- Expand horizontal
      , ("M-S-j", sendMessage MirrorShrink) -- Shrink vertical
      , ("M-S-k", sendMessage MirrorExpand) -- Expand vertical
      , ("M-,", sendMessage (IncMasterN 1)) -- Add a window to master area
      , ("M-.", sendMessage (IncMasterN (-1))) -- Remove a window from master area
      -- , ("M-b", sendMessage ToggleStruts) -- Toggle avoiding the status bar

    -- Floating Layout
      , ("M-C-<Up>", sendMessage Arrange) -- Floating Mode
      , ("M-<Up>", sendMessage (MoveUp 20))
      , ("M-<Down>", sendMessage (MoveDown 20))
      , ("M-<Left>", sendMessage (MoveLeft 20))
      , ("M-<Right>", sendMessage (MoveRight 20))
      , ("M-S-<Up>", sendMessage (IncreaseUp 20))
      , ("M-S-<Down>", sendMessage (DecreaseDown 20))
      , ("M-S-<Left>", sendMessage (IncreaseLeft 20))
      , ("M-S-<Right>", sendMessage (DecreaseRight 20))
      , ("M-M1-<Up>", sendMessage (DecreaseUp 20))
      , ("M-M1-<Down>", sendMessage (IncreaseDown 20))
      , ("M-M1-<Left>", sendMessage (DecreaseLeft 20))
      , ("M-M1-<Right>", sendMessage (IncreaseRight 20))

    -- Focus
      , ("M-m", windows W.focusMaster) -- Focus master window
      , ("M-C-m", windows W.swapMaster) -- Swap focused with master
      , ("M-<Tab>", windows W.focusUp) -- Focus next

    -- XMonad
      , ("C-M1-<Delete>", io (exitWith ExitSuccess)) -- Quit
      , ("M-S-r", spawn "xmonad --recompile; xmonad --restart") -- Restart

    -- Function Keys
      , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +2%")
      , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@  -2%")
      , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")

      , ("<XF86AudioPlay>", spawn "playerctl play-pause")
      , ("<XF86AudioPrev>", spawn "playerctl previous")
      , ("<XF86AudioNext>", spawn "playerctl next")

      , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 2%")
      , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 2%")]

myWindowNavigation = withWindowNavigationKeys ([
    ((myModMask, xK_k), WNGo U),
    ((myModMask, xK_j), WNGo D),
    ((myModMask, xK_h), WNGo L),
    ((myModMask, xK_l), WNGo R),
    ((myModMask .|. controlMask, xK_k), WNSwap U),
    ((myModMask .|. controlMask, xK_j), WNSwap D),
    ((myModMask .|. controlMask, xK_h), WNSwap L),
    ((myModMask .|. controlMask, xK_l), WNSwap R)])
