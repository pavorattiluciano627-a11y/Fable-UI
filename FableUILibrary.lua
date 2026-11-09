-- Fable UI prototype · standalone client-side library
-- This is a design prototype, not yet connected to Fable settings or automation.
local TweenService = game:GetService('TweenService')
local InputService = game:GetService('UserInputService')
local Players = game:GetService('Players')
-- Lucide asset mappings adapted from OasisUI, MIT; see OASIS-LICENSE.txt.
local Icons = {
    ["activity"]               = "rbxassetid://94212016861936",
    ["alarm-clock"]            = "rbxassetid://126259032907535",
    ["arrow-down"]             = "rbxassetid://98764963621439",
    ["arrow-left"]             = "rbxassetid://102531941843733",
    ["arrow-right"]            = "rbxassetid://113692007244654",
    ["arrow-up"]               = "rbxassetid://89282378235317",
    ["arrow-up-down"]          = "rbxassetid://81019887641527",
    ["badge-check"]            = "rbxassetid://76078495178149",
    ["ban"]                    = "rbxassetid://90767043015246",
    ["battery"]                = "rbxassetid://70765800346189",
    ["bell"]                   = "rbxassetid://97392696311902",
    ["bell-off"]               = "rbxassetid://78560046118930",
    ["bell-ring"]              = "rbxassetid://94612128913941",
    ["blend"]                  = "rbxassetid://111679612185257",
    ["bolt"]                   = "rbxassetid://102881251417484",
    ["book"]                   = "rbxassetid://125383279695672",
    ["book-open"]              = "rbxassetid://129845326810392",
    ["bookmark"]               = "rbxassetid://121093149326239",
    ["bot"]                    = "rbxassetid://80451686744860",
    ["box"]                    = "rbxassetid://101768155599700",
    ["brush"]                  = "rbxassetid://127035535799640",
    ["bug"]                    = "rbxassetid://83626408925438",
    ["calendar"]               = "rbxassetid://114792700814035",
    ["camera"]                 = "rbxassetid://79950339943067",
    ["chart-bar"]              = "rbxassetid://105389816384108",
    ["chart-line"]             = "rbxassetid://101833156055618",
    ["chart-no-axes-combined"] = "rbxassetid://121424233161912",
    ["check"]                  = "rbxassetid://93898873302694",
    ["check-check"]            = "rbxassetid://95183312173858",
    ["chevron-down"]           = "rbxassetid://134243273101015",
    ["chevron-left"]           = "rbxassetid://73780377692148",
    ["chevron-right"]          = "rbxassetid://92473583511724",
    ["chevron-up"]             = "rbxassetid://122444883127455",
    ["chevrons-up-down"]       = "rbxassetid://131833120209646",
    ["circle"]                 = "rbxassetid://130359823580534",
    ["circle-alert"]           = "rbxassetid://83898160590116",
    ["circle-check"]           = "rbxassetid://85262178816537",
    ["circle-dot"]             = "rbxassetid://82947033619201",
    ["circle-question-mark"]   = "rbxassetid://97516698664325",
    ["circle-x"]               = "rbxassetid://76821953846248",
    ["clipboard"]              = "rbxassetid://89601995828423",
    ["clipboard-paste"]        = "rbxassetid://74382068849983",
    ["clock"]                  = "rbxassetid://121808839832144",
    ["cloud"]                  = "rbxassetid://121226497050352",
    ["code"]                   = "rbxassetid://107380207681249",
    ["cog"]                    = "rbxassetid://116544501716299",
    ["columns-2"]              = "rbxassetid://113004100221850",
    ["command"]                = "rbxassetid://93648221906330",
    ["compass"]                = "rbxassetid://115123411028382",
    ["contrast"]               = "rbxassetid://112796643981497",
    ["copy"]                   = "rbxassetid://78979572434545",
    ["cpu"]                    = "rbxassetid://77549309870247",
    ["crosshair"]              = "rbxassetid://134242818164054",
    ["crown"]                  = "rbxassetid://127843403295538",
    ["database"]               = "rbxassetid://126791525623846",
    ["diamond"]                = "rbxassetid://105846996304890",
    ["dot"]                    = "rbxassetid://137321056643916",
    ["download"]               = "rbxassetid://134814648082393",
    ["droplet"]                = "rbxassetid://100597455015098",
    ["ellipsis"]               = "rbxassetid://140019550645825",
    ["ellipsis-vertical"]      = "rbxassetid://117978708573781",
    ["expand"]                 = "rbxassetid://137492887754537",
    ["external-link"]          = "rbxassetid://129331830773832",
    ["eye"]                    = "rbxassetid://100033680381365",
    ["eye-off"]                = "rbxassetid://135928786788378",
    ["file"]                   = "rbxassetid://74748492079329",
    ["file-braces"]            = "rbxassetid://95314128621234",
    ["file-code"]              = "rbxassetid://130978036895504",
    ["file-plus"]              = "rbxassetid://78881710800060",
    ["file-text"]              = "rbxassetid://90496405707281",
    ["fingerprint"]            = "rbxassetid://112173305232811",
    ["flag"]                   = "rbxassetid://78183383236196",
    ["flame"]                  = "rbxassetid://98218034436456",
    ["flask-conical"]          = "rbxassetid://128406680901165",
    ["folder"]                 = "rbxassetid://80846616596607",
    ["folder-open"]            = "rbxassetid://76018996254888",
    ["funnel"]                 = "rbxassetid://108829540827529",
    ["gamepad-2"]              = "rbxassetid://92483947987410",
    ["gauge"]                  = "rbxassetid://110273524101447",
    ["gem"]                    = "rbxassetid://112904952151156",
    ["ghost"]                  = "rbxassetid://113822048130017",
    ["gift"]                   = "rbxassetid://109855212076373",
    ["git-branch"]             = "rbxassetid://90490195516649",
    ["globe"]                  = "rbxassetid://114238209622913",
    ["grip-vertical"]          = "rbxassetid://137183678565296",
    ["hammer"]                 = "rbxassetid://83545120140895",
    ["hand"]                   = "rbxassetid://130703864968637",
    ["hash"]                   = "rbxassetid://82890331678520",
    ["heart"]                  = "rbxassetid://116559368303288",
    ["history"]                = "rbxassetid://123980022019922",
    ["hourglass"]              = "rbxassetid://86160434939203",
    ["house"]                  = "rbxassetid://98755624629571",
    ["image"]                  = "rbxassetid://112751259236831",
    ["info"]                   = "rbxassetid://124560466474914",
    ["key"]                    = "rbxassetid://96510194465420",
    ["key-round"]              = "rbxassetid://83619031955390",
    ["keyboard"]               = "rbxassetid://121474456068237",
    ["languages"]              = "rbxassetid://90816903776498",
    ["layers"]                 = "rbxassetid://81973586053257",
    ["layout-dashboard"]       = "rbxassetid://139929981863901",
    ["layout-grid"]            = "rbxassetid://81344910161871",
    ["layout-list"]            = "rbxassetid://87462136296578",
    ["library"]                = "rbxassetid://114334671982047",
    ["link"]                   = "rbxassetid://131607023382430",
    ["list"]                   = "rbxassetid://113179976918783",
    ["list-filter"]            = "rbxassetid://103321376129527",
    ["loader"]                 = "rbxassetid://78408734580845",
    ["loader-circle"]          = "rbxassetid://116535712789945",
    ["lock"]                   = "rbxassetid://134724289526879",
    ["lock-open"]              = "rbxassetid://93597915325122",
    ["log-in"]                 = "rbxassetid://103768533135201",
    ["log-out"]                = "rbxassetid://84895399304975",
    ["magnet"]                 = "rbxassetid://135162361226972",
    ["map"]                    = "rbxassetid://95107167260947",
    ["maximize-2"]             = "rbxassetid://73085922906397",
    ["menu"]                   = "rbxassetid://77021539815611",
    ["message-square"]         = "rbxassetid://83881670383280",
    ["mic"]                    = "rbxassetid://89640799126523",
    ["minimize-2"]             = "rbxassetid://116269596042539",
    ["minus"]                  = "rbxassetid://118026365011536",
    ["monitor"]                = "rbxassetid://72664649203050",
    ["moon"]                   = "rbxassetid://83380517901735",
    ["mouse"]                  = "rbxassetid://73096068864710",
    ["mouse-pointer-click"]    = "rbxassetid://107150227368485",
    ["move"]                   = "rbxassetid://116138709011735",
    ["music"]                  = "rbxassetid://113343203848535",
    ["navigation"]             = "rbxassetid://79308213542922",
    ["orbit"]                  = "rbxassetid://108926136860562",
    ["package"]                = "rbxassetid://97261141732706",
    ["paintbrush"]             = "rbxassetid://125572663700289",
    ["palette"]                = "rbxassetid://86350350950064",
    ["panel-left"]             = "rbxassetid://97419752870313",
    ["paperclip"]              = "rbxassetid://92088291163453",
    ["pencil"]                 = "rbxassetid://137986121120732",
    ["pin"]                    = "rbxassetid://120978111007514",
    ["pipette"]                = "rbxassetid://133167932934404",
    ["play"]                   = "rbxassetid://135609604299893",
    ["plus"]                   = "rbxassetid://111774323017047",
    ["power"]                  = "rbxassetid://96479131758775",
    ["radar"]                  = "rbxassetid://138528222906635",
    ["radio"]                  = "rbxassetid://85611589536956",
    ["refresh-cw"]             = "rbxassetid://138133190015277",
    ["rocket"]                 = "rbxassetid://87412317685854",
    ["rotate-ccw"]             = "rbxassetid://110116685948665",
    ["ruler"]                  = "rbxassetid://81432445547423",
    ["save"]                   = "rbxassetid://126116963775616",
    ["scaling"]                = "rbxassetid://122360365318466",
    ["scan"]                   = "rbxassetid://123104789658180",
    ["search"]                 = "rbxassetid://121018724060431",
    ["send"]                   = "rbxassetid://127751956873796",
    ["server"]                 = "rbxassetid://92188766517878",
    ["settings"]               = "rbxassetid://80758916183665",
    ["settings-2"]             = "rbxassetid://135684703553372",
    ["shield"]                 = "rbxassetid://110987169760162",
    ["shield-check"]           = "rbxassetid://87354736164608",
    ["shrink"]                 = "rbxassetid://90953687918880",
    ["shuffle"]                = "rbxassetid://132382786975101",
    ["signal"]                 = "rbxassetid://78424889355261",
    ["skull"]                  = "rbxassetid://137726256442333",
    ["sliders-horizontal"]     = "rbxassetid://85538382643347",
    ["sliders-vertical"]       = "rbxassetid://101190569086853",
    ["smartphone"]             = "rbxassetid://96623008834511",
    ["sparkles"]               = "rbxassetid://138635884129147",
    ["square"]                 = "rbxassetid://86304921356806",
    ["star"]                   = "rbxassetid://136141469398409",
    ["star-off"]               = "rbxassetid://75742832732503",
    ["sun"]                    = "rbxassetid://110150589884127",
    ["sun-dim"]                = "rbxassetid://129141645592715",
    ["sword"]                  = "rbxassetid://124448418211665",
    ["swords"]                 = "rbxassetid://81872698913435",
    ["tag"]                    = "rbxassetid://129104970103940",
    ["target"]                 = "rbxassetid://87563802520297",
    ["terminal"]               = "rbxassetid://106783148545356",
    ["thumbs-up"]              = "rbxassetid://111137070767020",
    ["timer"]                  = "rbxassetid://85473888890506",
    ["toggle-left"]            = "rbxassetid://85887872573050",
    ["toggle-right"]           = "rbxassetid://90411952142550",
    ["trash-2"]                = "rbxassetid://109843431391323",
    ["trending-up"]            = "rbxassetid://81819858538839",
    ["triangle-alert"]         = "rbxassetid://125920361880643",
    ["trophy"]                 = "rbxassetid://131545003268773",
    ["type"]                   = "rbxassetid://133543553793564",
    ["undo-2"]                 = "rbxassetid://113885292059932",
    ["upload"]                 = "rbxassetid://138212042425501",
    ["user"]                   = "rbxassetid://81589895647169",
    ["user-round"]             = "rbxassetid://136485052187963",
    ["users"]                  = "rbxassetid://115398113982385",
    ["volume-2"]               = "rbxassetid://89344380902620",
    ["wand-sparkles"]          = "rbxassetid://82546429942392",
    ["wifi"]                   = "rbxassetid://104669375183960",
    ["wind"]                   = "rbxassetid://114551690399915",
    ["wrench"]                 = "rbxassetid://112148279212860",
    ["x"]                      = "rbxassetid://110786993356448",
    ["zap"]                    = "rbxassetid://130551565616516",
    ["zoom-in"]                = "rbxassetid://127956924984803",
}

