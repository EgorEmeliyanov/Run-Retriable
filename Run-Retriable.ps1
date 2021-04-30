function Run-Retriable {

    Param ([ScriptBlock] $command)

    $delays = @(0, 1, 1, 2, 3)
    $fatalErrors = @(422, 404)
    $tries = 0
 
    while ($tries -lt $delays.Count) {

        Start-Sleep -Seconds $delays[$tries] # kinda exponential backoff

        try {            

            & $command
            Return            

        } catch { 

            $tries++

            if (($tries -eq $delays.Count) -or ($fatalErrors -contains $_.Exception.Response.statuscode.value__)) {
                throw
            }
            
            Write-Host "Caught $($_.Exception.Message) retrying..."            
        }    
    }
}
