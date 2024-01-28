-- Gestion de la localisation
local _, core = ...
local L = core.Locales[GetLocale()] or core.Locales["enUS"]
local version = GetAddOnMetadata("SkillSheet", "Version")

--------------------------------------------
-- ATTENTE DU CHARGEMENT DE LA SAUVEGARDE --
--------------------------------------------
local f = CreateFrame("Frame")
f:RegisterEvent("VARIABLES_LOADED")
f:SetScript("OnEvent", function(self, event)
	if markers == nil then
		markers = {}
		for i = 1, 8 do
			table.insert(markers, {name = "", power = "", health = "", description = ""})
		end
	end

    --------------------------
    -- INTERFACE PRINCIPALE --
    --------------------------
    -- Création du cadre
    local MarkerFrame = CreateFrame("Frame", "MarkerFrame", UIParent, "ButtonFrameTemplate")
    MarkerFrame:SetTitle(L["SkillSheet NPC"])
    MarkerFrame:SetPortraitToAsset("Interface\\ICONS\\inv_inscription_runescrolloffortitude_yellow")
    MarkerFrame:SetSize(380, 420) -- Largeur, Hauteur
    MarkerFrame:SetPoint("RIGHT", -300, 60) -- Position sur l'écran
    MarkerFrame:EnableMouse(true)
    MarkerFrame:SetMovable(true)
    MarkerFrame:RegisterForDrag("LeftButton")
    MarkerFrame:SetScript("OnDragStart", MarkerFrame.StartMoving)
    MarkerFrame:SetScript("OnDragStop", MarkerFrame.StopMovingOrSizing)
    MarkerFrame:SetFrameStrata("LOW")
    MarkerFrame.Inset:Hide()
    MarkerFrame:Hide() -- A réactiver en PROD

    -- Création des entête de compétence du volet principal
    local tableHeaders = MarkerFrame:CreateFontString(nil, "OVERLAY")
    tableHeaders:SetFontObject("GameFontNormal")
    tableHeaders:SetPoint("TOPLEFT", 65, - 35)
    tableHeaders:SetText(L["Marker Table Header"])

    -- Création de la ligne de séparation haute
	local line = MarkerFrame:CreateTexture(nil, "BACKGROUND")
	line:SetHeight(2)  -- Définit l'épaisseur de la ligne
	line:SetWidth(MarkerFrame:GetWidth())  -- Définit la largeur de la ligne
	line:SetPoint("TOPLEFT", 0, - 50)  -- Positionne la ligne au centre de la frame
	line:SetColorTexture(1, 1, 1, 0.2)  -- Définit la couleur de la ligne (ici, blanc semi-transparent)

    -- Création de la ligne de séparation basse
	local line = MarkerFrame:CreateTexture(nil, "BACKGROUND")
	line:SetHeight(2)  -- Définit l'épaisseur de la ligne
	line:SetWidth(MarkerFrame:GetWidth())  -- Définit la largeur de la ligne
	line:SetPoint("TOPLEFT", 0, - 380)  -- Positionne la ligne au centre de la frame
	line:SetColorTexture(1, 1, 1, 0.2)  -- Définit la couleur de la ligne (ici, blanc semi-transparent)

    for i = 1, 8 do
        
        local icon = MarkerFrame:CreateTexture(nil, "OVERLAY")
        icon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_" .. i)
        icon:SetPoint("TOPLEFT", 10, -40 * i -20)
        icon:SetSize(30, 30)
        icon:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                ChatFrame1EditBox:Insert("{rt" .. i .. "}")
                ChatFrame1EditBox:Show()
            end
        end)
        
        -- Nom du marqueur
        local MarkerName = MarkerFrame:CreateFontString(nil, "OVERLAY")
        MarkerName:SetFontObject("GameFontNormal")
        MarkerName:SetPoint("TOPLEFT", 50, -40 * i - 30)
        MarkerName:SetText("|cFFFFFFFF" .. markers[i].name)
        MarkerName:SetFontObject("GameFontNormal")
        skillSheetMarkerNames[i] = MarkerName

        -- Puissance du marqueur
        local MarkerPower = MarkerFrame:CreateFontString(nil, "OVERLAY")
        MarkerPower:SetFontObject("GameFontNormal")
        MarkerPower:SetPoint("TOPLEFT", 205, -40 * i - 30)
        MarkerPower:SetText("|cFFFFFFFF" .. markers[i].power)
        MarkerPower:SetFontObject("GameFontNormal")
        skillSheetMarkerPowers[i] = MarkerPower

        -- Santé du marqueur
        local MarkerHealth = MarkerFrame:CreateFontString(nil, "OVERLAY")
        MarkerHealth:SetFontObject("GameFontNormal")
        MarkerHealth:SetPoint("TOPLEFT", 280, -40 * i - 30)
        MarkerHealth:SetText("|cFFFFFFFF" .. markers[i].health)
        MarkerHealth:SetFontObject("GameFontNormal")
        skillSheetMarkerHealth[i] = MarkerHealth

        -- Description du marqueur
        skillSheetMarkerDescription[i] = markers[i].description

        -- Bouton d'édition
		SkillSheetEditIsOpened = false
		local editButton = CreateFrame("Button", nil, MarkerFrame, "GameMenuButtonTemplate")
		editButton:SetPoint("TOPLEFT", 350, -40 * i - 25)
		editButton:SetSize(25, 25)
		editButton:SetText("?")
        editButton:SetScript("OnClick", function()
            if SkillSheetEditIsOpened == false then
                SkillSheetEditIsOpened = true
                -- Création de la fenêtre d'édition de compétence
                local editFrame = CreateFrame("Frame", "editFrame", UIParent, "ButtonFrameTemplate")
                editFrame:SetTitle(L["Marker Details"])
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
                local icon = editFrame:CreateTexture(nil, "OVERLAY")
                icon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_" .. i)
                icon:SetPoint("TOPLEFT", 13 , -30)
                icon:SetSize(40, 40)
                -- Zone de texte pour le nom du marqueur
				local editMarkerName = editFrame:CreateFontString(nil, "OVERLAY")
				editMarkerName:SetFontObject("GameFontNormal")
				editMarkerName:SetPoint("TOPLEFT", 61, -30)
				editMarkerName:SetText(L["Marker Name"])
				-- Zone de saisie pour le nom du marqueur
				local markerNameBox = CreateFrame("EditBox", nil, editFrame, "InputBoxTemplate")
				markerNameBox:SetSize(130, 20)
				markerNameBox:SetPoint("TOPLEFT", 65, -50)
				markerNameBox:SetAutoFocus(false)
				markerNameBox:SetText(markers[i].name)
				markerNameBox:SetMaxLetters(25)
                -- Zone de texte pour la puissance du marqueur
				local markerPowerText = editFrame:CreateFontString(nil, "OVERLAY")
				markerPowerText:SetFontObject("GameFontNormal")
				markerPowerText:SetPoint("TOPLEFT", 220, -30)
				markerPowerText:SetText(L["Marker Power"])
				-- Zone de saisie pour la puissance
				local markerPowerBox = CreateFrame("EditBox", nil, editFrame, "InputBoxTemplate")
				markerPowerBox:SetSize(70, 20)
				markerPowerBox:SetPoint("TOPLEFT", 222, -50)
				markerPowerBox:SetAutoFocus(false)
				markerPowerBox:SetText(markers[i].power)
				markerPowerBox:SetMaxLetters(12)
                -- Zone de texte pour la santé
				local markerHealthText = editFrame:CreateFontString(nil, "OVERLAY")
				markerHealthText:SetFontObject("GameFontNormal")
				markerHealthText:SetPoint("TOPLEFT", 318, -30)
				markerHealthText:SetText(L["Health"])
				-- Zone de saisie pour la santé
				local markerHealthBox = CreateFrame("EditBox", nil, editFrame, "InputBoxTemplate")
				markerHealthBox:SetSize(70, 20)
				markerHealthBox:SetPoint("TOPLEFT", 320, -50)
				markerHealthBox:SetAutoFocus(false)
				markerHealthBox:SetText(markers[i].health)
				markerHealthBox:SetMaxLetters(10)
                -- Zone de texte pour la description
				local markerDescriptionText = editFrame:CreateFontString(nil, "OVERLAY")
				markerDescriptionText:SetFontObject("GameFontNormal")
				markerDescriptionText:SetPoint("TOPLEFT", 10, -80)
				markerDescriptionText:SetText(L["Marker Description"])
				-- Création de la frame de fond pour la description
				local markerDescriptionBackground = CreateFrame("Frame", nil, editFrame)
				markerDescriptionBackground:SetSize(380, 195)  -- Définit la taille de la frame
				markerDescriptionBackground:SetPoint("TOPLEFT", 13, -100)  -- Positionne la frame au centre de l'écran
				-- Création de la texture de fond
				local bg = markerDescriptionBackground:CreateTexture(nil, "BACKGROUND")
				bg:SetAllPoints()  -- Fait en sorte que la texture remplisse toute la frame
				bg:SetColorTexture(0, 0, 0, 0.5)  -- Définit la texture comme transparente
				-- Zone de saisie pour la description de la compétence
				local markerDescriptionBox = CreateFrame("EditBox", nil, editFrame, "InputBoxTemplate")
				markerDescriptionBox:SetMultiLine(true)
				markerDescriptionBox.Left:Hide()
				markerDescriptionBox.Middle:Hide()
				markerDescriptionBox.Right:Hide()
				markerDescriptionBox:SetWidth(378)
				markerDescriptionBox:SetHeight(200)
				markerDescriptionBox:SetPoint("TOPLEFT", 15, -105)
				markerDescriptionBox:SetAutoFocus(false)
				markerDescriptionBox:SetText(markers[i].description)

                -- Bouton "Enregistrer"
				local saveButton = CreateFrame("Button", nil, editFrame, "GameMenuButtonTemplate")
				saveButton:SetPoint("TOPLEFT", 214, -300)
				saveButton:SetSize(180, 25)
				saveButton:SetText(L["Save"])
				saveButton:SetScript("OnClick", function()
					-- Enregistrement de la compétence ici
					local markerNameText = markerNameBox:GetText()
					local markerPowerText = markerPowerBox:GetText()
					local markerHealthText = markerHealthBox:GetText()
					local markerdescriptionText = markerDescriptionBox:GetText()
					-- Ajoutez le code pour enregistrer la compétence dans votre base de données locale ici
					markers[i].name = markerNameText
					markers[i].power = markerPowerText
					markers[i].health = markerHealthText
					markers[i].description = markerdescriptionText
					MarkerName:SetText("|cFFFFFFFF" .. markers[i].name)
					MarkerPower:SetText("|cFFFFFFFF" .. markers[i].power)
					MarkerHealth:SetText("|cFFFFFFFF" .. markers[i].health)
                    editFrame:Hide()
                    end)
				-- Bouton "Supprimer"
				local deleteButton = CreateFrame("Button", nil, editFrame, "GameMenuButtonTemplate")
				deleteButton:SetPoint("TOPLEFT", 10, -300)
				deleteButton:SetSize(120, 25)
				deleteButton:SetText(L["Delete"])
				deleteButton:SetScript("OnClick", function()
					markers[i].name = ""
					markers[i].power = ""
					markers[i].health = ""
					markers[i].description = ""
					MarkerName:SetText("|cFFFFFFFF" .. markers[i].name)
					MarkerPower:SetText("|cFFFFFFFF" .. markers[i].power)
					MarkerHealth:SetText("|cFFFFFFFF" .. markers[i].health)
                    editFrame:Hide()
				end)
                 -- Seulement si le joueur est chef de groupe ou raid assist
                 if UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") then
                    saveButton:Enable()
                    deleteButton:Enable()
                    markerSyncButton:Enable()
                 elseif UnitInRaid("player") or UnitInParty("player") then
                    saveButton:Disable()
                    deleteButton:Disable()
                    markerSyncButton:Disable()
                else
                    saveButton:Enable()
                    deleteButton:Enable()
                    markerSyncButton:Disable()
                end               
            end
        end)
    end
    -- Boutons de synchronisation des marqueurs
    local markerSync = false -- gère la synchronisation des marqueurs
    local markerSyncButton = CreateFrame("CheckButton", "markerSyncButton", MarkerFrame, "ChatConfigCheckButtonTemplate")
    markerSyncButton:SetPoint("TOPLEFT", 10, -389)
    markerSyncButton:SetChecked(markerSync)
    markerSyncButton.tooltip = L["Marker Sync Tooltip"]
    local markerSyncText = MarkerFrame:CreateFontString(nil, "OVERLAY")
    markerSyncText:SetFontObject("GameFontNormal")
    markerSyncText:SetPoint("TOPLEFT", 38, -395)
    markerSyncText:SetText(L["Marker Sync?"])
        if UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") then
            markerSyncButton:Enable()
        elseif UnitInRaid("player") or UnitInParty("player") then
            markerSyncButton:Disable()
        else
            markerSyncButton:Disable()
        end
    markerSyncButton:SetScript("OnClick", function(self)
        if self:GetChecked() then
            markerSync = true
        else
            markerSync = false
        end
    end)


    -- FONCTION D'ENVOI DES MARQUEURS
    if IsInRaid() then
		channel = "RAID"
	end
    local function sendMarkers()
        if markerSync == true then
            for i = 1 , 8 do
                C_Timer.After(i, function()
		            C_ChatInfo.SendAddonMessage("SkillSheet", "MARKERS@" .. i .. "@" .. markers[i].name .. "@" .. markers[i].power .. "@" .. markers[i].health .. "@" .. markers[i].description, channel)
                end)
            end
        end

	end

      
    -- Création du ticker
	local ticker = C_Timer.NewTicker(8, sendMarkers)
end)