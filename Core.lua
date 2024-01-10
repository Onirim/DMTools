-- Gestion de la localisation
local _, core = ...
local L = core.Locales[GetLocale()] or core.Locales["enUS"]
local version = GetAddOnMetadata("SkillSheet", "Version")

-- Enregistrement du préfixe de l'addon
C_ChatInfo.RegisterAddonMessagePrefix("SkillSheet")

---------------
-- FONCTIONS --
---------------
function rollDice(dice)
    local count, sides = dice:match("(%d*)d(%d+)")
    local bonus = dice:match("d%d+%+(%d+)")
    local malus = dice:match("d%d+-(%d+)")
    if count == nil or sides == nil then
        return dice
    else
        count = tonumber(count) or 1
        sides = tonumber(sides)
        bonus = tonumber(bonus) or 0
        malus = tonumber(malus) or 0
        local total = bonus - malus
        for i = 1, count do
            total = total + math.random(sides)
        end
        return total
    end
end



----------------------------
--   MESSAGE D'ACCUEIL    --
----------------------------
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    print("|cFFdaa520SkillSheet " .. version .. L["SkillSheet is loaded"])
end)

--------------------------------------------
-- ATTENTE DU CHARGEMENT DE LA SAUVEGARDE --
--------------------------------------------
local f = CreateFrame("Frame")
f:RegisterEvent("VARIABLES_LOADED")
f:SetScript("OnEvent", function(self, event)
    -- Vérifiez si MySkills est nil, si c'est le cas, initialisez-le à une table vide
    if MySkills == nil then
        MySkills = {}
		for i = 1, 40 do
		table.insert(MySkills, {id = i, name = "", roll = "", cost = "", description = ""})
		end
	end
	if healthValue == nil then
		healthValue = ""
	end
	if ressourceValue == nil then
		ressourceValue = ""
	end
	--------------------------
	-- INTERFACE PRINCIPALE --
	--------------------------

	-- Création du cadre
	local SkillFrame = CreateFrame("Frame", "SkillFrame", UIParent, "ButtonFrameTemplate")
	SkillFrame:SetTitle("SkillSheet")
	SkillFrame:SetPortraitToAsset("Interface\\ICONS\\inv_inscription_runescrolloffortitude_yellow")
	SkillFrame:SetSize(460, 600) -- Largeur, Hauteur
	SkillFrame:SetPoint("LEFT", 100, 60) -- Position sur l'écran
	SkillFrame:EnableMouse(true)
	SkillFrame:SetMovable(true)
	SkillFrame:RegisterForDrag("LeftButton")
	SkillFrame:SetScript("OnDragStart", SkillFrame.StartMoving)
	SkillFrame:SetScript("OnDragStop", SkillFrame.StopMovingOrSizing)
	SkillFrame:SetFrameStrata("BACKGROUND")
	SkillFrame.Inset:Hide()
	-- SkillFrame:Hide() -- A réactiver en PROD


	-- Création de la liste de compétence du volet principal
	local tableHeaders = SkillFrame:CreateFontString(nil, "OVERLAY")
	tableHeaders:SetFontObject("GameFontNormal")
	tableHeaders:SetPoint("TOPLEFT", 10, - 120)
	tableHeaders:SetText("Compétence                               Valeur               Coût")
	-- Création de la ligne de séparation
	local line = SkillFrame:CreateTexture(nil, "BACKGROUND")
	line:SetHeight(2)  -- Définit l'épaisseur de la ligne
	line:SetWidth(SkillFrame:GetWidth())  -- Définit la largeur de la ligne
	line:SetPoint("TOPLEFT", 0, - 135)  -- Positionne la ligne au centre de la frame
	line:SetColorTexture(1, 1, 1, 0.2)  -- Définit la couleur de la ligne (ici, blanc semi-transparent)

	-- Création de la page 1
	local SkillFramePage1 = CreateFrame("Frame", nil, SkillFrame)
	SkillFramePage1:SetSize(460, 600)
	SkillFramePage1:SetPoint("CENTER", 0, 0)  -- Positionne la frame au centre de l'écran
	-- Création de la texture de fond
	local bg = SkillFramePage1:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()  -- Fait en sorte que la texture remplisse toute la frame
	bg:SetColorTexture(0, 0, 0, 0)  -- Définit la texture comme transparente

	for i = 1, 15 do
	
		-- Nom de la compétence
		local skillName = SkillFramePage1:CreateFontString(nil, "OVERLAY")
		skillName:SetFontObject("GameFontNormal")
		skillName:SetPoint("TOPLEFT", 10, -30 * i - 120)
		skillName:SetText("|cFFFFFFFF" .. MySkills[i].name)
	
		-- Valeur du dé
		local diceValue = SkillFramePage1:CreateFontString(nil, "OVERLAY")
		diceValue:SetFontObject("GameFontNormal")
		diceValue:SetPoint("TOPLEFT", 210, -30 * i - 120)
		diceValue:SetText("|cFFFFFFFF" .. MySkills[i].roll)
		
		-- Valeur du coût
		local costValue = SkillFramePage1:CreateFontString(nil, "OVERLAY")
		costValue:SetFontObject("GameFontNormal")
		costValue:SetPoint("TOPLEFT", 310, -30 * i - 120)
		costValue:SetText("|cFFFFFFFF" .. MySkills[i].cost)
	
		-- Bouton de roll
		local rollButton = CreateFrame("Button", nil, SkillFramePage1, "GameMenuButtonTemplate")
		local playerName = UnitName("player") -- Obtient le nom du joueur
		rollButton:SetPoint("TOPLEFT", 365, -30 * i - 115)
		rollButton:SetSize(60, 25)
		rollButton:SetText("Roll")
		rollButton:SetScript("OnClick", function()
			PlaySound(36627)
			print(playerName .. "§" .. MySkills[i].name .. "§" .. rollDice(MySkills[i].roll) .. "§" .. rollDice(MySkills[i].cost))
		end)
		if MySkills[i].name == "" and MySkills[i].roll == "" and MySkills[i].cost == "" then
			rollButton:Hide()
		end
		
		-- Bouton d'édition
		SkillSheetEditIsOpened = false
		local editButton = CreateFrame("Button", nil, SkillFramePage1, "GameMenuButtonTemplate")
		editButton:SetPoint("TOPLEFT", 430, -30 * i - 115)
		editButton:SetSize(25, 25)
		editButton:SetText("?")
		editButton:SetScript("OnClick", function()
			if SkillSheetEditIsOpened == false then
				SkillSheetEditIsOpened = true
				-- Création de la fenêtre d'édition de compétence
				local editFrame = CreateFrame("Frame", "editFrame", UIParent, "ButtonFrameTemplate")
				editFrame:SetTitle("Editer la compétence")
				editFrame:SetSize(400, 330) -- Largeur, Hauteur
				editFrame:SetPoint("CENTER", 0, -0) -- Position sur l'écran
				ButtonFrameTemplate_HidePortrait(editFrame) 
				ButtonFrameTemplate_HideButtonBar(editFrame) 
				editFrame:EnableMouse(true)
				editFrame:SetMovable(true)
				editFrame:RegisterForDrag("LeftButton")
				editFrame:SetScript("OnDragStart", editFrame.StartMoving)
				editFrame:SetScript("OnDragStop", editFrame.StopMovingOrSizing)
				editFrame.Inset:Hide()
				editFrame:SetScript("OnHide", function(self)
					SkillSheetEditIsOpened = false  -- Change la valeur de la variable lorsque la fenêtre est fermée
				end)
				-- Zone de texte pour le nom de la compétence
				local editSkillName = editFrame:CreateFontString(nil, "OVERLAY")
				editSkillName:SetFontObject("GameFontNormal")
				editSkillName:SetPoint("TOPLEFT", 11, -30)
				editSkillName:SetText("Nom de la compétence")
				-- Zone de saisie pour le nom de la compétence
				local skillNameBox = CreateFrame("EditBox", nil, editFrame, "InputBoxTemplate")
				skillNameBox:SetSize(180, 20)
				skillNameBox:SetPoint("TOPLEFT", 15, -50)
				skillNameBox:SetAutoFocus(false)
				skillNameBox:SetText(MySkills[i].name)
				-- Zone de texte pour la valeur du dé
				local editDiceRoll = editFrame:CreateFontString(nil, "OVERLAY")
				editDiceRoll:SetFontObject("GameFontNormal")
				editDiceRoll:SetPoint("TOPLEFT", 210, -30)
				editDiceRoll:SetText("Valeur")
				-- Zone de saisie pour la valeur du dé
				local diceValueBox = CreateFrame("EditBox", nil, editFrame, "InputBoxTemplate")
				diceValueBox:SetSize(80, 20)
				diceValueBox:SetPoint("TOPLEFT", 212, -50)
				diceValueBox:SetAutoFocus(false)
				diceValueBox:SetText(MySkills[i].roll)
				-- Zone de texte pour le coût
				local editTextCost = editFrame:CreateFontString(nil, "OVERLAY")
				editTextCost:SetFontObject("GameFontNormal")
				editTextCost:SetPoint("TOPLEFT", 308, -30)
				editTextCost:SetText("Coût")
				-- Zone de saisie pour le coût
				local CostValueBox = CreateFrame("EditBox", nil, editFrame, "InputBoxTemplate")
				CostValueBox:SetSize(80, 20)
				CostValueBox:SetPoint("TOPLEFT", 310, -50)
				CostValueBox:SetAutoFocus(false)
				CostValueBox:SetText(MySkills[i].cost)
				-- Zone de texte pour la description de la compétence
				local editSkillDescription = editFrame:CreateFontString(nil, "OVERLAY")
				editSkillDescription:SetFontObject("GameFontNormal")
				editSkillDescription:SetPoint("TOPLEFT", 10, -80)
				editSkillDescription:SetText("Description de la compétence")
				-- Création de la frame de fond pour la description de la compétence
				local skillDescriptionBackground = CreateFrame("Frame", nil, editFrame)
				skillDescriptionBackground:SetSize(380, 195)  -- Définit la taille de la frame
				skillDescriptionBackground:SetPoint("TOPLEFT", 13, -100)  -- Positionne la frame au centre de l'écran
				-- Création de la texture de fond
				local bg = skillDescriptionBackground:CreateTexture(nil, "BACKGROUND")
				bg:SetAllPoints()  -- Fait en sorte que la texture remplisse toute la frame
				bg:SetColorTexture(0, 0, 0, 0.5)  -- Définit la texture comme transparente
				-- Zone de saisie pour la description de la compétence
				local skillDescriptionBox = CreateFrame("EditBox", nil, editFrame, "InputBoxTemplate")
				skillDescriptionBox:SetMultiLine(true)
				skillDescriptionBox.Left:Hide()
				skillDescriptionBox.Middle:Hide()
				skillDescriptionBox.Right:Hide()
				skillDescriptionBox:SetWidth(378)
				skillDescriptionBox:SetHeight(200)
				skillDescriptionBox:SetPoint("TOPLEFT", 15, -105)
				skillDescriptionBox:SetAutoFocus(false)
				skillDescriptionBox:SetText(MySkills[i].description)
				-- Bouton "Enregistrer"
				local saveButton = CreateFrame("Button", nil, editFrame, "GameMenuButtonTemplate")
				saveButton:SetPoint("TOPLEFT", 10, -300)
				saveButton:SetSize(180, 25)
				saveButton:SetText("Enregistrer")
				saveButton:SetScript("OnClick", function()
					-- Enregistrement de la compétence ici
					local skillNameText = skillNameBox:GetText()
					local diceValueText = diceValueBox:GetText()
					local costValueText = CostValueBox:GetText()
					local descriptionValueText = skillDescriptionBox:GetText()
					-- Ajoutez le code pour enregistrer la compétence dans votre base de données locale ici
					MySkills[i].name = skillNameText
					MySkills[i].roll = diceValueText
					MySkills[i].cost = costValueText
					MySkills[i].description = descriptionValueText
					skillName:SetText("|cFFFFFFFF" .. MySkills[i].name)
					diceValue:SetText("|cFFFFFFFF" .. MySkills[i].roll)
					costValue:SetText("|cFFFFFFFF" .. MySkills[i].cost)
					if MySkills[i].name == "" and MySkills[i].roll == "" and MySkills[i].cost == ""  then
						rollButton:Hide()
						else 
						rollButton:Show()
					end
				editFrame:Hide()
				end)
			end
		end)

	end

	-- Bouton page 1
	local SkillButtonPage1 = CreateFrame("Button", nil, SkillFrame, "GameMenuButtonTemplate")
	SkillButtonPage1:SetPoint("TOPLEFT", 60, -30)
	SkillButtonPage1:SetSize(80, 25)
	SkillButtonPage1:SetText("Page 1")
	SkillButtonPage1:SetScript("OnClick", function()
		SkillFramePage1:Show()
	end)
	
	-- Cadre des points de vie
	local health = CreateFrame("Frame", nil, SkillFrame)
	health:SetSize(50, 50)
	health:SetPoint("TOPLEFT", SkillFrame, "TOP", -220, -60)
	-- Ajout de l'icône en fond
	local background = health:CreateTexture(nil, "BACKGROUND")
	background:SetAllPoints()
	background:SetTexture("Interface\\Icons\\petbattle_health")
	local healthText = health:CreateFontString(nil, "OVERLAY")
	healthText:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
	healthText:SetPoint("CENTER", health, "CENTER", 0, -19)
	healthText:SetText("Santé") 
	-- Création de la frame de fond la santé
	local healthFrame = CreateFrame("Frame", nil, health)
	healthFrame:SetSize(100, 50)  -- Définit la taille de la frame
	healthFrame:SetPoint("RIGHT", 100, 0)  -- Positionne la frame au centre de l'écran
	-- Création de la texture de fond
	local bg = healthFrame:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()  -- Fait en sorte que la texture remplisse toute la frame
	bg:SetColorTexture(0, 0, 0, 0.5)  -- Définit la texture comme transparente
	local healthValueText = CreateFrame("EditBox", nil, healthFrame, "InputBoxTemplate")
	healthValueText:SetMultiLine(true)
	healthValueText.Left:Hide()
	healthValueText.Middle:Hide()
	healthValueText.Right:Hide()
	healthValueText:SetWidth(100)
	healthValueText:SetHeight(50)
	healthValueText:SetPoint("CENTER", 0, 0)
	healthValueText:SetAutoFocus(false)
	healthValueText:SetText(healthValue)
	healthValueText:SetFont("Fonts\\FRIZQT__.TTF", 25, "OUTLINE")
	healthValueText:SetScript("OnEditFocusLost", function(self)
		healthValue = healthValueText:GetText()
	end)

	-- Cadre des points de ressource
	local ressource = CreateFrame("Frame", nil, SkillFrame)
	ressource:SetSize(50, 50)
	ressource:SetPoint("TOPLEFT", SkillFrame, "TOP", -50, -60)
	-- Ajout de l'icône en fond
	local background = ressource:CreateTexture(nil, "BACKGROUND")
	background:SetAllPoints()
	background:SetTexture("Interface\\Icons\\ability_monk_counteractmagic")
	local ressourceText = health:CreateFontString(nil, "OVERLAY")
	ressourceText:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
	ressourceText:SetPoint("CENTER", ressource, "CENTER", 0, -19)
	ressourceText:SetText("Ressource") 
	-- Création de la frame de fond des ressources
	local ressourceFrame = CreateFrame("Frame", nil, ressource)
	ressourceFrame:SetSize(100, 50)  -- Définit la taille de la frame
	ressourceFrame:SetPoint("RIGHT", 100, 0)  -- Positionne la frame au centre de l'écran
	-- Création de la texture de fond
	local bg = ressourceFrame:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()  -- Fait en sorte que la texture remplisse toute la frame
	bg:SetColorTexture(0, 0, 0, 0.5)  -- Définit la texture comme transparente
	local ressourceValueText = CreateFrame("EditBox", nil, ressourceFrame, "InputBoxTemplate")
	ressourceValueText:SetMultiLine(true)
	ressourceValueText.Left:Hide()
	ressourceValueText.Middle:Hide()
	ressourceValueText.Right:Hide()
	ressourceValueText:SetWidth(100)
	ressourceValueText:SetHeight(50)
	ressourceValueText:SetPoint("CENTER", 0, 0)
	ressourceValueText:SetAutoFocus(false)
	ressourceValueText:SetText(ressourceValue)
	ressourceValueText:SetFont("Fonts\\FRIZQT__.TTF", 25, "OUTLINE")
	ressourceValueText:SetScript("OnEditFocusLost", function(self)
		ressourceValue = ressourceValueText:GetText()
	end)

	------------------------
	--  COMMANDE SYSTEME  --
	------------------------

	-- Commande pour afficher la fenêtre
	SLASH_SKILLSHEET1 = "/skill"
	SlashCmdList["SKILLSHEET"] = function(msg)
		SkillFrame:Show()
	end
	
end)