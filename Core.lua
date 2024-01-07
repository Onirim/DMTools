-- Gestion de la localisation
local _, core = ...
local L = core.Locales[GetLocale()] or core.Locales["enUS"]
local version = GetAddOnMetadata("SkillSheet", "Version")

-- Enregistrement du préfixe de l'addon
C_ChatInfo.RegisterAddonMessagePrefix("SkillSheet")

---------------
-- FONCTIONS --
---------------

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
		table.insert(MySkills, {id = i, name = "", roll = "", cost = ""})
		end
    end
	--------------------------
	-- INTERFACE PRINCIPALE --
	--------------------------

	-- Création du cadre
	local SkillFrame = CreateFrame("Frame", "SkillFrame", UIParent, "BasicFrameTemplateWithInset")
	SkillFrame:SetSize(460, 680) -- Largeur, Hauteur
	SkillFrame:SetPoint("LEFT", 50, 0) -- Position sur l'écran
	SkillFrame:EnableMouse(true)
	SkillFrame:SetMovable(true)
	SkillFrame:RegisterForDrag("LeftButton")
	SkillFrame:SetScript("OnDragStart", SkillFrame.StartMoving)
	SkillFrame:SetScript("OnDragStop", SkillFrame.StopMovingOrSizing)
	SkillFrame:Hide()

	-- Titre du cadre
	SkillFrame.title = SkillFrame:CreateFontString(nil, "OVERLAY")
	SkillFrame.title:SetFontObject("GameFontHighlight")
	SkillFrame.title:SetPoint("LEFT", SkillFrame.TitleBg, "LEFT", 5, 0)
	SkillFrame.title:SetText("Skill Sheet")


-- Création des boutons de compétence du volet principal

	for i = 1, 20 do
	
		-- Nom de la compétence
		local skillName = SkillFrame:CreateFontString(nil, "OVERLAY")
		skillName:SetFontObject("GameFontNormal")
		skillName:SetPoint("TOPLEFT", 10, -30 * i -10)
		skillName:SetText(MySkills[i].name)
	
		-- Valeur du dé
		local diceValue = SkillFrame:CreateFontString(nil, "OVERLAY")
		diceValue:SetFontObject("GameFontNormal")
		diceValue:SetPoint("TOPLEFT", 200, -30 * i -10)
		diceValue:SetText(MySkills[i].roll)
		
		-- Valeur du coût
		local costValue = SkillFrame:CreateFontString(nil, "OVERLAY")
		costValue:SetFontObject("GameFontNormal")
		costValue:SetPoint("TOPLEFT", 300, -30 * i -10)
		costValue:SetText(MySkills[i].cost)
	
		-- Bouton de roll
		local rollButton = CreateFrame("Button", nil, SkillFrame, "GameMenuButtonTemplate")
		rollButton:SetPoint("TOPLEFT", 350, -30 * i - 5)
		rollButton:SetSize(60, 25)
		rollButton:SetText("Roll")
		rollButton:SetScript("OnClick", function()
			-- Lancez le dé et annoncez le résultat ici
			print("Lancement du dé pour " .. MySkills[i].name .. " avec " .. MySkills[i].roll)
		end)
		if MySkills[i].name == "" and MySkills[i].roll == "" and MySkills[i].cost == "" then
			rollButton:Hide()
		end
		
		-- Bouton d'édition
		local editButton = CreateFrame("Button", nil, SkillFrame, "GameMenuButtonTemplate")
		editButton:SetPoint("TOPLEFT", 410, -30 * i - 5)
		editButton:SetSize(40, 25)
		editButton:SetText("Edit")
		editButton:SetScript("OnClick", function()
			 -- Création de la fenêtre d'édition de compétence
			local editFrame = CreateFrame("Frame", "editFrame", editButton, "BasicFrameTemplateWithInset")
			editFrame:SetSize(400, 120) -- Largeur, Hauteur
			editFrame:SetPoint("RIGHT", 420, -40) -- Position sur l'écran
			editFrame.title = editFrame:CreateFontString(nil, "OVERLAY")
			editFrame.title:SetFontObject("GameFontHighlight")
			editFrame.title:SetPoint("LEFT", editFrame.TitleBg, "LEFT", 5, 0)
			editFrame.title:SetText("Edition d'une compétence")
			-- Zone de texte pour le nom de la compétence
			local editSkillName = editFrame:CreateFontString(nil, "OVERLAY")
			editSkillName:SetFontObject("GameFontNormal")
			editSkillName:SetPoint("TOPLEFT", 10, -30)
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
			-- Bouton "Enregistrer"
			local saveButton = CreateFrame("Button", nil, editFrame, "GameMenuButtonTemplate")
			saveButton:SetPoint("TOPLEFT", 10, -80)
			saveButton:SetSize(180, 20)
			saveButton:SetText("Enregistrer")
			saveButton:SetScript("OnClick", function()
			-- Enregistrement de la compétence ici
			local skillNameText = skillNameBox:GetText()
			local diceValueText = diceValueBox:GetText()
			local costValueText = CostValueBox:GetText()
			print("Enregistrement de la compétence " .. skillNameText .. " avec " .. diceValueText)
				-- Ajoutez le code pour enregistrer la compétence dans votre base de données locale ici
				MySkills[i].name = skillNameText
				MySkills[i].roll = diceValueText
				MySkills[i].cost = costValueText
				skillName:SetText(MySkills[i].name)
				diceValue:SetText(MySkills[i].roll)
				costValue:SetText(MySkills[i].cost)
				if MySkills[i].name == "" and MySkills[i].roll == "" and MySkills[i].cost == ""  then
					rollButton:Hide()
					else 
					rollButton:Show()
				end
				editFrame:Hide()
			end)
		end)
		

	end
	


	------------------------
	--  COMMANDE SYSTEME  --
	------------------------

	-- Commande pour afficher la fenêtre
	SLASH_SKILLSHEET1 = "/skill"
	SlashCmdList["SKILLSHEET"] = function(msg)
		SkillFrame:Show()
	end
	
end)