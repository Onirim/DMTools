-- Gestion de la localisation
local _, core = ...
local L = core.Locales[GetLocale()] or core.Locales["enUS"]
local version = GetAddOnMetadata("SkillSheet", "Version")

-- Enregistrement du préfixe de l'addon
C_ChatInfo.RegisterAddonMessagePrefix("SkillSheet")

---------------------------
--   VARIABLES DE JEU    --
---------------------------


----------------------------
--   MESSAGE D'ACCUEIL    --
----------------------------
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    print("|cFFdaa520SkillSheet " .. version .. L["SkillSheet is loaded"])
end)

--------------------------
-- INTERFACE PRINCIPALE --
--------------------------

-- Création du cadre
local SkillFrame = CreateFrame("Frame", "SkillFrame", UIParent, "BasicFrameTemplateWithInset")
SkillFrame:SetSize(340, 600) -- Largeur, Hauteur
SkillFrame:SetPoint("CENTER") -- Position sur l'écran
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

-- Tableau des compétences
local skillTable = {
    {name = "Compétence 1", roll = "1d20"},
    {name = "Compétence 2", roll = "1d6"},
	{name = "Compétence 3", roll = "1d20"},
    {name = "Compétence 4", roll = "1d6"},
	{name = "Compétence 5", roll = "1d6"},
    -- Ajoutez plus de compétences ici
};

-- Création des boutons de compétence
for i, skill in ipairs(skillTable) do
    -- Nom de la compétence
    local skillName = SkillFrame:CreateFontString(nil, "OVERLAY")
    skillName:SetFontObject("GameFontNormal")
    skillName:SetPoint("TOPLEFT", 10, -30 * i)
    skillName:SetText(skill.name)

    -- Valeur du dé
    local diceValue = SkillFrame:CreateFontString(nil, "OVERLAY")
    diceValue:SetFontObject("GameFontNormal")
    diceValue:SetPoint("TOPLEFT", 180, -30 * i)
    diceValue:SetText(skill.roll)

    -- Bouton de roll
    local rollButton = CreateFrame("Button", nil, SkillFrame, "GameMenuButtonTemplate")
    rollButton:SetPoint("TOPLEFT", 220, -30 * i + 4)
    rollButton:SetSize(35, 25)
    rollButton:SetText("Roll")
    rollButton:SetScript("OnClick", function()
        -- Lancez le dé et annoncez le résultat ici
        print("Lancement du dé pour " .. skill.name .. " avec " .. skill.roll)
    end)

    -- Bouton d'édition
    local editButton = CreateFrame("Button", nil, SkillFrame, "GameMenuButtonTemplate")
    editButton:SetPoint("TOPLEFT", 260, -30 * i + 4)
    editButton:SetSize(35, 25)
    editButton:SetText("Edit")
    editButton:SetScript("OnClick", function()
        -- Code d'édition ici
        print("Édition de " .. skill.name)
    end)
	
end



-----------------------------------
-- MODIFICATION D'UNE COMPETENCE --
-----------------------------------

-- Bouton d'ajout de compétence
local addButton = CreateFrame("Button", nil, SkillFrame, "GameMenuButtonTemplate")
addButton:SetPoint("TOPLEFT", 10, -30 * (#skillTable + 1) + 4) -- Positionne le bouton sous la dernière compétence
addButton:SetSize(20, 20)
addButton:SetText("+")
addButton:SetScript("OnClick", function()
    -- Création de la fenêtre d'ajout de compétence
    local addFrame = CreateFrame("Frame", "AddFrame", UIParent, "BasicFrameTemplateWithInset")
    addFrame:SetSize(200, 100) -- Largeur, Hauteur
    addFrame:SetPoint("CENTER") -- Position sur l'écran

    -- Zone de texte pour le nom de la compétence
    local skillNameBox = CreateFrame("EditBox", nil, addFrame, "InputBoxTemplate")
    skillNameBox:SetSize(180, 20)
    skillNameBox:SetPoint("TOPLEFT", 10, -30)
    skillNameBox:SetAutoFocus(false)

    -- Zone de texte pour la valeur du dé
    local diceValueBox = CreateFrame("EditBox", nil, addFrame, "InputBoxTemplate")
    diceValueBox:SetSize(180, 20)
    diceValueBox:SetPoint("TOPLEFT", 10, -60)
    diceValueBox:SetAutoFocus(false)

    -- Bouton "Enregistrer"
    local saveButton = CreateFrame("Button", nil, addFrame, "GameMenuButtonTemplate")
    saveButton:SetPoint("TOPLEFT", 10, -90)
    saveButton:SetSize(180, 20)
    saveButton:SetText("Enregistrer")
    saveButton:SetScript("OnClick", function()
        -- Enregistrement de la compétence ici
        local skillName = skillNameBox:GetText()
        local diceValue = diceValueBox:GetText()
        print("Enregistrement de la compétence " .. skillName .. " avec " .. diceValue)
        -- Ajoutez le code pour enregistrer la compétence dans votre base de données locale ici
    end)
end)


------------------------
--  COMMANDE SYSTEME  --
------------------------

-- Commande pour afficher la fenêtre
SLASH_SKILLSHEET1 = "/skill"
SlashCmdList["SKILLSHEET"] = function(msg)
    SkillFrame:Show()
end