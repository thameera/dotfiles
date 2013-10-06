import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Util.Dzen
import XMonad.Hooks.EwmhDesktops
import XMonad.Actions.Volume
import System.IO
import qualified XMonad.Actions.FlexibleResize as Flex

alert = dzenConfig return . show

myManageHook = composeAll
    [ className =? "Gimp"   --> doFloat
    , className =? "sun-awt-X11-XFramePeer" --> doFloat
    , className =? "com-sun-javaws-Main" --> doFloat ]

main = do
    xmproc <- spawnPipe "/home/thameera/.cabal/bin/xmobar /home/thameera/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , handleEventHook = fullscreenEventHook -- Fix Chrome not going fullscreen
        , logHook = dynamicLogWithPP xmobarPP
                    { ppOutput = hPutStrLn xmproc
                    , ppTitle = xmobarColor "green" "" . shorten 50
                    }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((mod4Mask, xK_p), spawn "$(yeganesh -x)")
        , ((0, xK_Print), spawn "scrot")
        , ((0, xK_F6), lowerVolume 4 >>= alert)
        , ((0, xK_F7), raiseVolume 4 >>= alert)
        , ((0, xK_F8), toggleMute    >>  return ())
        ]
        `additionalMouseBindings`
        [ ((mod4Mask, button3), (\w -> focus w >> Flex.mouseResizeWindow w))
        ]

