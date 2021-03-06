----------------------------------------------------------
-- Load RayUI Environment
----------------------------------------------------------
RayUI:LoadEnv("Skins")


local S = _Skins

local function LoadSkin()
	local r, g, b = _r, _g, _b
	S:ReskinCheck(TokenFramePopupInactiveCheckBox)
	S:ReskinCheck(TokenFramePopupBackpackCheckBox)
	S:ReskinClose(TokenFramePopupCloseButton)
	S:ReskinScroll(TokenFrameContainerScrollBar)
	TokenFramePopupCorner:Hide()
	TokenFramePopup:SetPoint("TOPLEFT", TokenFrame, "TOPRIGHT", 1, -28)
	local function updateButtons()
		local buttons = TokenFrameContainer.buttons
		for i = 1, #buttons do

			local button = buttons[i]

			if button and not button.reskinned then
				button.highlight:SetPoint("TOPLEFT", 1, 0)
				button.highlight:SetPoint("BOTTOMRIGHT", -1, 0)
				button.highlight.SetPoint = R.dummy
				button.highlight:SetColorTexture(r, g, b, .2)
				button.highlight.SetTexture = R.dummy
				button.categoryMiddle:SetAlpha(0)
				button.categoryLeft:SetAlpha(0)
				button.categoryRight:SetAlpha(0)

				button.icon:SetTexCoord(.08, .92, .08, .92)
				button.bg = S:CreateBG(button.icon)
				button.reskinned = true
			end

			if button.isHeader then
				button.bg:Hide()
			else
				button.bg:Show()
			end
		end
	end
	TokenFrame:HookScript("OnShow", updateButtons)
	hooksecurefunc(TokenFrameContainer, "update", updateButtons)
end

S:AddCallback("Bags", LoadSkin)