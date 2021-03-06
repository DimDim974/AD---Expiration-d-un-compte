 Add-PSSnapin Quest.ActiveRoles.ADManagement
$cp = read-host « Entre le nom d ouverture de session Admin »
$pw = read-host « Entre ton mot de passe ADM » -AsSecureString
$dc = read-host « Entre le controleur de domaine »

$co = Connect-QADService –service $dc –ConnectionAccount $cp  -ConnectionPassword $pw

$username = read-host 'Entrez le CP'
$newdate = read-host 'Entrez la date'
Get-QADUSER $username | Set-QADUSER -AccountExpires (get-date).addDays(15)

# Le MDP n'expire jamais 
# -PasswordNeverExpires $true

# Changer le MDP a l'ouverture de session
# -UserMustChangePassword $false 

#Expiration dans les 6 prochains mois
#Set-QADUser user1 -accountExpires (get-date).addMonths(6)

#Expiration le 1/1/2010 - mm/dd/yyyy format
#Set-QADUser user1 -accountExpires "1/1/2010"