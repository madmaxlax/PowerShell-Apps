
#simplified from this PS script https://gallery.technet.microsoft.com/scriptcenter/d0670079-6158-4dc5-a9da-b261c70e4b7d 

$SleepTimeOut = 1200
#2700 seconds is 45 mins
#1200 is 20 mins


# specify who gets notified 
$notificationto = "FromEmail@gmail.com" 
# specify where the notifications come from 
$notificationfrom = "ToEmail@gmail.com" 
# specify the SMTP server 
$smtpserver = "smtp-eu.shell.com" 



#we're only testing MYSERVER
$_ = "MYSERVER" 
if(!(Test-Connection -ComputerName $_ -Count 2 -ea silentlycontinue))
{ 
    #Write-Host "Sleeping $SleepTimeOut seconds, then trying again" 
    sleep $SleepTimeOut
    if(!(Test-Connection -ComputerName $_ -Count 4 -ea silentlycontinue)) 
    { 
        # First time down create the list and send email 
        $currentTime = Get-date 
        $Body = "$_ has not responded to pings for "+$SleepTimeOut/60+" minutes as of $currentTime"  
        Send-MailMessage -Body "$body" -to $notificationto -from $notificationfrom -Subject "Host $_ is down" -SmtpServer $smtpserver 
        
    } 
} 
 
    