local Library = {}
local palette = {
    background = Color3.fromRGB(17, 17, 20), sidebar = Color3.fromRGB(23, 23, 26),
    panel = Color3.fromRGB(29, 28, 30), elevated = Color3.fromRGB(36, 34, 35),
    line = Color3.fromRGB(76, 64, 53), gold = Color3.fromRGB(190, 153, 101),
    parchment = Color3.fromRGB(229, 216, 188), text = Color3.fromRGB(204, 195, 180),
    muted = Color3.fromRGB(135, 126, 115), danger = Color3.fromRGB(159, 98, 82),
}
local nextOrder = setmetatable({}, {__mode = 'k'})
local function create(class, properties, parent)
    local instance = Instance.new(class)
    for key, value in pairs(properties or {}) do instance[key] = value end
    if parent and instance:IsA('GuiObject') and (not properties or properties.LayoutOrder == nil) then
        nextOrder[parent] = (nextOrder[parent] or 0) + 1
        instance.LayoutOrder = nextOrder[parent]
    end
    instance.Parent = parent
    return instance
end
local function icon(parent, name, fallback)
    local image = create('ImageLabel', {Name = 'Icon', BackgroundTransparency = 1, Image = Icons[name] or '', ImageColor3 = palette.gold, ScaleType = Enum.ScaleType.Fit}, parent)
    local text = create('TextLabel', {BackgroundTransparency = 1, Size = UDim2.fromScale(1,1), Text = fallback or '', TextColor3 = palette.gold, Font = Enum.Font.GothamBold, TextSize = 11, Visible = true}, image)
    local function update() text.Visible = not image.IsLoaded end
    image:GetPropertyChangedSignal('IsLoaded'):Connect(update); update()
    return image
end
local function gradient(parent, a, b, rotation)
    return create('UIGradient', {Color = ColorSequence.new(a,b), Rotation = rotation or 90}, parent)
end
local function corner(parent, radius) create('UICorner', {CornerRadius = UDim.new(0, radius or 6)}, parent) end
local function stroke(parent, color, transparency)
    create('UIStroke', {Color = color or palette.line, Transparency = transparency or 0, Thickness = 1}, parent)
end
-- Concentric circles taper at the edges rather than ending in a rectangular cutoff.
local function halo(parent, position)
    local layers = {}
    for _, size in ipairs({38, 30, 24}) do
        local layer=create('Frame',{AnchorPoint=Vector2.new(.5,.5),Position=position,Size=UDim2.fromOffset(size,size),BackgroundColor3=Color3.fromRGB(237,170,92),BackgroundTransparency=size==38 and .95 or size==30 and .90 or .84,BorderSizePixel=0},parent)
        corner(layer,size/2); table.insert(layers,layer)
    end
    return layers
end
local function label(parent, text, size, color, font)
    return create('TextLabel', {BackgroundTransparency = 1, Text = text, TextColor3 = color or palette.text,
        Font = font or Enum.Font.Gotham, TextSize = size or 13, TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center, BorderSizePixel = 0}, parent)
end
local function button(parent, text)
    return create('TextButton', {BackgroundTransparency = 1, BorderSizePixel = 0, Text = text or '',
        TextColor3 = palette.text, Font = Enum.Font.Gotham, TextSize = 13, AutoButtonColor = false}, parent)
