local _, core = ...
core.Locales = {}

local L = core.Locales


L["frFR"] = {
	["SkillSheet is loaded"] = " |cFF808080est chargé. Pour ouvrir le panneau, utilisez la commande /skill ou utilisez le bouton de la minimap.",
	["SkillSheet Character and GM"] = "SkillSheet : Fiche de personnage et interface MJ",
	["Open/Close PC panel button"] = "|cFF7cfc00Clic-gauche|r |cFFFFFFFF: Ouvrir/Fermer l'interface principale|r",
	["Open/Close NPC panel button"] = "|cFF7cfc00Clic-droit|r |cFFFFFFFF: Ouvrir/Fermer l'interface des marqueurs|r",
	["First Skill"] = "Attaque simple",
	["First Roll"] = "1d100+10",
	["First Cost"] = "1d6",
	["First Description"] = "Cet add-on est prévu pour fonctionner en groupe ou en raid, dans ce cas tous les joueurs doivent l'avoir installé. Hors d'un groupe, les lancers de dés sont affichée dans le canal emotes.\n\nVous pouvez utiliser des formules du type 1d100, 1d20 ou encore 3d6 pour vos dés et ressources, ainsi qu'un modificateur comme 1d20+5 ou 2d6-2. Les autres types de valeurs ne seront pas interprétées comme des jets de dés, mais sont acceptées. Essayez avec un dé à réussite \"automatique\" ou avec un effet/coût à \"aucun\" ou \"1/jour\" par exemple !",
	["Second Skill"] = "Boire une potion de soin",
	["Second Roll"] = "automatique",
	["Second Cost"] = "1d8+1",
	["Second Description"] = "Certaines actions pourraient être réussies automatiquement, et apporter des avantages au personnage, comme de la santé ou des points de ressources. N'hésitez pas à faire des tests pour trouver votre propre façon d'utiliser ces champs !\n\nDans notre exemple, boire une potion de soin rapporte 1d8+1 points de santé.",
	["Third Skill"] = "Défense",
	["Third Roll"] = "1d100",
	["Third Cost"] = "aucun",
	["Third Description"] = "Maintenant, c'est à vous de créer vos propres compétences, en accord avec le système de jeu de votre MJ préféré !\n\nBonnes aventures avec SkillSheet !",
	["Skill Table Header"] = "Compétence                               Jet                     Effet/Coût",
	["GM Table Header"] = "Personnage                 Compétence                         Jet                 Effet/Coût           Santé      Ressource",
	["Roll"] = "Roll",
	["use the skill"] = "utilise la compétence ",
	[", Roll "] = ", Jet ",
	[", cost "] = ", effet/coût ",
	["Skill Edit"] = "Modifier la compétence",
	["Skill Name"] = "Nom de la compétence",
	["Dice"] = "Jet/Valeur",
	["Cost"] = "Effet/Coût",
	["Skill Description"] = "Description de la compétence",
	["Save"] = "Enregistrer",
	["GM Screen"] = "Interface MJ",
	["Health"] = "Santé",
	["Resource"] = "Ressource",
	["Delete"] = "Supprimer",
	["Player Turn"] = "Tour joueur",
	["Enemy Turn"] = "Tour ennemi",
	["Free Turn"] = "Tour libre",
	["Confirm new turn"] = "Voulez-vous vraiment démarrer un nouveau tour joueur ?",
	["Yes"] = "Oui",
	["No"] = "Non",
	["has started a new turn"] = " a démarré un nouveau tour pour les joueurs !",
	["has started a new enemy turn"] = " a démarré un nouveau tour ennemi !",
	["has started a new free turn"] = " a démarré un nouveau tour libre !",
	["Confirm new enemy turn"] = "Voulez-vous vraiment démarrer un nouveau tour ennemi ?",
	["Confirm new free turn"] = "Voulez-vous vraiment démarrer un nouveau tour libre ?",
	["Output Channel"] = "Canal de sortie",
	["You need to be leader or assist"] = "Vous devez être chef de groupe/raid ou assistant de raid",
	["Category?"] = "Catégorie ?",
	["Category? Tooltip"] = "Si la case est cochée, le nom de compétence servira de séparateur de catégorie.",
	["SkillSheet NPC"] = "SkillSheet : Panneau des marqueurs",
	["Marker Table Header"] = "Nom                           Puissance    Santé",
	["Marker Details"] = "Détails du marqueur",
	["Marker Name"] = "Nom du marqueur",
	["Marker Power"] = "Puissance",
	["Marker Description"] = "Description",
	["Marker Sync?"] = "Activer la synchronisation des marqueurs",
	["Marker Sync Tooltip"] = "En cochant cette case, vous enverrez vos marqueurs à tous les autres joueurs du groupe, écrasant les leurs s'ils en avaient",
	["Keep Secret?"] = "Garder secret",
	["Keep Secret Tooltip"] = "Si coché, le marqueur ne sera pas envoyé aux joueurs"
		}
	
