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
local function create(class, properties, parent)
    local instance = Instance.new(class)
    for key, value in pairs(properties or {}) do instance[key] = value end
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
    local scale = create('UIScale', {Scale = .965}, root)
    TweenService:Create(scale, TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Scale = 1}):Play()
    local top = create('Frame', {Size = UDim2.new(1,0,0,58), BackgroundColor3 = Color3.new(1,1,1), BorderSizePixel = 0}, root)
    gradient(top, Color3.fromRGB(51,42,35), Color3.fromRGB(23,23,26), 0)
    local glow = create('Frame', {Position = UDim2.new(0,0,1,-2), Size = UDim2.new(1,0,0,2), BackgroundColor3 = palette.gold, BackgroundTransparency = .45, BorderSizePixel = 0}, top)
    gradient(glow, Color3.fromRGB(96,72,49), Color3.fromRGB(207,168,108), 0)
    TweenService:Create(glow, TweenInfo.new(2.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {BackgroundTransparency = .75}):Play()
    local emblem = icon(top, 'book-open', 'F'); emblem.Position = UDim2.fromOffset(18,17); emblem.Size = UDim2.fromOffset(25,25)
    local brand = label(top, options.Title or 'FABLE', 20, palette.parchment, Enum.Font.Garamond); brand.Position = UDim2.fromOffset(51,8); brand.Size = UDim2.fromOffset(160,24)
    local subtitle = label(top, options.Subtitle or 'A PRIVATE CHRONICLE', 9, palette.muted, Enum.Font.Gotham); subtitle.Position = UDim2.fromOffset(52,32); subtitle.Size = UDim2.fromOffset(200,14)
    local close = button(top, ''); close.Position = UDim2.new(1,-46,0,8); close.Size = UDim2.fromOffset(36,36)
    local closeIcon = icon(close, 'x', 'X'); closeIcon.AnchorPoint = Vector2.new(.5,.5); closeIcon.Position = UDim2.fromScale(.5,.5); closeIcon.Size = UDim2.fromOffset(17,17); closeIcon.ImageColor3 = palette.muted
    close.MouseEnter:Connect(function() animate(closeIcon, {ImageColor3 = palette.parchment}) end)
    close.MouseLeave:Connect(function() animate(closeIcon, {ImageColor3 = palette.muted}) end)
    close.Activated:Connect(function() gui:Destroy() end)
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
            root.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    gui.Destroying:Connect(function() dragConnection:Disconnect() end)
    local nav = create('ScrollingFrame', {Position = UDim2.fromOffset(0,58), Size = UDim2.new(0,172,1,-58),
        BackgroundColor3 = palette.sidebar, BorderSizePixel = 0, ScrollBarThickness = 2, ScrollBarImageColor3 = palette.line,
        AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new()}, root)
    padding(nav, 15, 9, 14, 9)
    create('UIListLayout', {Padding = UDim.new(0,5), SortOrder = Enum.SortOrder.LayoutOrder}, nav)
    local chapter = label(nav, 'THE CHRONICLE', 9, palette.muted, Enum.Font.GothamBold); chapter.Size = UDim2.new(1,0,0,24)
    local divider = create('Frame', {Position = UDim2.fromOffset(171,58), Size = UDim2.new(0,1,1,-58), BackgroundColor3 = palette.line, BorderSizePixel = 0}, root)
    local content = create('Frame', {Position = UDim2.fromOffset(172,58), Size = UDim2.new(1,-172,1,-58), BackgroundTransparency = 1, ClipsDescendants = true}, root)
    local window = {Gui = gui, Tabs = {}, Active = nil, Compact = false}
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
        local intro = label(tab.Page, spec.Description or '', 12, palette.muted); intro.TextWrapped = true; intro.Size = UDim2.new(1,0,0,30)
        function window:SelectTab(selected)
            for _, other in ipairs(self.Tabs) do
                local active = other == selected; other.Page.Visible = active
                animate(other.Nav, {BackgroundTransparency = active and 0 or 1})
                animate(other.Caption, {TextColor3 = active and palette.parchment or palette.muted})
                animate(other.Image, {ImageColor3 = active and palette.gold or palette.muted})
            end
            self.Active = selected
        end
        tab.Nav.Activated:Connect(function() window:SelectTab(tab) end)
        table.insert(window.Tabs, tab)
        tab.Caption.Visible = not window.Compact
        if not window.Active then window:SelectTab(tab) end
        function tab:Section(specification)
            specification = specification or {}
            local card = create('Frame', {Size = UDim2.new(1,0,0,0), AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Color3.new(1,1,1), BorderSizePixel = 0}, self.Page); corner(card,7); stroke(card,palette.line,.3)
            gradient(card, Color3.fromRGB(47,41,38), Color3.fromRGB(27,26,29), 105)
            padding(card,15,16,15,16); create('UIListLayout', {Padding = UDim.new(0,10), SortOrder = Enum.SortOrder.LayoutOrder}, card)
            local title = label(card, specification.Name or 'Section', 18, palette.parchment, Enum.Font.Garamond); title.Size = UDim2.new(1,0,0,24)
            if specification.Description then local desc = label(card, specification.Description, 12, palette.muted); desc.TextWrapped = true; desc.AutomaticSize = Enum.AutomaticSize.Y; desc.Size = UDim2.new(1,0,0,0) end
            local section = {}
            local function row(name, description, height)
                local frame = create('Frame', {Size = UDim2.new(1,0,0,height or 48), BackgroundTransparency = 1}, card)
                local titleLabel = label(frame, name or '', 13, palette.text, Enum.Font.GothamMedium); titleLabel.Position = UDim2.fromOffset(0,1); titleLabel.Size = UDim2.new(1,-95,0,19); titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
                if description then local d = label(frame, description, 11, palette.muted); d.Position = UDim2.fromOffset(0,22); d.Size = UDim2.new(1,-95,0,19); d.TextTruncate = Enum.TextTruncate.AtEnd end
                return frame
            end
            function section:Toggle(spec2)
                local value = spec2.Default == true; local frame = row(spec2.Name,spec2.Description,48)
                local control = button(frame,''); control.AnchorPoint = Vector2.new(1,.5); control.Position = UDim2.new(1,0,.5,0); control.Size = UDim2.fromOffset(40,22); corner(control,11); stroke(control,palette.line,.1)
                local knob = create('Frame',{Size = UDim2.fromOffset(14,14), Position = UDim2.fromOffset(4,4), BackgroundColor3 = palette.parchment, BorderSizePixel = 0},control); corner(knob,7)
                local function render() animate(control,{BackgroundColor3 = value and palette.gold or palette.elevated}); animate(knob,{Position = UDim2.fromOffset(value and 22 or 4,4)}) end
                local api = {}; function api:Set(v, silent) value = v == true; render(); if not silent then fire(spec2.Callback,value) end end
                control.Activated:Connect(function() api:Set(not value) end); render(); return api
            end
            function section:Button(spec2)
                local frame = row(spec2.Name,spec2.Description,48); local control = button(frame,spec2.Action or 'OPEN')
                control.AnchorPoint = Vector2.new(1,.5); control.Position = UDim2.new(1,0,.5,0); control.Size = UDim2.fromOffset(75,30); control.BackgroundColor3 = palette.elevated; control.BackgroundTransparency = 0; control.TextColor3 = palette.gold; control.TextSize = 10; control.Font = Enum.Font.GothamBold; corner(control,5); stroke(control,palette.line)
                control.MouseEnter:Connect(function() animate(control,{BackgroundColor3 = Color3.fromRGB(65,51,41)}) end)
                control.MouseLeave:Connect(function() animate(control,{BackgroundColor3 = palette.elevated}) end)
                control.Activated:Connect(function() fire(spec2.Callback) end); return control
            end
            function section:Slider(spec2)
                local min, max = spec2.Min or 0, spec2.Max or 100; assert(max > min, 'Slider max must exceed min')
                local step = spec2.Step or 1; assert(step > 0, 'Slider step must be positive')
                local value = math.clamp(spec2.Default or min,min,max); local frame = row(spec2.Name,spec2.Description,70)
                local amount = label(frame,'',12,palette.gold,Enum.Font.GothamBold); amount.Position = UDim2.new(1,-80,0,1); amount.Size = UDim2.fromOffset(80,20); amount.TextXAlignment = Enum.TextXAlignment.Right
                local track = button(frame,''); track.Position = UDim2.new(0,0,1,-19); track.Size = UDim2.new(1,0,0,16); track.BackgroundColor3 = palette.elevated; track.BackgroundTransparency = 0; corner(track,8)
                local fill = create('Frame',{Size = UDim2.fromScale(0,1), BackgroundColor3 = palette.gold, BorderSizePixel = 0},track); corner(fill,8)
                local api = {}; function api:Set(v,silent) value = math.clamp(min + math.floor(((tonumber(v) or min)-min)/step+.5)*step,min,max); amount.Text = tostring(value); animate(fill,{Size = UDim2.fromScale((value-min)/(max-min),1)}); if not silent then fire(spec2.Callback,value) end end
                local activeInput
                local function update(input) api:Set(min + math.clamp((input.Position.X-track.AbsolutePosition.X)/math.max(track.AbsoluteSize.X,1),0,1)*(max-min)) end
                track.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then activeInput=input; update(input) end end)
                local move = InputService.InputChanged:Connect(function(input) if activeInput and (input == activeInput or input.UserInputType == Enum.UserInputType.MouseMovement and activeInput.UserInputType == Enum.UserInputType.MouseButton1) then update(input) end end)
                local ended = InputService.InputEnded:Connect(function(input) if input == activeInput then activeInput=nil end end)
                frame.Destroying:Connect(function() move:Disconnect(); ended:Disconnect() end); api:Set(value,true); return api
            end
            function section:Input(spec2)
                local frame = row(spec2.Name,spec2.Description,52)
                local box = create('TextBox',{AnchorPoint=Vector2.new(1,.5),Position=UDim2.new(1,0,.5,0),Size=UDim2.fromOffset(90,31),BackgroundColor3=palette.elevated,BorderSizePixel=0,Text=tostring(spec2.Default or ''),PlaceholderText=spec2.Placeholder or 'Enter',PlaceholderColor3=palette.muted,TextColor3=palette.parchment,Font=Enum.Font.Gotham,TextSize=12,ClearTextOnFocus=false},frame); corner(box,5); stroke(box,palette.line)
                box.FocusLost:Connect(function() fire(spec2.Callback,box.Text) end)
                local api={}; function api:Set(v,silent) box.Text=tostring(v); if not silent then fire(spec2.Callback,box.Text) end end; return api
            end
            function section:Dropdown(spec2)
                local values = spec2.Values or {}; local value = spec2.Default or values[1] or 'None'; local index = table.find(values,value) or 1
                local frame = row(spec2.Name,spec2.Description,52)
                local control = button(frame,tostring(value) .. '  v'); control.AnchorPoint=Vector2.new(1,.5); control.Position=UDim2.new(1,0,.5,0); control.Size=UDim2.fromOffset(110,31); control.BackgroundColor3=palette.elevated; control.BackgroundTransparency=0; control.TextColor3=palette.parchment; control.TextSize=11; control.TextTruncate=Enum.TextTruncate.AtEnd; corner(control,5); stroke(control,palette.line)
                -- Compact cycling selector for the prototype; a full menu is planned for integration.
                local api={}; function api:Set(v,silent) local i=table.find(values,v); if not i then return end; index=i; value=v; control.Text=tostring(value)..'  v'; if not silent then fire(spec2.Callback,value) end end
                control.Activated:Connect(function() if #values > 0 then api:Set(values[index % #values + 1]) end end); return api
            end
            return section
        end
        return tab
    end
    function window:Destroy() gui:Destroy() end
    responsive()
    return window
end
local window = Library:CreateWindow({Title = 'FABLE', Subtitle = 'A PRIVATE CHRONICLE'})
local overview = window:Tab({Name = 'The Chronicle', Icon = 'book-open', Eyebrow = 'FABLE  /  THE FIRST PAGE', Description = 'A quieter place to prepare for the stories ahead.'})
local welcome = overview:Section({Name = 'Welcome, traveler', Description = 'An early look at Fable’s own interface. These controls are a visual demonstration; they do not interact with the game.'})
welcome:Toggle({Name = 'Begin the journey', Description = 'A sample switch, written in gold.', Default = true, Callback = function(v) print('[Fable UI demo] Toggle:', v) end})
welcome:Slider({Name = 'Flight speed', Description = 'Adjust a setting with the gilded slider.', Min = 100, Max = 300, Default = 200, Step = 10, Callback = function(v) print('[Fable UI demo] Slider:', v) end})
welcome:Button({Name = 'The next chapter', Description = 'A simple action, ready when you are.', Action = 'CONTINUE', Callback = function() print('[Fable UI demo] Button pressed') end})
local preparation = window:Tab({Name = 'Preparation', Icon = 'shield', Eyebrow = 'FABLE  /  PREPARATION', Description = 'Set your intentions before you venture out.'})
local settings = preparation:Section({Name = 'The armory', Description = 'Sample controls for a future Fable integration.'})
settings:Dropdown({Name = 'Preferred weapon', Description = 'Tap to cycle through this prototype selector.', Values = {'Blades', 'Spears', 'Any'}, Default = 'Blades', Callback = function(v) print('[Fable UI demo] Choice:', v) end})
settings:Input({Name = 'Gold threshold', Description = 'A sample text entry field.', Placeholder = '0', Callback = function(v) print('[Fable UI demo] Input:', v) end})
settings:Toggle({Name = 'Keep a reserve', Description = 'An example safety preference.', Callback = function(v) print('[Fable UI demo] Reserve:', v) end})
local lore = window:Tab({Name = 'Archives', Icon = 'library', Eyebrow = 'FABLE  /  ARCHIVES', Description = 'Records, notes and the paths already traveled.'})
lore:Section({Name = 'An unfinished tale', Description = 'This is a standalone visual prototype. Fable’s existing library, saved settings and hosted release remain untouched.'})
