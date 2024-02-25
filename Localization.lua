local _, core = ...
core.Locales = {}

local L = core.Locales


L["frFR"] = {
	["SkillSheet is loaded"] = " |cFF808080est chargé. Pour ouvrir le panneau, utilisez le bouton de la minimap. Plus d'options en tapant /skillsheet",
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
	["Marker Sync?"] = "Activer le mode MJ",
	["Marker Sync Tooltip"] = "En cochant cette case, vous enverrez vos marqueurs à tous les autres joueurs du groupe, écrasant les leurs s'ils en avaient",
	["Keep Secret?"] = "Garder secret",
	["Keep Secret Tooltip"] = "Si coché, le marqueur ne sera pas envoyé aux joueurs",
	["Command Usage"] = "Liste des commandes :",
	["Export"] = "Exportation de la fiche",
	["SkillSheet Export"] = "/SkillSheet Export - Fonction d'export de fiche de personnage",
	["How to export"] = "Entrez ctrl+c pour copier le contenu du cadre",
	["Skillsheet Reset"] = "/SkillSheet Reset - Supprime toutes les entrées de la fiche de personnage",
	["Skills deleted"] = "Vos pages de compétences ont été supprimées !",
	["SkillSheet Import"] = "/SkillSheet Import - Fonction d'import de fiche de personnage",
	["Import"] = "Importation de la fiche",
	["How to import"] = "Collez ici les données à importer",
	["Data Imported"] = "La fiche de personnage a été importée avec succès",
	["Marker Transparent Tooltip"] = "Cochez cette case pour rendre le panneau translucide. Les options de gestion des marqueurs ne seront plus disponibles.",
	["Marker Trans?"] = "Rendre translucide",
	["Announcement"] = [[SkillSheet devient |cFF7cfc00DMTools|r !

Vous pouvez dès à présent installer |cFF7cfc00DMTools|r depuis Curse Forge.

Pour conserver vos données vous pouvez :

- Soit exporter votre fiche via la fonction /SkillSheet export, installer |cFF7cfc00DMTools|r, et importer la fiche via la fonction /DMTools import.
- Soit installer |cFF7cfc00DMTools|r et le lancer en même temps que SkillSheet. |cFF7cfc00DMTools|r héritera alors de vos données SkillSheet.

N'oubliez pas de désinstaller SkillSheet une fois que vous aurez migré sur |cFF7cfc00DMTools|r.

Pourquoi changer de nom ?

L'add-on a parcouru une longue route en peu de temps. Lui qui avait pour vocation de n'offrir qu'une fiche de compétences adaptable s'est transformé en véritable outil multifonctions pour maître de jeu et joueurs, incluant bien sûr la fiche de personnage, mais également un affichage des jets et des résultats, un partage en temps réel des points de vie et de ressources, une gestion des tours joueurs, ennemis et libres, un panneau de contrôle des marqueurs, etc. 

Avec tout cela (et peut être davantage à venir), le nom de l'add-on n'est plus vraiment représentatif de ce qu'il propose.

Il est encore temps de revoir le nom de l'add-on afin qu'il reflète davantage son usage, et son nouveau nom est |cFF7cfc00DMTools|r (Dungeon Master Tools).

Merci à tous pour le soutient apporté, et à bientôt sur |cFF7cfc00DMTools|r !]]
		}
	
L["enUS"] = {
	["SkillSheet is loaded"] = " |cFF808080is loaded. For opening the interface, use the command minimap button. You can access to more functions with /skillsheet",
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
	["Marker Sync?"] = "Activate GM mode",
	["Marker Sync Tooltip"] = "If checked, your markers will be sent to other players of the party and override theirs markers",
	["Keep Secret?"] = "Keep secret",
	["Keep Secret Tooltip"] = "If checked, the marker will not be sent to the players",
	["Command Usage"] = "Command usage:",
	["Export"] = "Character Sheet Export",
	["SkillSheet Export"] = "/SkillSheet Export - Character Sheet export function",
	["How to export"] = "Use ctrl+c for copy the data below",
	["Skillsheet Reset"] = "/SkillSheet Reset - Delete all the character sheet data",
	["Skills deleted"] = "Your skill pages has been deleted!",
	["SkillSheet Import"] = "/SkillSheet Import - Character Sheet import function",
	["Import"] = "Character Sheet Import",
	["How to import"] = "Past here the data to import",
	["Data Imported"] = "The character sheet has been imported successfully",
	["Marker Transparent Tooltip"] = "Check this for making the panel translucent. The marker options will be unavailable",
	["Marker Trans?"] = "Makes translucid",
	["Announcement"] = [[SkillSheet becomes |cFF7cfc00DMTools|r!

You can now install |cFF7cfc00DMTools|r from Curse Forge.

To keep your data you can:

- Either export your sheet via the /SkillSheet export function, install |cFF7cfc00DMTools|r, and import the sheet via the /DMTools import function.
- Or install |cFF7cfc00DMTools|r and launch it at the same time as SkillSheet. |cFF7cfc00DMTools|r will then inherit your SkillSheet data.

Don't forget to uninstall SkillSheet once you have migrated to |cFF7cfc00DMTools|r.

Why change the name?

The add-on has come a long way in a short time. What was originally intended to offer only an adaptable skill sheet has transformed into a true multifunctional tool for game masters and players, including of course the character sheet, but also a display of rolls and results, real-time sharing of health points and resources, management of player, enemy and free turns, a control panel for markers, etc.

With all this (and perhaps more to come), the name of the add-on is no longer really representative of what it offers.

There is still time to review the name of the add-on so that it reflects its use more, and its new name is |cFF7cfc00DMTools|r (Dungeon Master Tools).

Thank you all for the support provided, and see you soon on |cFF7cfc00DMTools|r!]]
 		}
	
    -- Ajoutez d'autres langues ici...