end
local function padding(parent, top, right, bottom, left)
    create('UIPadding', {PaddingTop = UDim.new(0, top), PaddingRight = UDim.new(0, right),
        PaddingBottom = UDim.new(0, bottom), PaddingLeft = UDim.new(0, left)}, parent)
end
local function animate(object, properties)
    TweenService:Create(object, TweenInfo.new(.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), properties):Play()
end
local function fire(fn, value)
    if type(fn) == 'function' then task.spawn(function() local ok, err = pcall(fn, value); if not ok then warn('[Fable UI]', err) end end) end
end
function Library:CreateWindow(options)
    options = options or {}
    local parent = (type(gethui) == 'function' and gethui()) or Players.LocalPlayer:WaitForChild('PlayerGui')
    local existing = parent:FindFirstChild('FableUIPrototype')
    if existing then existing:Destroy() end
    local gui = create('ScreenGui', {Name = 'FableUIPrototype', ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling}, parent)
    local root = create('Frame', {Name = 'Window', AnchorPoint = Vector2.new(.5,.5), Position = UDim2.fromScale(.5,.5),
        Size = UDim2.new(.9,0,.82,0), BackgroundColor3 = Color3.new(1,1,1), BorderSizePixel = 0, ClipsDescendants = true}, gui)
    create('UISizeConstraint', {MaxSize = Vector2.new(880, 620), MinSize = Vector2.new(320, 280)}, root)
    corner(root, 9); stroke(root, palette.gold, .55)
    gradient(root, Color3.fromRGB(35,30,29), Color3.fromRGB(14,15,19), 105)
    local backdrop = create('ImageLabel',{Name='Artwork',Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ImageTransparency=.26,ScaleType=Enum.ScaleType.Crop},root)
    local shade=create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(12,12,15),BackgroundTransparency=.47,BorderSizePixel=0},root)
    corner(backdrop,9); corner(shade,9)
    local function applyBackdrop(asset)
        if type(asset)=='string' and asset~='' and gui.Parent then backdrop.Image=asset end
    end
    if type(options.BackgroundImage)=='string' and options.BackgroundImage~='' then
        applyBackdrop(options.BackgroundImage)
    elseif type(writefile)=='function' and (type(getcustomasset)=='function' or type(getsynasset)=='function') then
        task.spawn(function()
            local ok,asset=pcall(function()
                local path='fable-ui-background-v1.jpg'
                local bytes=game:HttpGet('https://raw.githubusercontent.com/pavorattiluciano627-a11y/Fable-UI/main/fable-background.jpg?art=1')
                assert(type(bytes)=='string' and #bytes>10000 and #bytes<1000000 and bytes:sub(1,3)=='\255\216\255','Invalid background')
                writefile(path,bytes)
                return (getcustomasset or getsynasset)(path)
            end)
            if ok then applyBackdrop(asset) end
        end)
    end
    local scale = create('UIScale', {Scale = .965}, root)
    TweenService:Create(scale, TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Scale = 1}):Play()
    local top = create('Frame', {Size = UDim2.new(1,0,0,58), BackgroundColor3 = Color3.new(1,1,1), BorderSizePixel = 0}, root)
    corner(top,9)
    gradient(top, Color3.fromRGB(54,40,32), Color3.fromRGB(23,23,26), 0)
    local separator = create('Frame', {Position=UDim2.new(0,9,1,-1), Size=UDim2.new(1,-18,0,1), BackgroundColor3=palette.gold, BackgroundTransparency=.45, BorderSizePixel=0},top)
    gradient(separator,Color3.fromRGB(178,126,73),Color3.fromRGB(55,46,39),0)
    local emblem = icon(top, 'book-open', 'F'); emblem.Position = UDim2.fromOffset(18,17); emblem.Size = UDim2.fromOffset(25,25)
    local brand = label(top, options.Title or 'FABLE', 20, palette.parchment, Enum.Font.Garamond); brand.Position = UDim2.fromOffset(51,8); brand.Size = UDim2.fromOffset(160,24)
    local subtitle = label(top, options.Subtitle or 'A PRIVATE CHRONICLE', 9, palette.muted, Enum.Font.Gotham); subtitle.Position = UDim2.fromOffset(52,32); subtitle.Size = UDim2.fromOffset(200,14)
    local close = button(top, ''); close.Position = UDim2.new(1,-46,0,8); close.Size = UDim2.fromOffset(36,36)
    local closeIcon = icon(close, 'minus', '-'); closeIcon.AnchorPoint = Vector2.new(.5,.5); closeIcon.Position = UDim2.fromScale(.5,.5); closeIcon.Size = UDim2.fromOffset(17,17); closeIcon.ImageColor3 = palette.muted
    close.MouseEnter:Connect(function() animate(closeIcon, {ImageColor3 = palette.parchment}) end)
    close.MouseLeave:Connect(function() animate(closeIcon, {ImageColor3 = palette.muted}) end)
    local reopen = button(gui, '')
    reopen.Name = 'Reopen'; reopen.AnchorPoint = Vector2.new(1, .5); reopen.Position = UDim2.new(1,-14,.5,0)
    reopen.Size = UDim2.fromOffset(44,44); reopen.BackgroundColor3 = palette.panel; reopen.BackgroundTransparency = 0; reopen.Visible = false
    corner(reopen, 22); stroke(reopen, palette.gold, .25)
    local reopenIcon = icon(reopen, 'book-open', 'F'); reopenIcon.Size = UDim2.fromOffset(21,21); reopenIcon.AnchorPoint = Vector2.new(.5,.5); reopenIcon.Position = UDim2.fromScale(.5,.5)
    close.Activated:Connect(function() root.Visible = false; reopen.Visible = true end)
    reopen.Activated:Connect(function()
        root.Visible = true; reopen.Visible = false; scale.Scale = .97
        TweenService:Create(scale, TweenInfo.new(.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
    local dragging, dragStart, startPos, dragInput
    top.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = root.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    top.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end end)
    local dragConnection = InputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput and root.Parent then
            local delta = input.Position - dragStart
            local camera = workspace.CurrentCamera
            if not camera then return end
            local viewport, size = camera.ViewportSize, root.AbsoluteSize
            local x = math.clamp(startPos.X.Scale * viewport.X + startPos.X.Offset + delta.X, math.min(size.X/2, viewport.X/2), math.max(viewport.X-size.X/2, viewport.X/2))
            local y = math.clamp(startPos.Y.Scale * viewport.Y + startPos.Y.Offset + delta.Y, math.min(size.Y/2, viewport.Y/2), math.max(viewport.Y-size.Y/2, viewport.Y/2))
            root.Position = UDim2.fromOffset(x,y)
        end
    end)
    local keyConnection = InputService.InputBegan:Connect(function(input, processed)
        if not processed and not InputService:GetFocusedTextBox() and input.KeyCode == Enum.KeyCode.RightShift then
            root.Visible = not root.Visible; reopen.Visible = not root.Visible
        end
    end)
    gui.Destroying:Connect(function() dragConnection:Disconnect(); keyConnection:Disconnect() end)
    local nav = create('ScrollingFrame', {Position = UDim2.fromOffset(0,58), Size = UDim2.new(0,172,1,-58),
        BackgroundColor3 = palette.sidebar, BackgroundTransparency = .18, BorderSizePixel = 0, ScrollBarThickness = 2, ScrollBarImageColor3 = palette.line,
        AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new()}, root)
    padding(nav, 15, 9, 14, 9)
    create('UIListLayout', {Padding = UDim.new(0,5), SortOrder = Enum.SortOrder.LayoutOrder}, nav)
    local chapter = label(nav, 'THE CHRONICLE', 9, palette.muted, Enum.Font.GothamBold); chapter.Size = UDim2.new(1,0,0,24)
    local divider = create('Frame', {Position = UDim2.fromOffset(171,58), Size = UDim2.new(0,1,1,-58), BackgroundColor3 = palette.line, BorderSizePixel = 0}, root)
    local content = create('Frame', {Position = UDim2.fromOffset(172,58), Size = UDim2.new(1,-172,1,-58), BackgroundTransparency = 1, ClipsDescendants = true}, root)
    local window = {Gui = gui, Tabs = {}, Active = nil, Compact = false}
    local toastHolder = create('Frame', {Name='Notifications', AnchorPoint=Vector2.new(1,1), Position=UDim2.new(1,-14,1,-14), Size=UDim2.new(1,-28,1,-28), BackgroundTransparency=1, ZIndex=10}, gui)
    create('UISizeConstraint', {MaxSize=Vector2.new(320,400)}, toastHolder)
    create('UIListLayout', {FillDirection=Enum.FillDirection.Vertical, HorizontalAlignment=Enum.HorizontalAlignment.Right, VerticalAlignment=Enum.VerticalAlignment.Bottom, Padding=UDim.new(0,8), SortOrder=Enum.SortOrder.LayoutOrder}, toastHolder)
    function window:Notify(spec)
        spec = spec or {}
        local toast = create('Frame',{Size=UDim2.new(1,0,0,76),BackgroundColor3=palette.panel,BorderSizePixel=0,ClipsDescendants=true,ZIndex=11},toastHolder)
        corner(toast,7); stroke(toast,palette.gold,.45)
        local toastScale = create('UIScale',{Scale=.94},toast)
        TweenService:Create(toastScale,TweenInfo.new(.24,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Scale=1}):Play()
        local mark = icon(toast, spec.Icon or 'sparkles', '!'); mark.Position=UDim2.fromOffset(13,15); mark.Size=UDim2.fromOffset(19,19); mark.ZIndex=12; local fallback = mark:FindFirstChildOfClass('TextLabel'); if fallback then fallback.ZIndex=13 end
        local title = label(toast,spec.Title or 'Fable',15,palette.parchment,Enum.Font.Garamond); title.Position=UDim2.fromOffset(42,8); title.Size=UDim2.new(1,-54,0,23); title.ZIndex=12
        local body = label(toast,spec.Content or '',11,palette.text); body.Position=UDim2.fromOffset(42,32); body.Size=UDim2.new(1,-54,0,35); body.TextWrapped=true; body.TextYAlignment=Enum.TextYAlignment.Top; body.ZIndex=12
        local dismissed = false
        local function dismiss()
            if dismissed then return end; dismissed=true
            animate(toast,{BackgroundTransparency=1}); animate(title,{TextTransparency=1}); animate(body,{TextTransparency=1}); animate(mark,{ImageTransparency=1})
            task.delay(.2,function() if toast.Parent then toast:Destroy() end end)
        end
        task.delay(math.clamp(tonumber(spec.Duration) or 4,1,30),dismiss)
        return {Dismiss=dismiss}
    end
    function window:SetVisible(visible) root.Visible = visible == true; reopen.Visible = not root.Visible end
    function window:Confirm(spec)
        spec=spec or {}
        local overlay=create('Frame',{Name='Dialog',Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=.35,BorderSizePixel=0,Active=true,ZIndex=30},gui)
        local panel=create('Frame',{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.new(.88,0,0,165),BackgroundColor3=palette.panel,BorderSizePixel=0,ZIndex=31},overlay)
        create('UISizeConstraint',{MaxSize=Vector2.new(380,165)},panel);corner(panel,8);stroke(panel,palette.gold,.2)
        local title=label(panel,spec.Title or 'Are you sure?',21,palette.parchment,Enum.Font.Garamond);title.Position=UDim2.fromOffset(18,12);title.Size=UDim2.new(1,-36,0,30);title.ZIndex=32
        local body=label(panel,spec.Content or '',12,palette.text);body.Position=UDim2.fromOffset(18,48);body.Size=UDim2.new(1,-36,0,55);body.TextWrapped=true;body.TextYAlignment=Enum.TextYAlignment.Top;body.ZIndex=32
        local cancel=button(panel,spec.Cancel or 'CANCEL');cancel.Position=UDim2.new(1,-204,1,-49);cancel.Size=UDim2.fromOffset(88,34);cancel.BackgroundColor3=palette.elevated;cancel.BackgroundTransparency=0;cancel.TextSize=10;cancel.ZIndex=32;corner(cancel,5);stroke(cancel,palette.line)
        local accept=button(panel,spec.Confirm or 'CONFIRM');accept.Position=UDim2.new(1,-108,1,-49);accept.Size=UDim2.fromOffset(90,34);accept.BackgroundColor3=Color3.fromRGB(132,91,48);accept.BackgroundTransparency=0;accept.TextColor3=palette.parchment;accept.TextSize=10;accept.ZIndex=32;corner(accept,5);stroke(accept,palette.gold,.2)
        local done=false
        local function finish(confirmed) if done then return end;done=true;overlay:Destroy();fire(spec.Callback,confirmed) end
        cancel.Activated:Connect(function() finish(false) end);accept.Activated:Connect(function() finish(true) end)
        return {Dismiss=function() finish(false) end}
    end
    local function responsive()
        local compact = root.AbsoluteSize.X < 600
        if compact == window.Compact then return end
        window.Compact = compact
        local width = compact and 54 or 172
        nav.Size = UDim2.new(0,width,1,-58); divider.Position = UDim2.fromOffset(width-1,58)
        content.Position = UDim2.fromOffset(width,58); content.Size = UDim2.new(1,-width,1,-58)
        chapter.Text = compact and '' or 'THE CHRONICLE'
        for _, tab in ipairs(window.Tabs) do tab.Caption.Visible = not compact end
    end
    root:GetPropertyChangedSignal('AbsoluteSize'):Connect(responsive)
    function window:Tab(spec)
        spec = spec or {}; local tab = {Name = spec.Name or 'Chapter', Icon = spec.Icon or 'book', Sections = {}}
        tab.Nav = button(nav, ''); tab.Nav.Size = UDim2.new(1,0,0,39)
        tab.Nav.BackgroundColor3 = palette.elevated; tab.Nav.BackgroundTransparency = 1; corner(tab.Nav,5)
        tab.Image = icon(tab.Nav, tab.Icon, tab.Name:sub(1,1)); tab.Image.Position = UDim2.fromOffset(9,11); tab.Image.Size = UDim2.fromOffset(17,17)
        tab.Caption = label(tab.Nav, tab.Name, 13, palette.muted); tab.Caption.Position = UDim2.fromOffset(35,0); tab.Caption.Size = UDim2.new(1,-39,1,0); tab.Caption.TextTruncate = Enum.TextTruncate.AtEnd
        tab.Nav.MouseEnter:Connect(function() if window.Active ~= tab then animate(tab.Nav,{BackgroundTransparency = .5}) end end)
        tab.Nav.MouseLeave:Connect(function() if window.Active ~= tab then animate(tab.Nav,{BackgroundTransparency = 1}) end end)
        tab.Page = create('ScrollingFrame', {Size = UDim2.fromScale(1,1), BackgroundTransparency = 1, BorderSizePixel = 0,
            Visible = false, ScrollBarThickness = 3, ScrollBarImageColor3 = palette.gold, AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new()}, content)
        padding(tab.Page, 22, 22, 25, 22)
        create('UIListLayout', {Padding = UDim.new(0,12), SortOrder = Enum.SortOrder.LayoutOrder}, tab.Page)
        local eyebrow = label(tab.Page, spec.Eyebrow or 'FABLE  /  CHAPTER', 10, palette.gold, Enum.Font.GothamBold); eyebrow.Size = UDim2.new(1,0,0,14)
        local heading = label(tab.Page, tab.Name, 29, palette.parchment, Enum.Font.Garamond); heading.Size = UDim2.new(1,0,0,32)
        local flourish = create('Frame',{Size=UDim2.new(1,0,0,1),BackgroundColor3=palette.gold,BackgroundTransparency=.55,BorderSizePixel=0},tab.Page)
        gradient(flourish,Color3.fromRGB(235,197,136),Color3.fromRGB(30,26,25),0)
        local intro = label(tab.Page, spec.Description or '', 12, palette.muted); intro.TextWrapped = true; intro.Size = UDim2.new(1,0,0,30)
        function window:SelectTab(selected)
            for _, other in ipairs(self.Tabs) do
                local active = other == selected; other.Page.Visible = active
                animate(other.Nav, {BackgroundTransparency = active and 0 or 1})
                animate(other.Caption, {TextColor3 = active and palette.parchment or palette.muted})
                animate(other.Image, {ImageColor3 = active and palette.gold or palette.muted})
            end
            self.Active = selected
            selected.Page.CanvasPosition = Vector2.new(0,0)
            selected.Page.ScrollBarImageTransparency = .55
        end
        tab.Nav.Activated:Connect(function() window:SelectTab(tab) end)
        table.insert(window.Tabs, tab)
        tab.Caption.Visible = not window.Compact
        if not window.Active then window:SelectTab(tab) end
        function tab:Section(specification)
            specification = specification or {}
            local card = create('Frame', {Size = UDim2.new(1,0,0,0), AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Color3.new(1,1,1), BackgroundTransparency = .18, BorderSizePixel = 0}, self.Page); corner(card,7); stroke(card,palette.line,.3)
            gradient(card, Color3.fromRGB(47,41,38), Color3.fromRGB(27,26,29), 105)
            padding(card,15,16,15,16); create('UIListLayout', {Padding = UDim.new(0,10), SortOrder = Enum.SortOrder.LayoutOrder}, card)
            local title = label(card, specification.Name or 'Section', 18, palette.parchment, Enum.Font.Garamond); title.Size = UDim2.new(1,0,0,24)
            local accent = create('Frame',{Position=UDim2.fromOffset(-16,-15),Size=UDim2.fromOffset(3,24),BackgroundColor3=palette.gold,BackgroundTransparency=.3,BorderSizePixel=0},title)
            corner(accent,2)
            if specification.Description then local desc = label(card, specification.Description, 12, palette.muted); desc.TextWrapped = true; desc.AutomaticSize = Enum.AutomaticSize.Y; desc.Size = UDim2.new(1,0,0,0) end
            local section = {}
            local function row(name, description, height)
                local frame = create('Frame', {Size = UDim2.new(1,0,0,height or 48), BackgroundTransparency = 1}, card)
                local titleLabel = label(frame, name or '', 13, palette.text, Enum.Font.GothamMedium); titleLabel.Position = UDim2.fromOffset(0,1); titleLabel.Size = UDim2.new(1,-125,0,19); titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
                if description then local d = label(frame, description, 11, palette.muted); d.Position = UDim2.fromOffset(0,22); d.Size = UDim2.new(1,-125,0,19); d.TextTruncate = Enum.TextTruncate.AtEnd end
                return frame
            end
            function section:Toggle(spec2)
                local value = spec2.Default == true
                local frame = row(spec2.Name, spec2.Description, 54)
                -- The clickable area is larger than the visible switch for touch use.
                local hit = button(frame, '')
                hit.AnchorPoint = Vector2.new(1,.5); hit.Position = UDim2.new(1,0,.5,0); hit.Size = UDim2.fromOffset(94,48)
                local state = label(hit,'',9,palette.muted,Enum.Font.GothamBold)
                state.Position=UDim2.fromOffset(0,0); state.Size=UDim2.fromOffset(33,48); state.TextXAlignment=Enum.TextXAlignment.Right
                local track = create('Frame',{AnchorPoint=Vector2.new(1,.5),Position=UDim2.new(1,-2,.5,0),Size=UDim2.fromOffset(48,25),BackgroundColor3=palette.elevated,BorderSizePixel=0},hit)
                corner(track,13)
                local border=create('UIStroke',{Color=palette.line,Transparency=.1,Thickness=1},track)
                local inset=create('Frame',{Position=UDim2.fromOffset(3,3),Size=UDim2.new(1,-6,1,-6),BackgroundColor3=Color3.fromRGB(18,18,20),BackgroundTransparency=.55,BorderSizePixel=0},track);corner(inset,10)
                local knob=create('Frame',{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.new(0,12,.5,0),Size=UDim2.fromOffset(19,19),BackgroundColor3=Color3.fromRGB(210,197,172),BorderSizePixel=0},track);corner(knob,10)
                create('UIStroke',{Color=Color3.fromRGB(245,222,177),Transparency=.55,Thickness=1},knob)
                local seal=create('Frame',{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(5,5),Rotation=45,BackgroundColor3=Color3.fromRGB(96,79,61),BorderSizePixel=0},knob);corner(seal,1)
                local function render()
                    state.Text = value and 'ON' or 'OFF'
                    animate(state,{TextColor3=value and Color3.fromRGB(255,217,155) or palette.muted})
                        animate(track,{BackgroundColor3=value and Color3.fromRGB(130,96,57) or palette.elevated})
                    animate(border,{Color=value and palette.gold or palette.line,Transparency=value and .05 or .15})
                    animate(knob,{Position=UDim2.new(0,value and 36 or 12,.5,0),BackgroundColor3=value and Color3.fromRGB(245,218,165) or Color3.fromRGB(184,177,161)})
                    animate(seal,{BackgroundColor3=value and Color3.fromRGB(143,96,46) or Color3.fromRGB(96,86,76)})
                end
                local api={}; function api:Set(v,silent) value=v==true; render(); if not silent then fire(spec2.Callback,value) end end; function api:Get() return value end
                hit.MouseEnter:Connect(function() animate(border,{Transparency=0}) end)
                hit.MouseLeave:Connect(render)
                hit.Activated:Connect(function() api:Set(not value) end)
                render(); return api
            end
            function section:Button(spec2)
                local frame = row(spec2.Name,spec2.Description,54)
                local control = button(frame,''); control.AnchorPoint=Vector2.new(1,.5); control.Position=UDim2.new(1,0,.5,0); control.Size=UDim2.fromOffset(104,38)
                control.BackgroundColor3=Color3.fromRGB(47,40,35); control.BackgroundTransparency=0; corner(control,6)
                local outline=create('UIStroke',{Color=palette.gold,Transparency=.48,Thickness=1},control)
                local caption=label(control,spec2.Action or 'OPEN',10,palette.parchment,Enum.Font.GothamBold); caption.Position=UDim2.fromOffset(11,0); caption.Size=UDim2.new(1,-30,1,0); caption.TextTruncate=Enum.TextTruncate.AtEnd
                local arrow=icon(control,'arrow-right','>'); arrow.AnchorPoint=Vector2.new(1,.5); arrow.Position=UDim2.new(1,-9,.5,0); arrow.Size=UDim2.fromOffset(14,14)
                control.MouseEnter:Connect(function() animate(control,{BackgroundColor3=Color3.fromRGB(96,66,39)}); animate(outline,{Transparency=.02}) end)
                control.MouseLeave:Connect(function() animate(control,{BackgroundColor3=Color3.fromRGB(47,40,35)}); animate(outline,{Transparency=.48}) end)
                control.Activated:Connect(function() fire(spec2.Callback) end); return control
            end
            function section:Slider(spec2)
                local min,max=spec2.Min or 0,spec2.Max or 100; assert(max>min,'Slider max must exceed min')
                local step=spec2.Step or 1; assert(step>0,'Slider step must be positive')
                local value=math.clamp(spec2.Default or min,min,max); local frame=row(spec2.Name,spec2.Description,92)
                local badge=create('Frame',{AnchorPoint=Vector2.new(1,0),Position=UDim2.new(1,0,0,0),Size=UDim2.fromOffset(81,27),BackgroundColor3=Color3.fromRGB(48,39,31),BorderSizePixel=0},frame);corner(badge,5);stroke(badge,palette.gold,.55)
                local amount=label(badge,'',12,palette.parchment,Enum.Font.GothamBold); amount.Size=UDim2.fromScale(1,1); amount.TextXAlignment=Enum.TextXAlignment.Center
                -- The rail is thin, but its invisible input area remains finger-sized.
                local hit=button(frame,''); hit.Position=UDim2.new(0,0,0,43); hit.Size=UDim2.new(1,0,0,40)
                local rail=create('Frame',{Position=UDim2.new(0,10,.5,-3),Size=UDim2.new(1,-20,0,6),BackgroundColor3=Color3.fromRGB(18,18,20),BorderSizePixel=0},hit);corner(rail,4);stroke(rail,palette.line,.2)
                local fill=create('Frame',{Size=UDim2.fromScale(0,1),BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0},rail);corner(fill,4);gradient(fill,Color3.fromRGB(128,89,52),Color3.fromRGB(229,194,130),0)
                local thumbGlow=halo(rail,UDim2.fromScale(0,.5))
                local thumb=create('Frame',{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(0,.5),Size=UDim2.fromOffset(20,20),BackgroundColor3=Color3.fromRGB(48,37,30),BorderSizePixel=0},rail);corner(thumb,10);stroke(thumb,palette.gold,.05)
                local gem=create('Frame',{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(8,8),Rotation=45,BackgroundColor3=Color3.fromRGB(255,224,167),BorderSizePixel=0},thumb);corner(gem,2)
                local low=label(frame,tostring(min),10,palette.muted); low.Position=UDim2.new(0,0,1,-14); low.Size=UDim2.fromOffset(55,14)
                local high=label(frame,tostring(max),10,palette.muted); high.AnchorPoint=Vector2.new(1,0); high.Position=UDim2.new(1,0,1,-14); high.Size=UDim2.fromOffset(55,14); high.TextXAlignment=Enum.TextXAlignment.Right
                local api={}; function api:Set(v,silent)
                    local number=tonumber(v) or min
                    if number~=number or math.abs(number)==math.huge then number=min end
                    local nextValue=math.clamp(min+math.floor((number-min)/step+.5)*step,min,max)
                    nextValue=tonumber(string.format('%.8f',nextValue)) or nextValue
                    local changed=nextValue~=value; value=nextValue; amount.Text=tostring(value)
                    local fraction=(value-min)/(max-min)
                    animate(fill,{Size=UDim2.fromScale(fraction,1)}); animate(thumb,{Position=UDim2.fromScale(fraction,.5)})
                    for _,layer in ipairs(thumbGlow) do animate(layer,{Position=UDim2.fromScale(fraction,.5)}) end
                    if changed and not silent then fire(spec2.Callback,value) end
                end; function api:Get() return value end
                local activeInput
                local function update(input) api:Set(min+math.clamp((input.Position.X-rail.AbsolutePosition.X)/math.max(rail.AbsoluteSize.X,1),0,1)*(max-min)) end
                hit.InputBegan:Connect(function(input)
                    if input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseButton1 then activeInput=input; animate(thumb,{Size=UDim2.fromOffset(23,23)}); update(input) end
                end)
                local move=InputService.InputChanged:Connect(function(input) if activeInput and (input==activeInput or input.UserInputType==Enum.UserInputType.MouseMovement and activeInput.UserInputType==Enum.UserInputType.MouseButton1) then update(input) end end)
                local ended=InputService.InputEnded:Connect(function(input) if input==activeInput then activeInput=nil; animate(thumb,{Size=UDim2.fromOffset(20,20)}) end end)
                frame.Destroying:Connect(function() move:Disconnect(); ended:Disconnect() end); api:Set(value,true); return api
            end
            function section:Input(spec2)
                local frame = row(spec2.Name,spec2.Description,52)
                local box = create('TextBox',{AnchorPoint=Vector2.new(1,.5),Position=UDim2.new(1,0,.5,0),Size=UDim2.fromOffset(112,38),BackgroundColor3=Color3.fromRGB(24,23,24),BorderSizePixel=0,Text=tostring(spec2.Default or ''),PlaceholderText=spec2.Placeholder or 'Enter',PlaceholderColor3=palette.muted,TextColor3=palette.parchment,Font=Enum.Font.Gotham,TextSize=12,ClearTextOnFocus=false},frame); corner(box,5); stroke(box,palette.line)
                box.Focused:Connect(function() animate(box,{BackgroundColor3=Color3.fromRGB(64,48,35)}) end)
                box.FocusLost:Connect(function() animate(box,{BackgroundColor3=Color3.fromRGB(24,23,24)}); fire(spec2.Callback,box.Text) end)
                local api={}; function api:Set(v,silent) box.Text=tostring(v); if not silent then fire(spec2.Callback,box.Text) end end; function api:Get() return box.Text end; return api
            end
            function section:Dropdown(spec2)
                local values = table.clone(spec2.Values or {})
                local value = spec2.Default or values[1] or 'None'
                local multi = spec2.Multi == true
                local selected = {}
                if multi then
                    for _, v in ipairs(type(spec2.Default) == 'table' and spec2.Default or {}) do if table.find(values,v) then selected[v]=true end end
                elseif not table.find(values,value) then value = values[1] or 'None' end
                local expanded = false
                local frame = row(spec2.Name,spec2.Description,52); frame.ClipsDescendants = true
                local control = button(frame,''); control.AnchorPoint=Vector2.new(1,0); control.Position=UDim2.new(1,0,0,7); control.Size=UDim2.fromOffset(116,38); control.BackgroundColor3=Color3.fromRGB(30,28,28); control.BackgroundTransparency=0; corner(control,6); stroke(control,palette.gold,.55)
                local text = label(control,'',11,palette.parchment); text.Position=UDim2.fromOffset(9,0); text.Size=UDim2.new(1,-32,1,0); text.TextTruncate=Enum.TextTruncate.AtEnd
                local arrow = icon(control,'chevron-down','v'); arrow.AnchorPoint=Vector2.new(1,.5); arrow.Position=UDim2.new(1,-8,.5,0); arrow.Size=UDim2.fromOffset(14,14)
                local list = create('ScrollingFrame',{Position=UDim2.fromOffset(0,52),Size=UDim2.new(1,0,0,0),BackgroundColor3=palette.elevated,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=palette.gold,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(),Visible=false},frame)
                corner(list,5); create('UIListLayout',{Padding=UDim.new(0,2),SortOrder=Enum.SortOrder.LayoutOrder},list); padding(list,4,4,4,4)
                local api, items = {}, {}
                local function result()
                    if not multi then return value end
                    local out={}; for _, v in ipairs(values) do if selected[v] then table.insert(out,v) end end; return out
                end
                local function refresh()
                    if multi then local count=0; for _ in pairs(selected) do count+=1 end; text.Text=count==0 and 'Select' or tostring(count)..' selected'
                    else text.Text=tostring(value) end
                    for v, item in pairs(items) do
                        local active = multi and selected[v] == true or (not multi and v == value)
                        item.TextColor3=active and palette.gold or palette.text
                        item.BackgroundTransparency=active and .2 or 1
                    end
                end
                local function setExpanded(open)
                    expanded = open; list.Visible = open
                    local h = open and math.min(#values*40+8, 168) or 0
                    list.Size=UDim2.new(1,0,0,h)
                    animate(frame,{Size=UDim2.new(1,0,0,52+h)})
                    animate(arrow,{Rotation=open and 180 or 0})
                end
                local function rebuild()
                    for _, child in ipairs(list:GetChildren()) do if child:IsA('TextButton') then child:Destroy() end end
                    table.clear(items)
                    for index, v in ipairs(values) do
                        local option = button(list,tostring(v)); option.Size=UDim2.new(1,0,0,38); option.LayoutOrder=index; option.TextXAlignment=Enum.TextXAlignment.Left; option.TextSize=12; option.BackgroundColor3=palette.panel; corner(option,4); padding(option,0,8,0,10); items[v]=option
                        option.Activated:Connect(function()
                            if multi then selected[v]=not selected[v] or nil else value=v; setExpanded(false) end
                            refresh(); fire(spec2.Callback,result())
                        end)
                    end
                    refresh(); if expanded then setExpanded(true) end
                end
                function api:Set(v,silent)
                    if multi then
                        if type(v) ~= 'table' then return end
                        table.clear(selected); for _, choice in ipairs(v) do if table.find(values,choice) then selected[choice]=true end end
                    else if not table.find(values,v) then return end; value=v end
                    refresh(); if not silent then fire(spec2.Callback,result()) end
                end
                function api:Get() return result() end
                function api:SetValues(nextValues)
                    values=table.clone(nextValues or {})
                    for choice in pairs(selected) do if not table.find(values,choice) then selected[choice]=nil end end
                    if not table.find(values,value) then value=values[1] or 'None' end
                    rebuild()
                end
                control.Activated:Connect(function() setExpanded(not expanded) end); rebuild(); return api
            end
            function section:Segmented(spec2)
                local values=table.clone(spec2.Values or {}); assert(#values>0,'Segmented control needs values')
                local value=table.find(values,spec2.Default) and spec2.Default or values[1]
                local frame=row(spec2.Name,spec2.Description,92)
                local bar=create('Frame',{Position=UDim2.fromOffset(0,51),Size=UDim2.new(1,0,0,34),BackgroundColor3=Color3.fromRGB(21,20,21),BorderSizePixel=0},frame);corner(bar,6);stroke(bar,palette.line,.2)
                create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,3),SortOrder=Enum.SortOrder.LayoutOrder},bar);padding(bar,3,3,3,3)
                local controls={}
                local function render() for v,b in pairs(controls) do local active=v==value;animate(b,{BackgroundTransparency=active and 0 or 1,TextColor3=active and palette.parchment or palette.muted}) end end
                local api={};function api:Set(v,silent) if not table.find(values,v) then return end;value=v;render();if not silent then fire(spec2.Callback,value) end end;function api:Get() return value end
                for _,v in ipairs(values) do local b=button(bar,tostring(v));b.Size=UDim2.new(1/#values,-3,1,0);b.TextSize=11;b.TextTruncate=Enum.TextTruncate.AtEnd;b.BackgroundColor3=Color3.fromRGB(105,74,43);corner(b,4);controls[v]=b;b.Activated:Connect(function() api:Set(v) end) end
                render();return api
            end
            function section:ColorPicker(spec2)
                -- Presets are intentionally separate from the window theme.
                local colors=spec2.Colors or {Color3.fromRGB(210,170,111),Color3.fromRGB(145,68,62),Color3.fromRGB(94,124,116),Color3.fromRGB(126,112,153)}
                assert(#colors>0,'Color picker needs at least one color')
                local value=typeof(spec2.Default)=='Color3' and spec2.Default or colors[1]
                local frame=row(spec2.Name,spec2.Description,100)
                local preview=create('Frame',{AnchorPoint=Vector2.new(1,0),Position=UDim2.new(1,0,0,1),Size=UDim2.fromOffset(112,30),BackgroundColor3=palette.elevated,BorderSizePixel=0},frame);corner(preview,5);stroke(preview,palette.line,.1)
                local chip=create('Frame',{Position=UDim2.fromOffset(7,7),Size=UDim2.fromOffset(16,16),BackgroundColor3=value,BorderSizePixel=0},preview);corner(chip,8)
                local hex=label(preview,'',11,palette.parchment,Enum.Font.GothamMedium);hex.Position=UDim2.fromOffset(29,0);hex.Size=UDim2.new(1,-32,1,0)
                local swatches=create('Frame',{Position=UDim2.fromOffset(0,50),Size=UDim2.new(1,0,0,44),BackgroundTransparency=1},frame)
                create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},swatches)
                local controls={}
                local function render()
                    chip.BackgroundColor3=value
                    hex.Text=string.format('#%02X%02X%02X',math.floor(value.R*255+.5),math.floor(value.G*255+.5),math.floor(value.B*255+.5))
                    for _,entry in ipairs(controls) do
                        local active=entry.color==value
                        entry.mark.Visible=active
                        animate(entry.outline,{Transparency=active and 0 or .65,Thickness=active and 2 or 1})
                        animate(entry.swatch,{Size=UDim2.fromOffset(active and 29 or 25,active and 29 or 25)})
                    end
                end
                local api={};function api:Set(v,silent) if typeof(v)~='Color3' then return end;value=v;render();if not silent then fire(spec2.Callback,value) end end;function api:Get() return value end
                for _,color in ipairs(colors) do
                    local hit=button(swatches,'');hit.Size=UDim2.fromOffset(44,44)
                    local swatch=create('Frame',{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(25,25),BackgroundColor3=color,BorderSizePixel=0},hit);corner(swatch,15)
                    local outline=create('UIStroke',{Color=palette.parchment,Transparency=.65,Thickness=1},swatch)
                    local mark=icon(swatch,'check','+');mark.AnchorPoint=Vector2.new(.5,.5);mark.Position=UDim2.fromScale(.5,.5);mark.Size=UDim2.fromOffset(14,14);mark.ImageColor3=Color3.fromRGB(255,255,255)
                    table.insert(controls,{color=color,outline=outline,mark=mark,swatch=swatch})
                    hit.Activated:Connect(function() api:Set(color) end)
                end
                render();return api
            end
            function section:Checkbox(spec2)
                local value=spec2.Default==true
                local frame=row(spec2.Name,spec2.Description,54)
                local control=button(frame,'');control.AnchorPoint=Vector2.new(1,.5);control.Position=UDim2.new(1,0,.5,0);control.Size=UDim2.fromOffset(44,44)
                local box=create('Frame',{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(24,24),BackgroundColor3=palette.elevated,BorderSizePixel=0},control);corner(box,5);local border=create('UIStroke',{Color=palette.gold,Transparency=.4,Thickness=1},box)
                local check=icon(box,'check','+');check.AnchorPoint=Vector2.new(.5,.5);check.Position=UDim2.fromScale(.5,.5);check.Size=UDim2.fromOffset(16,16);check.ImageColor3=palette.parchment
                local function render() check.Visible=value;animate(box,{BackgroundColor3=value and Color3.fromRGB(128,91,48) or palette.elevated});animate(border,{Transparency=value and 0 or .4}) end
                local api={};function api:Set(v,silent) value=v==true;render();if not silent then fire(spec2.Callback,value) end end;function api:Get() return value end
                control.Activated:Connect(function() api:Set(not value) end);render();return api
            end
            function section:Stepper(spec2)
                local min,max=spec2.Min or 0,spec2.Max or 10;local step=spec2.Step or 1;assert(max>=min and step>0,'Invalid stepper range')
                local value=math.clamp(tonumber(spec2.Default) or min,min,max)
                local frame=row(spec2.Name,spec2.Description,56)
                local bar=create('Frame',{AnchorPoint=Vector2.new(1,.5),Position=UDim2.new(1,0,.5,0),Size=UDim2.fromOffset(124,40),BackgroundTransparency=1},frame)
                local minus=button(bar,'-');minus.Position=UDim2.fromOffset(0,2);minus.Size=UDim2.fromOffset(36,36);minus.TextSize=19;minus.BackgroundColor3=palette.elevated;minus.BackgroundTransparency=0;corner(minus,5);stroke(minus,palette.line)
                local amount=label(bar,'',12,palette.parchment,Enum.Font.GothamBold);amount.Position=UDim2.fromOffset(38,2);amount.Size=UDim2.fromOffset(48,36);amount.TextXAlignment=Enum.TextXAlignment.Center
                local plus=button(bar,'+');plus.Position=UDim2.fromOffset(88,2);plus.Size=UDim2.fromOffset(36,36);plus.TextSize=19;plus.BackgroundColor3=palette.elevated;plus.BackgroundTransparency=0;corner(plus,5);stroke(plus,palette.line)
                local api={};function api:Set(v,silent) local n=tonumber(v);if not n or n~=n or math.abs(n)==math.huge then return end;value=math.clamp(min+math.floor((n-min)/step+.5)*step,min,max);value=tonumber(string.format('%.8f',value)) or value;amount.Text=tostring(value);if not silent then fire(spec2.Callback,value) end end;function api:Get() return value end
                minus.Activated:Connect(function() api:Set(value-step) end);plus.Activated:Connect(function() api:Set(value+step) end);api:Set(value,true);return api
            end
            function section:Status(spec2)
                local frame=row(spec2.Name,spec2.Description,48)
                local dot=create('Frame',{AnchorPoint=Vector2.new(1,.5),Position=UDim2.new(1,-92,.5,0),Size=UDim2.fromOffset(8,8),BackgroundColor3=palette.gold,BorderSizePixel=0},frame);corner(dot,4)
                local text=label(frame,'',11,palette.parchment,Enum.Font.GothamMedium);text.AnchorPoint=Vector2.new(1,.5);text.Position=UDim2.new(1,0,.5,0);text.Size=UDim2.fromOffset(85,24);text.TextXAlignment=Enum.TextXAlignment.Right;text.TextTruncate=Enum.TextTruncate.AtEnd
                local api={};function api:Set(v,color) text.Text=tostring(v);if typeof(color)=='Color3' then dot.BackgroundColor3=color end end;api:Set(spec2.Value or 'Ready',spec2.Color);return api
            end
            function section:Keybind(spec2)
                local key=typeof(spec2.Default)=='EnumItem' and spec2.Default or nil
                local capturing=false
                local frame=row(spec2.Name,spec2.Description,52)
                local control=button(frame,'');control.AnchorPoint=Vector2.new(1,.5);control.Position=UDim2.new(1,0,.5,0);control.Size=UDim2.fromOffset(112,38);control.BackgroundColor3=palette.elevated;control.BackgroundTransparency=0;control.TextSize=11;corner(control,5);stroke(control,palette.gold,.55)
                local function render() control.Text=capturing and 'PRESS A KEY' or (key and key.Name or 'UNBOUND') end
                local api={};function api:Set(v,silent) if v~=nil and (typeof(v)~='EnumItem' or v.EnumType~=Enum.KeyCode) then return end;key=v;capturing=false;render();if not silent then fire(spec2.ChangedCallback,key) end end;function api:Get() return key end
                control.Activated:Connect(function() capturing=not capturing;render() end)
                local connection=InputService.InputBegan:Connect(function(input,processed)
                    if input.UserInputType~=Enum.UserInputType.Keyboard then return end
                    if capturing then
                        if input.KeyCode==Enum.KeyCode.Escape then capturing=false;render();return end
                        if input.KeyCode==Enum.KeyCode.Backspace then api:Set(nil);return end
                        if input.KeyCode~=Enum.KeyCode.Unknown then api:Set(input.KeyCode) end
                    elseif not processed and not InputService:GetFocusedTextBox() and key and input.KeyCode==key then fire(spec2.Callback,key) end
                end)
                frame.Destroying:Connect(function() connection:Disconnect() end);render();return api
            end
            function section:Divider(spec2)
                local frame=create('Frame',{Size=UDim2.new(1,0,0,24),BackgroundTransparency=1},card)
                local text=label(frame,(spec2 and spec2.Name) or '',10,palette.gold,Enum.Font.GothamBold);text.Size=UDim2.new(1,0,0,20)
                local line=create('Frame',{Position=UDim2.new(0,0,1,-1),Size=UDim2.new(1,0,0,1),BackgroundColor3=palette.gold,BackgroundTransparency=.6,BorderSizePixel=0},frame)
                gradient(line,Color3.fromRGB(235,197,136),Color3.fromRGB(35,30,25),0)
                return frame
            end
            function section:Paragraph(spec2)
                local frame = create('Frame',{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=palette.elevated,BorderSizePixel=0},card); corner(frame,5); padding(frame,10,12,10,12)
                create('UIListLayout',{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},frame)
                local title = label(frame,spec2.Title or '',15,palette.parchment,Enum.Font.Garamond); title.Size=UDim2.new(1,0,0,20)
                local body = label(frame,spec2.Body or '',12,palette.text); body.TextWrapped=true; body.TextYAlignment=Enum.TextYAlignment.Top; body.AutomaticSize=Enum.AutomaticSize.Y; body.Size=UDim2.new(1,0,0,0)
                local api={}; function api:Set(text) body.Text=tostring(text) end; return api
            end
            function section:Progress(spec2)
                local frame = row(spec2.Name,spec2.Description,67)
                local amount=label(frame,'',11,palette.gold,Enum.Font.GothamBold); amount.Position=UDim2.new(1,-90,0,1); amount.Size=UDim2.fromOffset(90,20); amount.TextXAlignment=Enum.TextXAlignment.Right
                local track=create('Frame',{Position=UDim2.new(0,0,1,-14),Size=UDim2.new(1,0,0,6),BackgroundColor3=palette.elevated,BorderSizePixel=0},frame);corner(track,4)
                local fill=create('Frame',{Size=UDim2.fromScale(0,1),BackgroundColor3=palette.gold,BorderSizePixel=0},track);corner(fill,4)
                local api={}; function api:Set(v) local n=math.clamp(tonumber(v) or 0,0,1); amount.Text=tostring(math.floor(n*100+.5))..'%'; animate(fill,{Size=UDim2.fromScale(n,1)}) end
                api:Set(spec2.Default or 0); return api
            end
            function section:Info(spec2)
                local frame=row(spec2.Name,spec2.Description,44)
                local value=label(frame,tostring(spec2.Value or ''),12,palette.gold,Enum.Font.GothamMedium); value.AnchorPoint=Vector2.new(1,.5); value.Position=UDim2.new(1,0,.5,0); value.Size=UDim2.fromOffset(120,25); value.TextXAlignment=Enum.TextXAlignment.Right; value.TextTruncate=Enum.TextTruncate.AtEnd
                local api={}; function api:Set(v) value.Text=tostring(v) end; return api
            end
            return section
        end
        -- Subtabs share the tab's scrolling page and the same section API.
        function tab:SubTab(subSpec)
            subSpec=subSpec or {}
            if not self.SubBar then
                self.SubTabs={}
                self.SubBar=create('ScrollingFrame',{Name='SubTabs',Size=UDim2.new(1,0,0,43),BackgroundColor3=Color3.fromRGB(24,22,23),BackgroundTransparency=.12,BorderSizePixel=0,ScrollBarThickness=2,ScrollBarImageColor3=palette.gold,ScrollingDirection=Enum.ScrollingDirection.X,AutomaticCanvasSize=Enum.AutomaticSize.X,CanvasSize=UDim2.new()},self.Page)
                corner(self.SubBar,6);stroke(self.SubBar,palette.line,.35)
                create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,4),SortOrder=Enum.SortOrder.LayoutOrder},self.SubBar);padding(self.SubBar,4,4,4,4)
            end
            local sub={Name=subSpec.Name or 'Page',Section=self.Section}
            sub.Button=button(self.SubBar,sub.Name);sub.Button.Size=UDim2.fromOffset(math.clamp(#sub.Name*8+32,90,180),33);sub.Button.TextSize=12;sub.Button.BackgroundColor3=Color3.fromRGB(102,71,42);corner(sub.Button,5)
            sub.Page=create('Frame',{Name='SubPage',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false},self.Page)
            create('UIListLayout',{Padding=UDim.new(0,12),SortOrder=Enum.SortOrder.LayoutOrder},sub.Page)
            table.insert(self.SubTabs,sub)
            function self:SelectSubTab(selected)
                if not table.find(self.SubTabs,selected) then return end
                for _,item in ipairs(self.SubTabs) do
                    local active=item==selected;item.Page.Visible=active
                    animate(item.Button,{BackgroundTransparency=active and 0 or 1,TextColor3=active and palette.parchment or palette.muted})
                end
                self.ActiveSubTab=selected
            end
            sub.Button.Activated:Connect(function() self:SelectSubTab(sub) end)
            if not self.ActiveSubTab then self:SelectSubTab(sub) end
            function sub:Select() tab:SelectSubTab(self);window:SelectTab(tab) end
            return sub
        end
        return tab
    end
    function window:Destroy() gui:Destroy() end
    responsive()
    return window
end
return Library
