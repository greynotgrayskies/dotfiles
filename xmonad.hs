-- Layouts

import XMonad hiding ( (|||) )
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.ResizableTile
import XMonad.Layout.NoBorders
import XMonad.Layout.Grid
import XMonad.Layout.Accordion
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.MagicFocus

-- Gnome config (for Unity menubar)
import XMonad.Config.Gnome

-- Misc
import XMonad.Util.EZConfig
import XMonad.Prompt.Shell
import XMonad.Prompt
import Data.List
import XMonad.StackSet as W

-- Actions
import XMonad.Actions.WithAll
import XMonad.Actions.Warp

-- Unity menubar
myManageHook = composeAll (
    [ manageHook gnomeConfig
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-shell" --> doFloat
    ])

-- Main
main = xmonad $ gnomeConfig {
    manageHook = myManageHook
    , normalBorderColor = "#004400"
    , focusedBorderColor = "#00FF00"
    }
    `additionalKeysP`
    [ ("M-o", spawn "google-chrome")               -- chrome
    , ("M-S-o", spawn "google-chrome --incognito") -- incognito chrome
    , ("M-n", spawn "nautilus")                    -- Nautilus
    ]
