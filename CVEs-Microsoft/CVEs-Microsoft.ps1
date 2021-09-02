#By: dirkan (@dirkanSYN) -> https://twitter.com/dirkanSYN

#Install-Module -Name msrcsecurityupdates -force
#Import-module MsrcSecurityUpdates

$MES = '2021-Jul'
$outFile = "C:\Temp\CVEs-SO-$MES-"+(Get-date -format yyyyMMdd)+".csv"

Write-host "Leyendo Datos 1..." -F Cyan

$Vulnerabilidades=@{}

$ID = Get-MsrcCvrfDocument -ID $MES 

Write-host "Procesando Datos 1..." -F Green

$listVul=$ID.Vulnerability

foreach ($item3 in $listVul)
{
    if ($item3 -ne $null)
    {
        $C=$item3.CVE
        $T=$item3.Title.Value
        if ($Vulnerabilidades[$C] -eq $null)
        {
            $Vulnerabilidades.add($C,$T)
        }
    }
}

$Vulnerabilidades

Write-host "Leyendo Datos 2..." -F Cyan

$ProductName = Get-MsrcCvrfAffectedSoftware -Vulnerability $id.Vulnerability -ProductTree $id.ProductTree 


$Report = $ProductName | Select CVE, CvssScoreSet, FullProductName, Impact  

$Products=@{}
$CVEs=@()

Write-host "Procesando Datos 2..." -F Green

foreach ($item in $Report)
{
    $CVE=$item.CVE
    $CVSS_Base=$item.CvssScoreSet.base
    $CVSS_Temporal=$item.CvssScoreSet.temporal
    $CVSS_Vector=$item.CvssScoreSet.vector
    if ($CVSS_Vector -ne $null)
    {
        if (($CVSS_Vector.contains("/E:P")) -or ($CVSS_Vector.contains("/E:F")) -or ($CVSS_Vector.contains("/E:H")))
        {
            $Exploit="EXISTE EXPLOIT"
        }
        else
        {
            $Exploit="NO EXISTE EXPLOIT"
        }
    }
    else 
    {
        $Exploit="-"
    }
    $Impact=$item.Impact
    $FPN=$item.FullProductName
    
    $CVEUnico = $CVE+";"+$Vulnerabilidades[$CVE]+";"+$CVSS_Base+";"+$CVSS_Temporal+";"+$Exploit+";"+$Impact+";"+$CVSS_Vector+";"+$FPN
    if ($CVEs -notcontains $CVEUnico)
    {
        $CVEs += $CVEUnico
    }
}


Write-host "Generando Fichero..." -F Yellow

"CVE;TITULO;CVSS BASE;CVSS TEMPORAL;EXPLOIT;IMPACTO;CVSS VECTOR;PRODUCTO"| Out-File $outFile 
$CVEs | Out-File $outFile -Append