L["enUS"] = {
	["SkillSheet is loaded"] = " |cFF808080is loaded. For opening the interface, use the command /skill",
	["SkillSheet Character and GM"] = "SkillSheet: character sheet and GM panel",
	["Open/Close PC panel button"] = "|cFF7cfc00Left-click|r |cFFFFFFFF: Open/Close the main interface|r",
	["Open/Close NPC panel button"] = "|cFF7cfc00Right-click|r |cFFFFFFFF: Open/Close the markers interface|r",
	["First Skill"] = "Simple attack",
	["First Roll"] = "1d100+10",
	["First Cost"] = "1d6",
	["First Description"] = "This add-on is designed to work in a group or raid, in which case all players must have it installed. Outside of a group, dice rolls are displayed in the emote channel.\n\nYou can use formulas like 1d100, 1d20 or even 3d6 for your dice and resources, as well as a modifier like 1d20+5 or 2d6-2. Other types of values will not be interpreted as dice rolls, but are accepted. Try with a die for “automatic” success or with an effect/cost at “none” or “1/day” for example!",
	["Second Skill"] = "Drink a health potion",
	["Second Roll"] = "automatic",
	["Second Cost"] = "1d8+1",
	["Second Description"] = "Some actions could be automatically successful, and bring benefits to the character, such as health or resource points. Don't hesitate to do tests to find your own way of using these fields!\n\nIn our example, drinking a healing potion gives 1d8+1 health points.",
	["Third Skill"] = "Defense",
	["Third Roll"] = "1d100",
	["Third Cost"] = "nothing",
	["Third Description"] = "Now, it's up to you to create your own skills, in accordance with the game system of your favorite GM!\n\nGood adventures with SkillSheet!",
	["Skill Table Header"] = "Skill                                            Roll                   Effect/Cost",
	["GM Table Header"] = "Character                           Skill                               Roll              Effect/Cost          Health      Resource",
	["Roll"] = "Roll",
	["use the skill"] = "use the skill ",
	[", Roll "] = ", Roll ",
	[", cost "] = ", effect/cost ",
	["Skill Edit"] = "Skill Edit",
	["Skill Name"] = "Skill Name",
	["Dice"] = "Roll/Value",
	["Cost"] = "Effect/Cost",
	["Skill Description"] = "Skill Description",
	["Save"] = "Save",
	["GM Screen"] = "GM Screen",
	["Health"] = "Health",
	["Resource"] = "Resource",
	["Delete"] = "Delete",
	["Player Turn"] = "Player Turn",
	["Enemy Turn"] = "Enemy Turn",
	["Free Turn"] = "Free Turn",
	["Confirm new turn"] = "Do you really want to start a new player turn?",
	["Yes"] = "Yes",
	["No"] = "No",
	["has started a new turn"] = " has started a new player turn!",
	["has started a new enemy turn"] = "has started a new enemy turn!",
	["has started a new free turn"] = "has started a new free turn!",
	["Confirm new enemy turn"] = "Do you really want to start an enemy turn?",
	["Confirm new enemy turn"] = "Do you really want to start an free turn?",
	["Output Channel"] = "Output Channel", 
	["You need to be leader or assist"] = "You need to be a party/raid leader or a raid assist",
	["Category?"] = "Category?",
	["Category? Tooltip"] = "If checked, the skill name will be used as a category skill separator.",
	["SkillSheet NPC"] = "SkillSheet: markers control panel",
	["Marker Table Header"] = "Nom         Type        Santé       Niveau",
	["Marker Details"] = "Marker details",
	["Marker Name"] = "Marker Name",
	["Marker Power"] = "Power",
	["Marker Description"] = "Description",
	["Marker Sync?"] = "Activate marker syncronization",
	["Marker Sync Tooltip"] = "If checked, your markers will be sent to other players of the party and override theirs markers",
	["Keep Secret?"] = "Keep secret",
	["Keep Secret Tooltip"] = "If checked, the marker will not be sent to the players"
 		}
	
    -- Ajoutez d'autres langues ici...
