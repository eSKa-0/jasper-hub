local PLAYERS = game:GetService("Players")
local PLAYER = PLAYERS.LocalPlayer
local RS = game:GetService("RunService")
local CHAR = PLAYER.Character

--cham stuff
local highlight = Instance.new("Highlight")
highlight.Adornee = CHAR
highlight.Parent = CHAR
highlight.Enabled = false
highlight.FillColor = Color3.fromRGB(255, 0, 0)
highlight.FillTransparency = 0
highlight.OutlineTransparency = 1
highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

local uiLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/topitbopit/dollarware/main/library.lua"))
local ui = uiLoader({
	rounding = false, -- Whether certain features get rounded
	theme = "watermelon", -- The theme. Available themes are: cherry, orange, lemon, lime, raspberry, blueberry, grape, watermelon
	smoothDragging = true, -- Smooth dragging
})

ui.autoDisableToggles = true
local window = ui.newWindow({
	text = "Jasper Hub | Murder Mystery 2", -- Title of window
	resize = true, -- Ability to resize
	size = Vector2.new(550, 376), -- Window size, accepts UDim2s and Vector2s
	position = nil, -- Custom position, defaults to roughly the bottom right corner
})

local menu = window:addMenu({
	text = "Auto Fisch", -- Title of menu
})
do
	local section = menu:addSection({
		text = "Config", -- Title of section
		side = "auto", -- Side of the menu that the section is placed on. Defaults to 'auto', but can be 'left' or 'right'
		showMinButton = true, -- Ability to minimize this section. Defaults to true
	})

	do
		section:addLabel({
			text = "text", -- Self explanatory
		})

		local toggle = section:addToggle({
			text = "toggle",
			state = false, -- Starting state of the toggle - doesn't automatically call the callback
		})

		toggle:bindToEvent("onToggle", function(newState) -- Call a function when toggled
			ui.notify({
				title = "toggle",
				message = "Toggle was toggled to " .. tostring(newState),
				duration = 3,
			})
		end)

		section
			:addButton({
				text = "button (small)",
				style = "small", -- style of the button, can be 'large' or 'small'
			})
			:bindToEvent("onClick", function() -- Call a function when clicked
				ui.notify({
					title = "button",
					message = "The button got clicked!",
					duration = 3,
				})
			end)

		section
			:addButton({
				text = "button (large)",
				style = "large", -- style of the button, can be 'large' or 'small'
			}, function() -- you don't have to always use bindToEvent, just passing a callback normally works fine
				ui.notify({
					title = "button",
					message = "The large button got clicked!",
					duration = 3,
				})
			end)
			:setTooltip("this is a large button")

		local hotkey = section:addHotkey({
			text = "hotkey",
		})
		hotkey:setHotkey(Enum.KeyCode.G)
		hotkey:setTooltip("This is a hotkey linked to the toggle!")
		hotkey:linkToControl(toggle)
	end

	local section = menu:addSection({
		text = "section 2",
		side = "right",
		showMinButton = false,
	})
	do
		section
			:addSlider({
				text = "slider",
				min = 1,
				max = 150,
				step = 0.01,
				val = 50,
			}, function(newValue)
				print(newValue)
			end)
			:setTooltip("Heres a slider!")

		section:addColorPicker({
			text = "color picker",
			color = Color3.fromRGB(255, 0, 0),
		}, function(newColor)
			print(newColor)
		end)

		section
			:addTextbox({
				text = "textbox",
			})
			:bindToEvent("onFocusLost", function(text)
				ui.notify({
					title = "textbox",
					message = text,
					duration = 4,
				})
			end)
	end
end

local m2 = window:addMenu({
	text = "Miscelanious",
})
do
	local m2s1 = m2:addSection({
		text = "Cham",
		side = "auto",
		showMinButton = true,
	})
	do
		m2s1:addLabel({
			text = "", -- Self explanatory
		})

		local m2s1t1 = m2s1:addToggle({
			text = "Toggle",
			state = false, -- Starting state of the toggle - doesn't automatically call the callback
		})

		m2s1t1:bindToEvent("onToggle", function(newState) -- Call a function when toggled
			ui.notify({
				title = "Cham toggled",
				message = "Cham was toggled to " .. tostring(newState),
				duration = 3,
			})
			highlight.Enabled = newState
		end)

		local m2s1c1 = m2s1:addColorPicker({
			text = "color picker",
			color = Color3.fromRGB(255, 0, 0),
		}, function(newColor)
			highlight.FillColor = newColor
		end)
	end
end
