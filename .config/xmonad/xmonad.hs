-- =========================================== --
--  ______     ______     ______     __        --
-- /\  ___\   /\  ___\   /\  __ \   /\ \       --
-- \ \  __\   \ \ \____  \ \  __ \  \ \ \____  --
--  \ \_____\  \ \_____\  \ \_\ \_\  \ \_____\ --
--   \/_____/   \/_____/   \/_/\/_/   \/_____/ --
--                                             --
-- =========================================== --
-- subzero

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
import XMonad.Actions.CycleWS
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
import XMonad.Hooks.DynamicProperty
import XMonad.Hooks.SetWMName
import XMonad.Hooks.InsertPosition

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
myBorderWidth = 3
myBorderColor = "#474747"
myFocusColor = "#4ec9b0"

--------------------------------------------------------------------------------
-- Workspaces
--------------------------------------------------------------------------------
myWorkspaces :: [String]
myWorkspaces = ["1", "2", "3", "4", "5"]

--------------------------------------------------------------------------------
-- Layouts
--------------------------------------------------------------------------------
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
-- params: disable gaps on one window, screen edges (top, bottom, left, right),
        -- screen edge gaps on, window gaps, window gaps on
mySpacing i = spacingRaw True (Border 0 i i i) True (Border 0 i i i ) True

tall    = renamed [Replace "Main"]
            $ avoidStruts
            $ smartBorders
            $ mySpacing 2
        -- params: windows in master, increment on resize, proportion for master
            $ ResizableTall 1 (3/100) (51/100) [] 
full    = renamed [Replace "Fullscreen"]
            $ noBorders Full

myLayoutHook = windowArrange myLayout
                where
                    myLayout = tall ||| full

--------------------------------------------------------------------------------
-- Manage Hook
--------------------------------------------------------------------------------
myManageHook :: ManageHook
myManageHook = composeAll
    [resource  =? "desktop_window"  --> doIgnore
    , className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "feh"            --> doFloat
    , className =? "Gpick"          --> doFloat
    , role      =? "pop-up"         --> doFloat
    , className =? "Mailspring"     --> doShift "4"
    , className =? "Slack"          --> doShift "5"
    , className =? "discord"        --> doShift "5"
    , manageDocks]
  where
    role = stringProperty "WM_WINDOW_ROLE"

