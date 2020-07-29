<#
    Great thanks go out to Dustin Higgins for the two functions included here
    I have uploaded them to GitHub with his permission.

    Please catch up with him at:
    Linkedin: https://www.linkedin.com/in/dustin-higgins/
    GitHub: https://github.com/dohiggins

    How did I originally find this?
    Source: https://www.dhb-scripting.com/Forums/posts/t36-Cable-Modem-Power-Cycle-with-Wemo-and-PowerShell
    Author Page: https://www.dhb-scripting.com/Forums/profile/5-Dustin-Higgins

    Check them out... great resource!
#>

function Set-WemoOn {
    <#
    .SYNOPSIS
    Turns on a Wemo switch
    .DESCRIPTION
    Turns on a Wemo switch
    #>
    param (
        [Parameter(Mandatory=$true)]
        [string]$ipAddress
    )
    # Set the URL
    $url = "http://" + $ipAddress + ":49153/upnp/control/basicevent1"
    # Set the body
    $body = @"
<?xml version="1.0" encoding="utf-8"?>
<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
    <s:Body>
        <u:SetBinaryState xmlns:u="urn:Belkin:service:basicevent:1">
            <BinaryState>1</BinaryState>
        </u:SetBinaryState>
    </s:Body>
</s:Envelope>
"@
    # Send the Request
    $result = Invoke-WebRequest -Uri $url -Body $body -ContentType "text/xml" -Method POST -Headers @{"SOAPACTION" = "`"urn:Belkin:service:basicevent:1#SetBinaryState`""}
    # Return the result
    return $result
}

function Set-WemoOff {
    <#
    .SYNOPSIS
    Turns off a Wemo Switch
    .DESCRIPTION
    Turns off a Wemo Switch
    #>
    param (
        [Parameter(Mandatory=$true)]
        [string]$ipAddress
    )
    # Set the URL
    $url = "http://" + $ipAddress + ":49153/upnp/control/basicevent1"
    # Set the body
    $body = @"
<?xml version="1.0" encoding="utf-8"?>
<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
    <s:Body>
        <u:SetBinaryState xmlns:u="urn:Belkin:service:basicevent:1">
            <BinaryState>0</BinaryState>
        </u:SetBinaryState>
    </s:Body>
</s:Envelope>
"@
    # Send the request
    $result = Invoke-WebRequest -Uri $url -Body $body -ContentType "text/xml" -Method POST -Headers @{"SOAPACTION" = "`"urn:Belkin:service:basicevent:1#SetBinaryState`""}
    # Return the result
    return $result
}