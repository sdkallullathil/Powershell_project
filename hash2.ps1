



        # Calculate Hash from the target files and store in baseline.txt

        # Delete baseline.txt if there is already there.

        delete-baseline

        # Collect all the files in the target folder (make sure we are in the same folder)

        $files = Get-ChildItem -Path .\files
       
        # For each file, calculate the hashes and write to baseline.txt
        
        foreach ($f in $files) { 
            
            $hash = calculate-file-hash $f.FullName

            "$($hash.Algorithm)|$($hash.Hash)|$($hash.Path)" | Out-File -FilePath .\baseline.txt -Append
        
        }


        # Load file | Hash from the baseline file and store them in a dictionary

        # Create a Dictionary to store file and Hash

        $fileHashDict = @{}

        # Load file | Hash from the baseline file and store them in a dictionary

        $filePathHash = Get-Content -Path .\baseline.txt

        foreach ($f in $filePathHash) {
        
            $fileHashDict.add($f.split("|")[2],$f.split("|")[1])
        
        }



        
        # Check the file hash is not changing over time

        while ($true) {

                Start-Sleep -Seconds 10 

                $files = Get-ChildItem -Path .\files

                 
                # For each file, calculate the hashes and write to baseline.txt
        
                foreach ($f in $files) { 
            
                        $hash = calculate-file-hash $f.FullName

                        if ($fileHashDict[$hash.Path] -eq $null) {
                
                            # A new file is created

                            Write-Host "$($hash.Path) has been created"  -ForegroundColor Magenta

                
                        }

                        # Notify if a new file has been created

                        if ($fileHashDict[$hash.Path] -eq $hash.Hash) {
                
                            # file not changed

                            Write-Host "All Good"

                        }

                        else {
                
                            # File has been changed

                            Write-Host "$($hash.Path) has been changed"  -ForegroundColor Magenta
                
                        }
                
                
        
                }

                foreach ($key in $fileHashDict.keys) {
        
                    $baselinefileexist = Test-Path -Path $key

                    if (-Not $baselinefileexist) {
            
                        # File has been deleted

                        Write-host "$($key) has been deleted" -ForegroundColor Magenta
            
            
                    }
        
        
                }

        }



        # Function to calculate Hash

        Function calculate-file-hash($filepath) {
         
                 $filehash = Get-FileHash -Path $filepath -Algorithm SHA256

                 return $filehash

        }

        # Function to delete the baseline file if it already exist

        Function delete-baseline() {

            $exist = Test-Path -Path .\baseline.txt

            if ($exist) {
    
                Remove-Item -Path .\baseline.txt
    
            }

        }