--------------------------------------------------------------------------------
-- Startup Hook
--------------------------------------------------------------------------------
myStartupHook :: X ()
myStartupHook = do
    spawn "$HOME/.config/polybar/launch.sh"
    setWMName "LG3D"

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
-- LogHook (xmonad-log output)
--------------------------------------------------------------------------------
myLogHook :: D.Client -> PP
myLogHook dbus = def
    { ppOutput = dbusOutput dbus
    , ppCurrent = wrap ("%{F" ++ "#4ec9b0" ++ "} ") " %{F-}"
    , ppVisible = wrap ("%{F" ++ "#2266d0" ++ "} ") " %{F-}"
    , ppUrgent = wrap ("%{F" ++ "#fb4934" ++ "} ") " %{F-}"
    , ppHidden = wrap " " " "
    , ppWsSep = ""
    , ppSep = " | "
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
-- Keybindings
--------------------------------------------------------------------------------
myKeys :: [(String, X())]
myKeys = [
    -- Launch Programs
    ("M-<Return>", spawn myTerminal) -- Terminal
    , ("M-S-<Return>", spawn "rofi -show drun -config $HOME/.config/rofi/main.rasi") -- Run Prompt
    , ("M-f", spawn "nemo") -- Google Drive
    , ("M-c", spawn "chromium --profile-directory='Default'") -- Chromium (main)
    , ("M-S-c", spawn "chromium --profile-directory='Profile 1'") -- Chromium (alt)
    , ("M-o", spawn "chromium https://onq.queensu.ca/d2l/home") -- OnQ
    , ("M-n", spawn "chromium https://www.notion.so/ecall/") -- Notion
    , ("M-g", spawn "chromium https://github.com") -- Github
    , ("M-d", spawn "chromium https://drive.google.com/drive/my-drive") -- Google Drive
    , ("M-S-d", spawn "nemo ~/Dropbox") -- Dropbox
    , ("M-y", spawn "chromium --profile-directory='Profile 1' https://youtube.com") -- Github
    , ("M-b", spawn "$HOME/.config/polybar/launch.sh") -- Polybar
    , ("M-S-b", spawn "nitrogen") -- Nitrogen
    , ("M-<XF86AudioPlay>", spawn "spotify --disable-gpu --disable-software-rasterizer") -- Spotify
    , ("M-<Esc> <Return>", spawn "$HOME/.config/polybar/scripts/powermenu.sh") -- Powermenu
    , ("M-S-s", spawn "flameshot gui") -- Screenshot GUI
    , ("M1-S-s", spawn "flameshot full -p ~/screenshots") -- Screenshot
    , ("M-m", spawn "mailspring")
    , ("M-t", spawn "slack")
    , ("M-S-t", spawn "discord")

    -- Kill Windows
    , ("M-q", kill) -- Focused window
    , ("M-S-q", killAll) -- Kill all windows

    -- Layout
    , ("M-<Space>", sendMessage NextLayout) -- Next Layout
    , ("M-C-<Down>", sequence_[sendMessage DeArrange, withFocused $ windows . W.sink]) -- Tile Mode
    , ("M-S-h", sendMessage Shrink) -- Shrink horizontal
    , ("M-S-l", sendMessage Expand) -- Expand horizontal
    , ("M-S-j", sendMessage MirrorShrink) -- Shrink vertical
    , ("M-S-k", sendMessage MirrorExpand) -- Expand vertical
    , ("M-,", sendMessage (IncMasterN 1)) -- Add a window to master area
    , ("M-.", sendMessage (IncMasterN (-1))) -- Remove a window from master area

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
    , ("M-S-m", windows W.focusMaster) -- Focus master window
    , ("M-C-m", windows W.swapMaster) -- Swap focused with master

    -- Workspace
    , ("M-<Tab>", nextWS) -- Next workspace
    , ("M-S-<Tab>", shiftToNext >> nextWS) -- Move window to next workspace
    , ("M-C-<Tab>", shiftToPrev >> prevWS) -- Move window to prev workspace

    -- XMonad
    , ("C-M1-<Delete>", io (exitWith ExitSuccess)) -- Quit
    , ("M-S-r", spawn "xmonad --recompile; xmonad --restart") -- Restart

    -- Function Keys
    --, ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +2%")
    --, ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@  -2%")
    --, ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ("<XF86AudioRaiseVolume>", spawn "volumeControl up")
    , ("<XF86AudioLowerVolume>", spawn "volumeControl down")
    , ("<XF86AudioMute>", spawn "volumeControl mute")           

    , ("<XF86AudioPlay>", spawn "playerctl play-pause")
    , ("<XF86AudioPrev>", spawn "playerctl previous")
    , ("<XF86AudioNext>", spawn "playerctl next")

    --, ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 2%")
    --, ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 2%")
    , ("<XF86MonBrightnessUp>", spawn "brightnessControl up")
    , ("<XF86MonBrightnessDown>", spawn "brightnessControl down")]

myWindowNavigation = withWindowNavigationKeys ([
    ((myModMask, xK_k), WNGo U),
    ((myModMask, xK_j), WNGo D),
    ((myModMask, xK_h), WNGo L),
    ((myModMask, xK_l), WNGo R),
    ((myModMask .|. controlMask, xK_k), WNSwap U),
    ((myModMask .|. controlMask, xK_j), WNSwap D),
    ((myModMask .|. controlMask, xK_h), WNSwap L),
    ((myModMask .|. controlMask, xK_l), WNSwap R)])

--------------------------------------------------------------------------------
-- Main
--------------------------------------------------------------------------------
main = do
    dbus <- D.connectSession
    -- Request access to the DBus name
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

    fullConfig <- myWindowNavigation
        $ ewmh
        $ docks
        $ myConfig {
         logHook = dynamicLogWithPP (myLogHook dbus)
             >> fadeInactiveLogHook 0.9
        }

    xmonad fullConfig

--------------------------------------------------------------------------------
-- Config
--------------------------------------------------------------------------------
myConfig = def
    { terminal           = myTerminal
    , layoutHook         = myLayoutHook
    , manageHook         = placeHook(smart(0.5, 0.5))
        <+> manageDocks
        <+> myManageHook
        <+> manageHook def
        <+> insertPosition Below Newer
    , handleEventHook    = docksEventHook
        <+> minimizeEventHook
        <+> fullscreenEventHook
    -- Move Spotify to workspace 5
        <+> dynamicPropertyChange "WM_NAME" 
            (className =? "Spotify" --> doShift "3")
    , startupHook        = myStartupHook
    , focusFollowsMouse  = False
    , clickJustFocuses   = False
    , borderWidth        = myBorderWidth
    , modMask            = myModMask
    , workspaces         = myWorkspaces
    , normalBorderColor  = myBorderColor
    , focusedBorderColor = myFocusColor
    , mouseBindings      = myMouseBindings
    } `additionalKeysP` myKeys
