# Fable UI — prototype

A standalone dark-fantasy Roblox UI experiment. This does not operate Fable's game automation and is not yet a replacement for its existing UI.

## Demo

```lua
loadstring(game:HttpGet('https://raw.githubusercontent.com/pavorattiluciano627-a11y/Fable-UI/main/Fable-UI-Demo.lua'))()
```

## Library

```lua
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/pavorattiluciano627-a11y/Fable-UI/main/FableUILibrary.lua'))()
local window = Library:CreateWindow({Title = 'FABLE', Subtitle = 'A PRIVATE CHRONICLE'})
local tab = window:Tab({Name = 'The Chronicle', Icon = 'book-open', Description = 'A place to begin.'})
local section = tab:Section({Name = 'Preparation'})
section:Toggle({Name = 'Example', Default = false, Callback = function(value) print(value) end})
```

Early prototype: includes single/multi-select dropdowns, notifications, confirmation dialogs, segmented choices, palette-based color selection, keyboard keybinds, dividers, information, paragraphs, progress bars, sliders, buttons, toggles and inputs. Callbacks run asynchronously. The top-right button hides the window; use the floating book button or Right Shift to reopen it. The library does not yet have config persistence, configurable keybinds, or production integration. Test on your executor and device; Roblox asset access can vary.

Lucide asset ID mappings were adapted from [OasisUI](https://github.com/Mold53/OasisUI), which generates its subset from [Footagesus/Icons](https://github.com/Footagesus/Icons). Lucide artwork is by [Lucide](https://lucide.dev/). See the accompanying license files. The icons rely on third-party Roblox assets and may be unavailable in some environments; navigation icons have letter fallbacks.

The illustrated background is AI-generated for Fable. It loads asynchronously from this repository using executor `writefile` and `getcustomasset` (or `getsynasset`), and writes `fable-ui-background-v1.jpg` to the executor workspace. If these APIs are unavailable, or the image cannot be fetched, the dark gradient remains. A Roblox image asset can alternatively be passed as `BackgroundImage` in `CreateWindow`. The palette selector is not a full HSV picker. Keybinds require a physical keyboard.
