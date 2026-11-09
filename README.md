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

Early prototype: includes tabs and subtabs, single/multi-select dropdowns, notifications, confirmation dialogs, segmented choices, preset color selection, keyboard keybinds, checkboxes, steppers, status indicators, dividers, information, paragraphs, progress bars, sliders, buttons, toggles and inputs. Callbacks run asynchronously. The top-right button hides the window; use the floating book button or Right Shift to reopen it. The library does not yet have config persistence, configurable keybinds, or production integration. Test on your executor and device; Roblox asset access can vary.

Lucide asset ID mappings were adapted from [OasisUI](https://github.com/Mold53/OasisUI), which generates its subset from [Footagesus/Icons](https://github.com/Footagesus/Icons). Lucide artwork is by [Lucide](https://lucide.dev/). See the accompanying license files. The icons rely on third-party Roblox assets and may be unavailable in some environments; navigation icons have letter fallbacks.

The illustrated background is AI-generated for Fable. It loads asynchronously from this repository using executor `writefile` and `getcustomasset` (or `getsynasset`), and writes `fable-ui-background-v1.jpg` to the executor workspace. If these APIs are unavailable, or the image cannot be fetched, the dark gradient remains. A Roblox image asset can alternatively be passed as `BackgroundImage` in `CreateWindow`. The palette selector is not a full HSV picker. Keybinds require a physical keyboard.

## Subtabs

```lua
local page = tab:SubTab({Name = "Essentials"})
local section = page:Section({Name = "Options"})
section:Checkbox({Name = "Example", Default = true, Callback = function(value) print(value) end})
section:Stepper({Name = "Count", Min = 0, Max = 10, Step = 1, Default = 3})
page:Select()
```

Create subtabs before adding their sections. A tab can still use `tab:Section(...)` directly. `page:Select()` selects both its parent tab and the subtab.

## Responsive columns

`local columns = tab:Columns()` (or `subtab:Columns()`) returns `columns.Left` and `columns.Right`; call `:Section(...)` on either. Cards display side by side when space permits and stack on narrow screens. Sliders also accept typed values. The demo is a mock Fable mission workflow; its controls do not run automation.

The left-edge handle collapses or expands the sidebar; it defaults to compact on narrower windows. Scripts may call `window:SetSidebarCollapsed(true)` or `window:SetSidebarCollapsed(false)`.
